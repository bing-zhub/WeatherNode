latitude = 120.21;
longtitude = 30.25;

sql = `insert into Location (latitude, longtitude) values(${latitude}, ${
    longtitude});`;
msg.topic = sql;
return msg;

var json = {
  'coord': {'lon': 120.21, 'lat': 30.25},
  'weather':
      [{'id': 701, 'main': 'Mist', 'description': 'mist', 'icon': '50n'}],
  'base': 'stations',
  'main': {
    'temp': 281.15,
    'pressure': 1023,
    'humidity': 81,
    'temp_min': 281.15,
    'temp_max': 281.15
  },
  'visibility': 2500,
  'wind': {'speed': 1.21, 'deg': 82.5013},
  'clouds': {'all': 76},
  'dt': 1551092400,
  'sys': {
    'type': 1,
    'id': 9651,
    'message': 0.0045,
    'country': 'CN',
    'sunrise': 1551047389,
    'sunset': 1551088502
  },
  'id': 1808926,
  'name': 'Hangzhou',
  'cod': 200
}



msg = {
  data: {
    basic: {

    },
    air: {

    }
  },
  topic: {

  },
  ids: {

  }
}

speed = 281.21;
direction = 281.15;

air = {
    'status': 'ok',
    'data': {
      'aqi': 160,
      'idx': 1437,
      'attributions': [
        {
          'url': 'http://113.108.142.147:20035/emcpublish/',
          'name':
              'China National Urban air quality real-time publishing platform (全国城市空气质量实时发布平台)'
        },
        {
          'url':
              'https://china.usembassy-china.org.cn/embassy-consulates/shanghai/air-quality-monitor-stateair/',
          'name': 'U.S. Consulate Shanghai Air Quality Monitor'
        },
        {
          'url': 'http://www.semc.gov.cn/',
          'name': 'Shanghai Environment Monitoring Center(上海市环境监测中心)'
        },
        {'url': 'https://waqi.info/', 'name': 'World Air Quality Index Project'}
      ],
      'city': {
        'geo': [31.2047372, 121.4489017],
        'name': 'Shanghai (上海)',
        'url': 'https://aqicn.org/city/shanghai'
      },
      'dominentpol': 'pm25',
      'iaqi': {
        'co': {'v': 6.4},
        'h': {'v': 69.4},
        'no2': {'v': 35.7},
        'o3': {'v': 26},
        'p': {'v': 1020.2},
        'pm10': {'v': 60},
        'pm25': {'v': 160},
        'so2': {'v': 3.1},
        'w': {'v': 0.2}
      },
      'time': {'s': '2019-02-25 20:00:00', 'tz': '+08:00', 'v': 1551124800},
      'debug': {'sync': '2019-02-25T21:53:27+09:00'}
    }
  }

  msg.ids.air = msg.payload.insertId;

  detail = "Mist";
  temp = msg.ids.temp;
  pressure= 1024;
  air_quality = msg.ids.air;
  location = msg.ids.location;
  wind = msg.ids.wind;
  
  sql = `insert into Weather (detail, temp, wind, pressure, air_quality, location, w_time) values(${detail}, ${temp},  ${wind}, ${pressure}, ${air_quality}, ${location}, now() );`;
  msg.topic = sql;
  return msg;