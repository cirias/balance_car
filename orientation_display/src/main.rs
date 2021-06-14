use std::io::{self, BufRead};

use kiss3d::camera::FirstPerson;
use kiss3d::light::Light;
use kiss3d::nalgebra::{geometry::Translation3, Point3, UnitQuaternion, Vector3};
use kiss3d::window::Window;

fn main() {
    let eye = Point3::new(0.0f32, 0.3, 5.0);
    let at = Point3::origin();
    let mut camera = FirstPerson::new(eye, at);

    let mut window = Window::new("Orientation");
    let mut g = window.add_group();
    let mut c1 = g.add_cube(2.0, 0.2, 2.0);
    c1.set_color(1.0, 0.0, 0.0);
    c1.set_local_translation(Translation3::new(0.0, 0.2, 0.0));

    let mut c2 = g.add_cube(2.0, 0.2, 2.0);
    c2.set_color(0.0, 1.0, 0.0);

    window.set_light(Light::StickToCamera);

    let orientation = std::sync::Arc::new(std::sync::Mutex::new((0.0, 0.0)));
    let orientation_write = orientation.clone();

    std::thread::spawn(move || {
        let stdin = io::stdin();
        for line in stdin.lock().lines() {
            let line = match line {
                Ok(line) => line,
                Err(_) => continue,
            };
            let mut cols = line.split(",");
            let pitch = cols.next().and_then(|v| v.parse::<f32>().ok());
            let roll = cols.next().and_then(|v| v.parse::<f32>().ok());
            let (pitch, roll) = match pitch.zip(roll) {
                Some(v) => v,
                None => continue,
            };
            println!("pitch: {} roll: {}", pitch, roll);

            let mut o = orientation_write.lock().unwrap();
            o.0 = pitch;
            o.1 = roll;
        }
    });

    while !window.should_close() {
        window.render_with_camera(&mut camera);

        let (pitch, roll) = { orientation.lock().unwrap().clone() };

        g.set_local_rotation(UnitQuaternion::from_axis_angle(&Vector3::z_axis(), pitch));
        let roll_r = UnitQuaternion::from_axis_angle(&Vector3::x_axis(), roll);
        g.append_rotation(&roll_r);
    }
}
