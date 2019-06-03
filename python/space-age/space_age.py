
def period(period_in_earth_years):
    def inner(self):
        return round( self.seconds 
                            / period_in_earth_years 
                            / 31557600, 
                    2)
    return inner

class SpaceAge(object):
    on_earth = period(1)
    on_mercury = period(0.2408467)
    on_venus = period(0.61519726)
    on_mars = period(1.8808158)
    on_jupiter = period(11.862615)
    on_saturn = period(29.447498)
    on_uranus = period(84.016846)
    on_neptune = period(164.79132)

    def __init__(self, seconds):
        self.seconds = seconds
    

