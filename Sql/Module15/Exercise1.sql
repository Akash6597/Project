-- Script 15.1 Draw a square

USE tempdb;
GO

DECLARE @Shape GEOMETRY;
SET @Shape = GEOMETRY::STGeomFromText('POLYGON ((10 10, 10 40, 40 40, 40 10, 10 10))',0);
SELECT @Shape AS Square;
GO

-- Script 15.2 Try an invalid value - note the 6522 error and the wrapped 24306 error message
BEGIN TRY
  DECLARE @Shape GEOMETRY;
  SET @Shape = GEOMETRY::STPolyFromText('POLYGON((0 0,20 15,10 10,0 15,5 5))', 0);
END TRY
BEGIN CATCH
  SELECT ERROR_NUMBER() AS ErrorNumber,
         ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO

-- Script 15.3 Draw a more complex shape
DECLARE @Shape GEOMETRY;
SET @Shape = GEOMETRY::STGeomFromText('POLYGON ((10 10, 5 5,10 40, 40 40, 45 45,40 10, 10 10))',0);
SELECT @Shape AS ColoredArea;
GO

-- Script 15.4 Multiple shapes
DECLARE @Shape1 GEOMETRY, @Shape2 GEOMETRY;
SET @Shape1 = GEOMETRY::STGeomFromText('POLYGON ((10 10, 5 5,10 40, 40 40, 45 45,40 10, 10 10))',0);
SET @Shape2 = GEOMETRY::STGeomFromText('POLYGON ((60 25, 55 5,60 40, 90 40, 95 45,90 10, 60 25))',0);
SELECT @Shape1 AS Multishapes
UNION ALL
SELECT @Shape2;
GO

-- Script 15.5 Intersecting shapes
DECLARE @Shape1 GEOMETRY, @Shape2 GEOMETRY;
SET @Shape1 = GEOMETRY::STGeomFromText('POLYGON ((10 10, 5 5,10 40, 40 40, 45 45,40 10, 10 10))',0);
SET @Shape2 = GEOMETRY::STGeomFromText('POLYGON ((30 25, 25 5,30 40, 60 40, 65 45,60 20, 30 25))',0);
SELECT @Shape1 AS Overlapping
UNION ALL
SELECT @Shape2;
GO

-- Script 15.6 Union of the two shapes
DECLARE @Shape1 GEOMETRY, @Shape2 GEOMETRY;
SET @Shape1 = GEOMETRY::STGeomFromText('POLYGON ((10 10, 5 5,10 40, 40 40, 45 45,40 10, 10 10))',0);
SET @Shape2 = GEOMETRY::STGeomFromText('POLYGON ((30 25, 25 5,30 40, 60 40, 65 45,60 20, 30 25))',0);
SELECT @Shape1.STUnion(@Shape2) AS Unioned;
GO

-- Script 15.7 Intersection of shapes
DECLARE @Shape1 GEOMETRY, @Shape2 GEOMETRY;
SET @Shape1 = GEOMETRY::STGeomFromText('POLYGON ((10 10, 5 5,10 40, 40 40, 45 45,40 10, 10 10))',0);
SET @Shape2 = GEOMETRY::STGeomFromText('POLYGON ((30 25, 25 5,30 40, 60 40, 65 45,60 20, 30 25))',0);
SELECT @Shape1 AS Intersected
UNION ALL
SELECT @Shape2
UNION ALL
SELECT @Shape1.STIntersection(@Shape2);
GO

