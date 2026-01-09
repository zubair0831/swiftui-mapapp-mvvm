import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
        // Bhavani Island
        Location(
            name: "Bhavani Island",
            cityName: "Vijayawada",
            coordinates: CLLocationCoordinate2D(latitude: 16.50736, longitude: 80.60509),
            description: "Bhavani Island is one of the largest river islands in India, located on the Krishna River. It is a popular spot for leisure, boating, and nature activities in Vijayawada.",
            imageNames: [
                "rome-colosseum-1",
                "rome-colosseum-2",
                "rome-colosseum-3"
            ],
            link: "https://en.wikipedia.org/wiki/Bhavani_Island"
        ),
        
        // Prakasam Barrage
        Location(
            name: "Prakasam Barrage",
            cityName: "Vijayawada",
            coordinates: CLLocationCoordinate2D(latitude: 16.5094, longitude: 80.6325),
            description: "The Prakasam Barrage is a 1223.5-meter-long structure across the Krishna River that offers picturesque views and connects Vijayawada with Guntur. It is lit up beautifully at night.",
            imageNames: [
                "rome-pantheon-1",
                "rome-pantheon-2",
                "rome-pantheon-3"
            ],
            link: "https://en.wikipedia.org/wiki/Prakasam_Barrage"
        ),
        
        // Gandhi Hill
        Location(
            name: "Gandhi Hill",
            cityName: "Vijayawada",
            coordinates: CLLocationCoordinate2D(latitude: 16.5198, longitude: 80.6168),
            description: "Gandhi Hill is a memorial for Mahatma Gandhi with panoramic city views, a planetarium, and a library. It's a peaceful and educational spot in the heart of Vijayawada.",
            imageNames: [
                "rome-trevifountain-1",
                "rome-trevifountain-2",
                "rome-trevifountain-3"
            ],
            link: "https://en.wikipedia.org/wiki/Gandhi_Hill,_Vijayawada"
        ),
        
        // Vuyyuru Fields Viewpoint
        Location(
            name: "Vuyyuru Fields Viewpoint",
            cityName: "Vuyyuru",
            coordinates: CLLocationCoordinate2D(latitude: 16.3675, longitude: 80.8435),
            description: "Vuyyuru is well-known for its lush green paddy and sugarcane fields. This peaceful countryside view offers a refreshing break and photography opportunities.",
            imageNames: [
                "paris-eiffeltower-1",
                "paris-eiffeltower-2"
            ],
            link: "https://en.wikipedia.org/wiki/Vuyyuru"
        ),
        
        // VIT-AP University
        Location(
            name: "VIT-AP University",
            cityName: "Vijayawada",
            coordinates: CLLocationCoordinate2D(latitude: 16.4941, longitude: 80.4982),
            description: "VIT-AP University is a premier educational institute near Vijayawada. The modern campus features state-of-the-art infrastructure and a vibrant student community.",
            imageNames: [
                "paris-louvre-1",
                "paris-louvre-2",
                "paris-louvre-3"
            ],
            link: "https://vitap.ac.in"
        ),
    ]
}
