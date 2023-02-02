
load MobileSensorData/sensorlog_20220420_174251.mat
lat=Position.latitude;
lon=Position.longitude;
spd=Position.speed;

load MobileSensorData/sensorlog_20220407_184831.mat
lat1=Position.latitude;
lon1=Position.longitude;
spd1=Position.speed;
lon1(4)=[];
lat1(4)=[];
nBins = 10;
binSpacing = (max(spd) - min(spd))/nBins; 
binRanges = min(spd):binSpacing:max(spd)-binSpacing; 

s = geoshape(lat,lon);
s1 = geoshape(lat1,lon1);

initlat = lat(1,1);
initlon = lon(1,1);
finallat = lat1(1,end);
finallon = lon1(1,end);
namestart = 'HIKER';
nameend = 'RANGER';

geoplot([lat(1) lat1(1)],[lon(1) lon1(1)],'g-*');
text(lat(1),lon(1),'HIKER');
text(lat1(1),lon1(1),'RANGER');

dist=deg2km(distance(lat(1),lon(1),lat1(1),lon1(1)))*1000;
time=((spd-spd1)/dist)/60;
str={'Approx. distance between HIKER & RANGER (in m) : ' num2str(dist) ,'Time Est. for RANGER to reach HIKER (in min): ' num2str(time) };
    
[latlim, lonlim] = geolimits;
latlim(2)*0.90
lonlim(1)*1.5

text(latlim(2),lonlim(1),str,'HorizontalAlignment','left','VerticalAlignment','top');










