class SpaceData {
  static List<Map<String, String>> getPlanets() {
    return [
      {
        'name': 'Mercurio',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/4/4a/Mercury_in_true_color.jpg',
        'description': 'Mercurio es el planeta más cercano al Sol y el más pequeño del sistema solar.',
      },
      {
        'name': 'Venus',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/e/e5/Venus-real_color.jpg',
        'description': 'Venus es un planeta rocoso con una densa atmósfera rica en dióxido de carbono.',
      },
      {
        'name': 'Tierra',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/9/97/The_Earth_seen_from_Apollo_17.jpg',
        'description': 'Nuestro hogar, el tercer planeta desde el Sol.',
      },
      {
        'name': 'Marte',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/0/02/OSIRIS_Mars_true_color.jpg',
        'description': 'Marte es conocido como el planeta rojo por su color característico.',
      },
      {
        'name': 'Júpiter',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/e/e2/Jupiter.jpg',
        'description': 'Júpiter es el planeta más grande del sistema solar, con una gran mancha roja.',
      },
      {
        'name': 'Saturno',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/c/c7/Saturn_during_Equinox.jpg',
        'description': 'Saturno es famoso por sus impresionantes anillos compuestos de hielo y roca.',
      },
      {
        'name': 'Urano',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/3/3d/Uranus2.jpg',
        'description': 'Urano es un planeta helado con un eje de rotación inclinado casi completamente.',
      },
      {
        'name': 'Neptuno',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/5/56/Neptune_Full.jpg',
        'description': 'Neptuno es un gigante gaseoso azul, el planeta más lejano del sistema solar.',
      },
    ];
  }

  static List<Map<String, String>> getGalaxies() {
    return [
      {
        'name': 'Vía Láctea',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/e/e6/V%C3%ADa_L%C3%A1ctea_2021.jpg',
        'description': 'Nuestra galaxia hogar, una espiral barrada con más de 100 mil millones de estrellas.',
      },
      {
        'name': 'Andrómeda',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/5/57/M31-Andromede-16-09-2023-Hamois.jpg',
        'description': 'La galaxia espiral más cercana a la Vía Láctea, con la que colisionará en miles de millones de años.',
      },
      {
        'name': 'Galaxia del Triángulo',
        'image': 'https://science.nasa.gov/wp-content/uploads/2023/04/heic1901a-jpg.webp',
        'description': 'También conocida como M33, es una pequeña galaxia espiral en el grupo local.',
      },
      {
        'name': 'Galaxia del Sombrero',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/5/5e/M104_ngc4594_sombrero_galaxy_hi-res.jpg',
        'description': 'Una galaxia espiral con un núcleo brillante y un gran bulbo central, rodeado por polvo oscuro.',
      },
    ];
  }

  static List<Map<String, String>> getSatellites() {
    return [
      {
        'name': 'Luna',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/e/e1/FullMoon2010.jpg',
        'description': 'La Luna es el único satélite natural de la Tierra y el cuerpo celeste más cercano.',
      },
      {
        'name': 'Ío',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/7/7b/Io_highest_resolution_true_color.jpg',
        'description': 'Uno de los satélites de Júpiter, famoso por su intensa actividad volcánica.',
      },
      {
        'name': 'Titán',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/0/09/Two_Halves_of_Titan.png',
        'description': 'Titán es la mayor luna de Saturno y tiene una densa atmósfera de nitrógeno.',
      },
      {
        'name': 'Encélado',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/8/83/PIA17202_-_Approaching_Enceladus.jpg',
        'description': 'Encélado es una luna helada de Saturno con géiseres que expulsan agua desde su océano subterráneo.',
      },
      {
        'name': 'Ganímedes',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/2/21/Ganymede_-_Perijove_34_Composite.png',
        'description': 'Ganímedes, satélite de Júpiter, es la luna más grande del sistema solar.',
      },
    ];
  }
}