-- Script 15.8 Draw Australia
DECLARE @Australia geometry;
SET @Australia = geometry::STGeomFromText('MULTIPOLYGON (((146.91639709472656 -43.704837799072266, 
    145.92631530761719 -43.223194122314453, 145.4830322265625 -42.650703430175781, 
    145.38616943359375 -42.464195251464844, 145.82795715332031 -42.501945495605469, 
    145.07258605957031 -41.577156066894531, 144.90054321289063 -40.845218658447266, 
    146.58587646484375 -41.291374206542969, 147.80001831054688 -41.147617340087891, 
    148.25955200195313 -40.902679443359375, 148.47319030761719 -41.075611114501953, 
    148.52291870117188 -41.788833618164062, 148.12933349609375 -42.806430816650391, 
    147.34538269042969 -43.239715576171875, 146.91639709472656 -43.704837799072266)), 
    ((142.54121398925781 -10.898410797119141, 142.84793090820313 -11.07573413848877, 
    143.02713012695313 -11.901708602905273, 143.37675476074219 -12.104367256164551, 
    143.17445373535156 -12.517995834350586, 143.57481384277344 -12.796828269958496, 
    143.94683837890625 -14.448851585388184, 144.26838684082031 -14.575309753417969, 
    144.58901977539063 -14.352115631103516, 144.73284912109375 -14.650595664978027, 
    145.38800048828125 -15.030624389648438, 145.52920532226563 -16.473457336425781, 
    146.19784545898438 -17.49560546875, 146.12821960449219 -18.239631652832031, 146.52542114257813 
    -19.065319061279297, 147.61637878417969 -19.546205520629883, 148.17660522460938 -20.079109191894531, 
    148.90739440917969 -20.185646057128906, 148.77070617675781 -20.637355804443359, 149.30514526367188 
    -21.04315185546875, 149.76042175292969 -22.415578842163086, 150.22093200683594 -22.713462829589844, 
    150.1484375 -22.306673049926758, 150.89729309082031 -22.66114616394043, 151.00613403320313 
    -23.582916259765625, 151.93380737304688 -24.14051628112793, 152.27639770507813 -24.724786758422852, 
    152.52163696289063 -24.800580978393555, 152.68940734863281 -25.296232223510742, 153.03501892089844 
    -25.454490661621094, 153.27273559570313 -26.210777282714844, 153.29037475585938 -26.993001937866211, 
    153.14988708496094 -27.324020385742188, 153.60006713867188 -28.111736297607422, 153.69715881347656 
    -28.823896408081055, 153.14321899414063 -30.682428359985352, 153.17552185058594 -31.401203155517578, 
    152.37985229492188 -32.859695434570312, 151.96830749511719 -32.987766265869141, 151.56816101074219 
    -33.503929138183594, 150.96563720703125 -35.236156463623047, 150.4251708984375 -35.6771354675293, 
    150.18850708007813 -37.329910278320312, 149.91603088378906 -37.777362823486328, 148.24066162109375 
    -38.080898284912109, 147.02470397949219 -38.824363708496094, 146.50288391113281 -38.876548767089844, 
    146.72958374023438 -39.163665771484375, 145.73957824707031 -38.70556640625, 145.70791625976563 
    -38.424533843994141, 145.17349243164063 -38.048786163330078, 144.61477661132813 -38.228744506835938, 
    144.95124816894531 -38.438838958740234, 143.56846618652344 -38.9527587890625, 142.10769653320313 
    -38.41265869140625, 141.42892456054688 -38.439579010009766, 140.21568298339844 -37.624660491943359, 
    140.02616882324219 -37.229286193847656, 140.02934265136719 -36.578449249267578, 139.64814758300781 
    -36.024333953857422, 139.57157897949219 -35.5973014831543, 138.5560302734375 -35.8480339050293, 
    138.40083312988281 -35.739955902099609, 138.63349914550781 -35.535476684570312, 138.77128601074219 
    -34.910751342773438, 138.30516052246094 -34.339134216308594, 137.88699340820313 -35.313907623291016, 
    137.15071105957031 -35.455646514892578, 137.31202697753906 -35.053794860839844, 137.70594787597656 
    -35.008373260498047, 137.71554565429688 -34.442138671875, 138.11616516113281 -33.499790191650391, 
    138.39241027832031 -33.276569366455078, 138.0718994140625 -32.730152130126953, 138.02352905273438 
    -33.048313140869141, 137.66084289550781 -33.297161102294922, 137.27078247070313 -33.934112548828125, 
    136.30978393554688 -34.514995574951172, 135.91609191894531 -35.190467834472656, 134.91389465332031 
    -33.347339630126953, 134.41212463378906 -33.240230560302734, 134.31146240234375 -33.011432647705078, 
    134.44065856933594 -32.724918365478516, 134.04069519042969 -32.325000762939453, 133.32875061035156 
    -32.320106506347656, 132.90133666992188 -32.072917938232422, 132.38589477539063 -32.131229400634766, 
    131.48382568359375 -31.617877960205078, 129.38905334472656 -31.781232833862305, 127.46874237060547 
    -32.364013671875, 126.26261138916016 -32.417392730712891, 124.45204925537109 -33.127155303955078, 
    123.56221771240234 -34.025871276855469, 122.37458801269531 -34.161888122558594, 121.61318206787109 
    -33.953533172607422, 119.97515106201172 -34.103199005126953, 119.53349304199219 -34.562080383300781, 
    118.87643432617188 -34.588871002197266, 118.41074371337891 -35.073368072509766, 117.99697875976563 
    -35.195281982421875, 116.45505523681641 -35.0837516784668, 115.25058746337891 -34.405483245849609, 
    115.189453125 -33.737743377685547, 115.61216735839844 -33.749591827392578, 115.76168060302734 
    -33.558475494384766, 115.950927734375 -32.190639495849609, 115.26192474365234 -30.786540985107422, 
    115.11587524414063 -29.680290222167969, 114.83406066894531 -28.885986328125, 114.16830444335938 
    -28.016206741333008, 114.12889099121094 -27.367696762084961, 113.23877716064453 -26.145689010620117, 
    113.29524993896484 -26.040727615356445, 113.63665008544922 -26.555038452148438, 113.94303894042969 
    -26.649562835693359, 113.52482604980469 -25.673364639282227, 114.08432006835938 -26.4920597076416, 
    114.29875946044922 -26.521648406982422, 114.25409698486328 -26.271642684936523, 114.38450622558594 
    -26.254417419433594, 114.38618469238281 -26.000068664550781, 113.58287048339844 -24.596633911132812, 
    113.56556701660156 -24.26606559753418, 113.96568298339844 -23.464162826538086, 113.82909393310547 
    -22.548957824707031, 114.10423278808594 -22.02070426940918, 114.23101043701172 -22.503608703613281, 
    114.43566131591797 -22.598531723022461, 114.66001129150391 -22.076744079589844, 116.62245941162109 
    -20.820150375366211, 117.80059051513672 -20.741361618041992, 118.17213439941406 -20.454486846923828, 
    118.93798065185547 -20.300273895263672, 119.13991546630859 -20.007402420043945, 120.01618194580078 
    -20.100902557373047, 121.07581329345703 -19.659969329833984, 121.77999877929688 -18.685775756835938, 
    122.40011596679688 -18.226715087890625, 122.28913879394531 -17.381425857543945, 122.94200134277344 
    -16.566312789916992, 123.62236785888672 -17.562946319580078, 123.71196746826172 -17.092321395874023, 
    124.03050994873047 -17.231498718261719, 124.11570739746094 -16.957944869995117, 123.75660705566406 
    -16.678993225097656, 123.77950286865234 -16.373815536499023, 125.05001068115234 -16.513069152832031, 
    124.54142761230469 -16.245037078857422, 124.62816619873047 -15.640926361083984, 124.89231109619141 
    -15.449649810791016, 125.31279754638672 -15.607682228088379, 125.35932159423828 -14.7875337600708, 
    126.06686401367188 -14.677942276000977, 126.47202301025391 -14.054102897644043, 126.74971008300781 
    -14.333209991455078, 127.05709075927734 -13.766800880432129, 127.73275756835938 -14.178533554077148, 
    128.16622924804688 -14.686156272888184, 128.26980590820313 -15.359770774841309, 128.66252136230469 
    -14.869436264038086, 129.40008544921875 -14.975923538208008, 129.8359375 -15.261057853698731, 
    130.05227661132813 -14.802887916564941, 129.63021850585938 -14.288888931274414, 130.40965270996094 
    -13.467185020446777, 130.66716003417969 -12.741966247558594, 131.15493774414063 -12.613780975341797, 
    131.06253051757813 -12.429638862609863, 131.23200988769531 -12.251283645629883, 131.74357604980469 
    -12.383670806884766, 132.95478820800781 -12.152227401733398, 132.71826171875 -11.606078147888184, 
    132.22822570800781 -11.460931777954102, 132.40925598144531 -11.301631927490234, 133.13264465332031 
    -11.516201972961426, 133.76284790039063 -11.934375762939453, 134.96577453613281 -12.0462007522583, 
    135.33218383789063 -12.369593620300293, 135.85267639160156 -12.171424865722656, 136.29487609863281 
    -12.558222770690918, 136.50227355957031 -12.494205474853516, 136.63816833496094 -12.099803924560547, 
    136.9947509765625 -12.353300094604492, 136.67274475097656 -13.20579719543457, 136.03456115722656 
    -13.467802047729492, 136.168212890625 -13.874351501464844, 136.08430480957031 -14.186027526855469, 
    135.66123962402344 -14.66370964050293, 135.62026977539063 -14.956218719482422, 136.89080810546875 
    -16.008792877197266, 137.27737426757813 -16.014326095581055, 138.4639892578125 -16.825523376464844, 
    139.16641235351563 -16.976600646972656, 139.45198059082031 -17.414670944213867, 140.02192687988281 
    -17.744054794311523, 140.26387023925781 -17.813465118408203, 140.91120910644531 -17.614999771118164, 
    141.33607482910156 -16.940177917480469, 141.91496276855469 -15.209720611572266, 141.67181396484375 
    -14.7398042678833, 141.87205505371094 -14.097315788269043, 141.71598815917969 -13.792503356933594, 
    141.802490234375 -13.029497146606445, 142.12260437011719 -12.685539245605469, 141.88218688964844 
    -12.450845718383789, 142.32931518554688 -11.140419960021973, 142.54121398925781 -10.898410797119141
    )))',0);
