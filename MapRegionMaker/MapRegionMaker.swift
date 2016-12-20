//
//  MapRegionMaker.swift
//  MeckParks
//
//  Created by David Lari on 12/18/16.
//  Copyright © 2016 David Lari. All rights reserved.
//

import Foundation
import MapKit

/// Create an instance and add locations to generate a map region that encompasses all locations.
open class MapRegionMaker {
    
    private var minLatitude: CLLocationDegrees?
    private var maxLatitude: CLLocationDegrees?
    
    private var minLongitude: CLLocationDegrees?
    private var maxLongitude: CLLocationDegrees?
    
    public init() {
        //super.init()
    }
    
    
    /// If the computed region is smaller than *minimumRegionSize*, then *minimumRegionSize* will be used instead. Default is 0.01.
    public var minimumRegionSize = 0.01
    
    /// Region size will be padded by this factor. Default is 1.1 which pads 10%. Value of 1.2 would be 20%, etc.
    public var paddingFactor = 1.1
    
    /**
     Calculates and returns the map region needed to encompass all locations that have been added to the instance.
     
     ## Important Notes ##
     1. At least one valid location must hbe added prior to calling.
     2. minimumRegionSize property is the smallest region that will be returned and defaults to 0.01
     3. paddingFactor increases region size by a percentage. Default is 1.1 which adds 10%.     
     - returns: padded map region that encompasses all locations added to the instance.
     
    */
    public func getMapRegion() -> MKCoordinateRegion {
        if minLatitude != nil {

            let latitude = (minLatitude! + maxLatitude!) / 2
            let longitude = (minLongitude! + maxLongitude!) / 2
            
            let centerLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let latDelta = max( paddingFactor * abs(maxLatitude! - minLatitude!), minimumRegionSize)
            let lonDelta = max( paddingFactor * abs(maxLongitude! - minLongitude!), minimumRegionSize)

            let region = MKCoordinateRegion(center: centerLocation, span: MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta))

            return region
        }
        else {
            return MKCoordinateRegion()
        }
    }
    
    
    private func updateMinMax(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        
        initializeMinMax(latitude: latitude, longitude: longitude)
        
        // force unwrapping is okay here, because the above line insures they are non-nil.
        minLatitude = min(minLatitude!, latitude)
        maxLatitude = max(maxLatitude!, latitude)
        minLongitude = min(minLongitude!, longitude)
        maxLongitude = max(maxLongitude!, longitude)
        
    }
    
    
    /// Adds a single CLLocationCoordinate2D extracted from a
    /// CLLocation to the region maker instance.
    /// - parameter location: a single CLLocation
    public func add(location: CLLocation) {
        updateMinMax(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
    }
    
    /// Adds a single CLLocationCoordinate2D
    /// to the region maker instance.
    /// - parameter location: a single CLLocationCoordinate2D
    public func add(location: CLLocationCoordinate2D) {
        updateMinMax(latitude: location.latitude, longitude: location.longitude)
    }
    
    /// Adds all CLLocationCoordinate2D's extracted from a
    /// CLLocation array to the region maker instance.
    /// - parameter locations: an array of type CLLocation
    public func add(locations: [CLLocation]) {
        for location in locations {
            add(location: location)
        }
    }
    
    /// Adds all CLLocationCoordinate2D's from a CLLocationCoordinate2D
    /// array to the region maker instance.
    /// - parameter locations: an array of type CLLocationCoordinate2D
    public func add(locations: [CLLocationCoordinate2D]) {
        for location in locations {
            add(location: location)
        }
    }
    
    
    private func initializeMinMax(latitude: CLLocationDegrees, longitude: CLLocationDegrees ) {
        // if minLat is nil, we assume all are nil and initialize them to the passed values.
        if minLatitude == nil {
            minLatitude = latitude
            maxLatitude = latitude
            minLongitude = longitude
            maxLongitude = longitude
        }
        
    }
    
    
    
    
    
    
}