SELECT @Australia AS Australia;
GO

-- Script 15.9 Draw Australia with a buffer around it
DECLARE @Australia geometry;
SET @Australia = geometry::STGeomFromText('MULTIPOLYGON (((146.91639709472656 -43.704837799072266, 
    145.92631530761719 -43.223194122314453, 145.4830322265625 -42.650703430175781, 
    145.38616943359375 -42.464195251464844, 145.82795715332031 -42.501945495605469, 
    145.07258605957031 -41.577156066894531, 144.90054321289063 -40.845218658447266, 
    146.58587646484375 -41.291374206542969, 147.80001831054688 -41.147617340087891, 
    148.25955200195313 -40.902679443359375, 148.47319030761719 -41.075611114501953, 
    148.52291870117188 -41.788833618164062, 148.12933349609375 -42.806430816650391, 
    147.34538269042969 -43.239715576171875, 146.91639709472656 -43.704837799072266)), 
    ((142.54121398925781 -10.898410797119141, 142.84793090820313 -11.07573413848877, 
    143.02713012695313 -11.901708602905273, 143.37675476074219 -12.104367256164551, 
    143.17445373535156 -12.517995834350586, 143.57481384277344 -12.796828269958496, 
    143.94683837890625 -14.448851585388184, 144.26838684082031 -14.575309753417969, 
    144.58901977539063 -14.352115631103516, 144.73284912109375 -14.650595664978027, 
    145.38800048828125 -15.030624389648438, 145.52920532226563 -16.473457336425781, 
    146.19784545898438 -17.49560546875, 146.12821960449219 -18.239631652832031, 146.52542114257813 
    -19.065319061279297, 147.61637878417969 -19.546205520629883, 148.17660522460938 -20.079109191894531, 
    148.90739440917969 -20.185646057128906, 148.77070617675781 -20.637355804443359, 149.30514526367188 
    -21.04315185546875, 149.76042175292969 -22.415578842163086, 150.22093200683594 -22.713462829589844, 
    150.1484375 -22.306673049926758, 150.89729309082031 -22.66114616394043, 151.00613403320313 
    -23.582916259765625, 151.93380737304688 -24.14051628112793, 152.27639770507813 -24.724786758422852, 
    152.52163696289063 -24.800580978393555, 152.68940734863281 -25.296232223510742, 153.03501892089844 
    -25.454490661621094, 153.27273559570313 -26.210777282714844, 153.29037475585938 -26.993001937866211, 
    153.14988708496094 -27.324020385742188, 153.60006713867188 -28.111736297607422, 153.69715881347656 
    -28.823896408081055, 153.14321899414063 -30.682428359985352, 153.17552185058594 -31.401203155517578, 
    152.37985229492188 -32.859695434570312, 151.96830749511719 -32.987766265869141, 151.56816101074219 
    -33.503929138183594, 150.96563720703125 -35.236156463623047, 150.4251708984375 -35.6771354675293, 
    150.18850708007813 -37.329910278320312, 149.91603088378906 -37.777362823486328, 148.24066162109375 
    -38.080898284912109, 147.02470397949219 -38.824363708496094, 146.50288391113281 -38.876548767089844, 
    146.72958374023438 -39.163665771484375, 145.73957824707031 -38.70556640625, 145.70791625976563 
    -38.424533843994141, 145.17349243164063 -38.048786163330078, 144.61477661132813 -38.228744506835938, 
    144.95124816894531 -38.438838958740234, 143.56846618652344 -38.9527587890625, 142.10769653320313 
    -38.41265869140625, 141.42892456054688 -38.439579010009766, 140.21568298339844 -37.624660491943359, 
    140.02616882324219 -37.229286193847656, 140.02934265136719 -36.578449249267578, 139.64814758300781 
    -36.024333953857422, 139.57157897949219 -35.5973014831543, 138.5560302734375 -35.8480339050293, 
    138.40083312988281 -35.739955902099609, 138.63349914550781 -35.535476684570312, 138.77128601074219 
    -34.910751342773438, 138.30516052246094 -34.339134216308594, 137.88699340820313 -35.313907623291016, 
    137.15071105957031 -35.455646514892578, 137.31202697753906 -35.053794860839844, 137.70594787597656 
    -35.008373260498047, 137.71554565429688 -34.442138671875, 138.11616516113281 -33.499790191650391, 
    138.39241027832031 -33.276569366455078, 138.0718994140625 -32.730152130126953, 138.02352905273438 
    -33.048313140869141, 137.66084289550781 -33.297161102294922, 137.27078247070313 -33.934112548828125, 
    136.30978393554688 -34.514995574951172, 135.91609191894531 -35.190467834472656, 134.91389465332031 
    -33.347339630126953, 134.41212463378906 -33.240230560302734, 134.31146240234375 -33.011432647705078, 
    134.44065856933594 -32.724918365478516, 134.04069519042969 -32.325000762939453, 133.32875061035156 
    -32.320106506347656, 132.90133666992188 -32.072917938232422, 132.38589477539063 -32.131229400634766, 
    131.48382568359375 -31.617877960205078, 129.38905334472656 -31.781232833862305, 127.46874237060547 
    -32.364013671875, 126.26261138916016 -32.417392730712891, 124.45204925537109 -33.127155303955078, 
    123.56221771240234 -34.025871276855469, 122.37458801269531 -34.161888122558594, 121.61318206787109 
    -33.953533172607422, 119.97515106201172 -34.103199005126953, 119.53349304199219 -34.562080383300781, 
    118.87643432617188 -34.588871002197266, 118.41074371337891 -35.073368072509766, 117.99697875976563 
    -35.195281982421875, 116.45505523681641 -35.0837516784668, 115.25058746337891 -34.405483245849609, 
    115.189453125 -33.737743377685547, 115.61216735839844 -33.749591827392578, 115.76168060302734 
    -33.558475494384766, 115.950927734375 -32.190639495849609, 115.26192474365234 -30.786540985107422, 
    115.11587524414063 -29.680290222167969, 114.83406066894531 -28.885986328125, 114.16830444335938 
    -28.016206741333008, 114.12889099121094 -27.367696762084961, 113.23877716064453 -26.145689010620117, 
    113.29524993896484 -26.040727615356445, 113.63665008544922 -26.555038452148438, 113.94303894042969 
    -26.649562835693359, 113.52482604980469 -25.673364639282227, 114.08432006835938 -26.4920597076416, 
    114.29875946044922 -26.521648406982422, 114.25409698486328 -26.271642684936523, 114.38450622558594 
    -26.254417419433594, 114.38618469238281 -26.000068664550781, 113.58287048339844 -24.596633911132812, 
    113.56556701660156 -24.26606559753418, 113.96568298339844 -23.464162826538086, 113.82909393310547 
    -22.548957824707031, 114.10423278808594 -22.02070426940918, 114.23101043701172 -22.503608703613281, 
    114.43566131591797 -22.598531723022461, 114.66001129150391 -22.076744079589844, 116.62245941162109 
    -20.820150375366211, 117.80059051513672 -20.741361618041992, 118.17213439941406 -20.454486846923828, 
    118.93798065185547 -20.300273895263672, 119.13991546630859 -20.007402420043945, 120.01618194580078 
    -20.100902557373047, 121.07581329345703 -19.659969329833984, 121.77999877929688 -18.685775756835938, 
    122.40011596679688 -18.226715087890625, 122.28913879394531 -17.381425857543945, 122.94200134277344 
    -16.566312789916992, 123.62236785888672 -17.562946319580078, 123.71196746826172 -17.092321395874023, 
    124.03050994873047 -17.231498718261719, 124.11570739746094 -16.957944869995117, 123.75660705566406 
    -16.678993225097656, 123.77950286865234 -16.373815536499023, 125.05001068115234 -16.513069152832031, 
    124.54142761230469 -16.245037078857422, 124.62816619873047 -15.640926361083984, 124.89231109619141 
    -15.449649810791016, 125.31279754638672 -15.607682228088379, 125.35932159423828 -14.7875337600708, 
    126.06686401367188 -14.677942276000977, 126.47202301025391 -14.054102897644043, 126.74971008300781 
    -14.333209991455078, 127.05709075927734 -13.766800880432129, 127.73275756835938 -14.178533554077148, 
    128.16622924804688 -14.686156272888184, 128.26980590820313 -15.359770774841309, 128.66252136230469 
    -14.869436264038086, 129.40008544921875 -14.975923538208008, 129.8359375 -15.261057853698731, 
    130.05227661132813 -14.802887916564941, 129.63021850585938 -14.288888931274414, 130.40965270996094 
    -13.467185020446777, 130.66716003417969 -12.741966247558594, 131.15493774414063 -12.613780975341797, 
    131.06253051757813 -12.429638862609863, 131.23200988769531 -12.251283645629883, 131.74357604980469 
    -12.383670806884766, 132.95478820800781 -12.152227401733398, 132.71826171875 -11.606078147888184, 
    132.22822570800781 -11.460931777954102, 132.40925598144531 -11.301631927490234, 133.13264465332031 
    -11.516201972961426, 133.76284790039063 -11.934375762939453, 134.96577453613281 -12.0462007522583, 
    135.33218383789063 -12.369593620300293, 135.85267639160156 -12.171424865722656, 136.29487609863281 
    -12.558222770690918, 136.50227355957031 -12.494205474853516, 136.63816833496094 -12.099803924560547, 
    136.9947509765625 -12.353300094604492, 136.67274475097656 -13.20579719543457, 136.03456115722656 
    -13.467802047729492, 136.168212890625 -13.874351501464844, 136.08430480957031 -14.186027526855469, 
    135.66123962402344 -14.66370964050293, 135.62026977539063 -14.956218719482422, 136.89080810546875 
    -16.008792877197266, 137.27737426757813 -16.014326095581055, 138.4639892578125 -16.825523376464844, 
    139.16641235351563 -16.976600646972656, 139.45198059082031 -17.414670944213867, 140.02192687988281 
    -17.744054794311523, 140.26387023925781 -17.813465118408203, 140.91120910644531 -17.614999771118164, 
    141.33607482910156 -16.940177917480469, 141.91496276855469 -15.209720611572266, 141.67181396484375 
    -14.7398042678833, 141.87205505371094 -14.097315788269043, 141.71598815917969 -13.792503356933594, 
    141.802490234375 -13.029497146606445, 142.12260437011719 -12.685539245605469, 141.88218688964844 
    -12.450845718383789, 142.32931518554688 -11.140419960021973, 142.54121398925781 -10.898410797119141
    )))',0);
SELECT @Australia.STBuffer(1)
UNION ALL
SELECT @Australia;
GO
