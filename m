Content-Type: multipart/mixed; boundary="===============4564013582811554882=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 9752/9999] drivers/media/v4l2-core/v4l2-ctrls.c:1450 v4l2_ctrl_fill() warn: Function too hairy. No more merges.
Date: Thu, 07 Apr 2022 23:47:04 +0800
Message-ID: <202204072335.PbDh1Rzs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4564013582811554882==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   857e645d1705850b144d03f5085d93480c1592ba
commit: 797715a17c8b9bfdb1511ffb2184be9db4c9affc [9752/9999] Revert "CHROMI=
UM: media: uapi: Add VP9 stateless decoder controls"
:::::: branch date: 7 hours ago
:::::: commit date: 2 weeks ago
config: mips-randconfig-m031-20220406 (https://download.01.org/0day-ci/arch=
ive/20220407/202204072335.PbDh1Rzs-lkp(a)intel.com/config)
compiler: mips64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/media/v4l2-core/v4l2-ctrls.c:1450 v4l2_ctrl_fill() warn: Function t=
oo hairy.  No more merges.

Old smatch warnings:
drivers/media/v4l2-core/v4l2-ctrls.c:2640 v4l2_ctrl_handler_init_class() wa=
rn: Please consider using kvcalloc instead

vim +1450 drivers/media/v4l2-core/v4l2-ctrls.c

0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1224  =

0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1225  void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ct=
rl_type *type,
0ba2aeb6dab8092 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-04-16  1226  		    s64 *min, s64 *max, u64 *step, s64 *def, u32 *flags)
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1227  {
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1228  	*name =3D v4l2_ctrl_get_name(id);
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1229  	*flags =3D 0;
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1230  =

0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1231  	switch (id) {
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1232  	case V4L2_CID_AUDIO_MUTE:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1233  	case V4L2_CID_AUDIO_LOUDNESS:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1234  	case V4L2_CID_AUTO_WHITE_BALANCE:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1235  	case V4L2_CID_AUTOGAIN:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1236  	case V4L2_CID_HFLIP:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1237  	case V4L2_CID_VFLIP:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1238  	case V4L2_CID_HUE_AUTO:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1239  	case V4L2_CID_CHROMA_AGC:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1240  	case V4L2_CID_COLOR_KILLER:
a2f8b84fed92d56 drivers/media/video/v4l2-ctrls.c     Hans de Goede       20=
12-07-01  1241  	case V4L2_CID_AUTOBRIGHTNESS:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1242  	case V4L2_CID_MPEG_AUDIO_MUTE:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1243  	case V4L2_CID_MPEG_VIDEO_MUTE:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1244  	case V4L2_CID_MPEG_VIDEO_GOP_CLOSURE:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1245  	case V4L2_CID_MPEG_VIDEO_PULLDOWN:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1246  	case V4L2_CID_EXPOSURE_AUTO_PRIORITY:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1247  	case V4L2_CID_FOCUS_AUTO:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1248  	case V4L2_CID_PRIVACY:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1249  	case V4L2_CID_AUDIO_LIMITER_ENABLED:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1250  	case V4L2_CID_AUDIO_COMPRESSION_ENABLED:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1251  	case V4L2_CID_PILOT_TONE_ENABLED:
008d35f2f525675 drivers/media/video/v4l2-ctrls.c     Jean-Fran=C3=A7ois Moi=
ne 2010-09-13  1252  	case V4L2_CID_ILLUMINATORS_1:
008d35f2f525675 drivers/media/video/v4l2-ctrls.c     Jean-Fran=C3=A7ois Moi=
ne 2010-09-13  1253  	case V4L2_CID_ILLUMINATORS_2:
0b159acdd577dfd drivers/media/video/v4l2-ctrls.c     Sakari Ailus        20=
11-03-21  1254  	case V4L2_CID_FLASH_STROBE_STATUS:
0b159acdd577dfd drivers/media/video/v4l2-ctrls.c     Sakari Ailus        20=
11-03-21  1255  	case V4L2_CID_FLASH_CHARGE:
0b159acdd577dfd drivers/media/video/v4l2-ctrls.c     Sakari Ailus        20=
11-03-21  1256  	case V4L2_CID_FLASH_READY:
064f50966eb65e8 drivers/media/video/v4l2-ctrls.c     Kamil Debski        20=
11-06-14  1257  	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
064f50966eb65e8 drivers/media/video/v4l2-ctrls.c     Kamil Debski        20=
11-06-14  1258  	case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:
b4973fe0f805b40 drivers/media/v4l2-core/v4l2-ctrls.c Stanimir Varbanov   20=
20-11-09  1259  	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE:
064f50966eb65e8 drivers/media/video/v4l2-ctrls.c     Kamil Debski        20=
11-06-14  1260  	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
064f50966eb65e8 drivers/media/video/v4l2-ctrls.c     Kamil Debski        20=
11-06-14  1261  	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:
064f50966eb65e8 drivers/media/video/v4l2-ctrls.c     Kamil Debski        20=
11-06-14  1262  	case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:
064f50966eb65e8 drivers/media/video/v4l2-ctrls.c     Kamil Debski        20=
11-06-14  1263  	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE:
064f50966eb65e8 drivers/media/video/v4l2-ctrls.c     Kamil Debski        20=
11-06-14  1264  	case V4L2_CID_MPEG_VIDEO_MPEG4_QPEL:
9ca5470cc143320 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
13-03-17  1265  	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:
eb44479d41b3168 drivers/media/v4l2-core/v4l2-ctrls.c Stanimir Varbanov   20=
20-11-24  1266  	case V4L2_CID_MPEG_VIDEO_AU_DELIMITER:
44d44a1acde974d drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  20=
12-03-06  1267  	case V4L2_CID_WIDE_DYNAMIC_RANGE:
82b3056c5a77b68 drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  20=
12-05-01  1268  	case V4L2_CID_IMAGE_STABILIZATION:
aec330a8cbd373d drivers/media/v4l2-core/v4l2-ctrls.c Andrey Smirnov      20=
13-03-26  1269  	case V4L2_CID_RDS_RECEPTION:
80807fada4398d1 drivers/media/v4l2-core/v4l2-ctrls.c Antti Palosaari     20=
14-01-24  1270  	case V4L2_CID_RF_TUNER_LNA_GAIN_AUTO:
80807fada4398d1 drivers/media/v4l2-core/v4l2-ctrls.c Antti Palosaari     20=
14-01-24  1271  	case V4L2_CID_RF_TUNER_MIXER_GAIN_AUTO:
80807fada4398d1 drivers/media/v4l2-core/v4l2-ctrls.c Antti Palosaari     20=
14-01-24  1272  	case V4L2_CID_RF_TUNER_IF_GAIN_AUTO:
3ce569fd7c55ed9 drivers/media/v4l2-core/v4l2-ctrls.c Antti Palosaari     20=
14-01-31  1273  	case V4L2_CID_RF_TUNER_BANDWIDTH_AUTO:
9aa4357e9b10b92 drivers/media/v4l2-core/v4l2-ctrls.c Antti Palosaari     20=
14-02-07  1274  	case V4L2_CID_RF_TUNER_PLL_LOCK:
811c508104d0926 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-07-21  1275  	case V4L2_CID_RDS_TX_MONO_STEREO:
811c508104d0926 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-07-21  1276  	case V4L2_CID_RDS_TX_ARTIFICIAL_HEAD:
811c508104d0926 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-07-21  1277  	case V4L2_CID_RDS_TX_COMPRESSED:
811c508104d0926 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-07-21  1278  	case V4L2_CID_RDS_TX_DYNAMIC_PTY:
811c508104d0926 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-07-21  1279  	case V4L2_CID_RDS_TX_TRAFFIC_ANNOUNCEMENT:
811c508104d0926 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-07-21  1280  	case V4L2_CID_RDS_TX_TRAFFIC_PROGRAM:
811c508104d0926 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-07-21  1281  	case V4L2_CID_RDS_TX_MUSIC_SPEECH:
811c508104d0926 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-07-21  1282  	case V4L2_CID_RDS_TX_ALT_FREQS_ENABLE:
9570a14847a9d33 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-07-21  1283  	case V4L2_CID_RDS_RX_TRAFFIC_ANNOUNCEMENT:
9570a14847a9d33 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-07-21  1284  	case V4L2_CID_RDS_RX_TRAFFIC_PROGRAM:
9570a14847a9d33 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-07-21  1285  	case V4L2_CID_RDS_RX_MUSIC_SPEECH:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1286  		*type =3D V4L2_CTRL_TYPE_BOOLEAN;
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1287  		*min =3D 0;
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1288  		*max =3D *step =3D 1;
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1289  		break;
c0e681f5b08a965 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
17-04-10  1290  	case V4L2_CID_ROTATE:
c0e681f5b08a965 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
17-04-10  1291  		*type =3D V4L2_CTRL_TYPE_INTEGER;
c0e681f5b08a965 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
17-04-10  1292  		*flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
c0e681f5b08a965 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
17-04-10  1293  		break;
bf0bedd37157483 drivers/media/v4l2-core/v4l2-ctrls.c Amit Grover         20=
14-02-04  1294  	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:
bf0bedd37157483 drivers/media/v4l2-core/v4l2-ctrls.c Amit Grover         20=
14-02-04  1295  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
b4973fe0f805b40 drivers/media/v4l2-core/v4l2-ctrls.c Stanimir Varbanov   20=
20-11-09  1296  	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY:
1c4bab378af2854 drivers/media/v4l2-core/v4l2-ctrls.c Stanimir Varbanov   20=
21-06-22  1297  	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
bf0bedd37157483 drivers/media/v4l2-core/v4l2-ctrls.c Amit Grover         20=
14-02-04  1298  		*type =3D V4L2_CTRL_TYPE_INTEGER;
bf0bedd37157483 drivers/media/v4l2-core/v4l2-ctrls.c Amit Grover         20=
14-02-04  1299  		break;
68a578e9f3227d1 drivers/media/v4l2-core/v4l2-ctrls.c Dikshita Agarwal    20=
21-03-24  1300  	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:
68a578e9f3227d1 drivers/media/v4l2-core/v4l2-ctrls.c Dikshita Agarwal    20=
21-03-24  1301  		*type =3D V4L2_CTRL_TYPE_INTEGER;
68a578e9f3227d1 drivers/media/v4l2-core/v4l2-ctrls.c Dikshita Agarwal    20=
21-03-24  1302  		break;
68a578e9f3227d1 drivers/media/v4l2-core/v4l2-ctrls.c Dikshita Agarwal    20=
21-03-24  1303  	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
68a578e9f3227d1 drivers/media/v4l2-core/v4l2-ctrls.c Dikshita Agarwal    20=
21-03-24  1304  		*type =3D V4L2_CTRL_TYPE_INTEGER;
68a578e9f3227d1 drivers/media/v4l2-core/v4l2-ctrls.c Dikshita Agarwal    20=
21-03-24  1305  		*flags |=3D V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
68a578e9f3227d1 drivers/media/v4l2-core/v4l2-ctrls.c Dikshita Agarwal    20=
21-03-24  1306  		break;
68a578e9f3227d1 drivers/media/v4l2-core/v4l2-ctrls.c Dikshita Agarwal    20=
21-03-24  1307  	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:
68a578e9f3227d1 drivers/media/v4l2-core/v4l2-ctrls.c Dikshita Agarwal    20=
21-03-24  1308  		*type =3D V4L2_CTRL_TYPE_BITMASK;
68a578e9f3227d1 drivers/media/v4l2-core/v4l2-ctrls.c Dikshita Agarwal    20=
21-03-24  1309  		*flags |=3D V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
68a578e9f3227d1 drivers/media/v4l2-core/v4l2-ctrls.c Dikshita Agarwal    20=
21-03-24  1310  		break;
cedc12108b55d0c drivers/media/v4l2-core/v4l2-ctrls.c Wu-Cheng Li         20=
16-01-19  1311  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1312  	case V4L2_CID_PAN_RESET:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1313  	case V4L2_CID_TILT_RESET:
0b159acdd577dfd drivers/media/video/v4l2-ctrls.c     Sakari Ailus        20=
11-03-21  1314  	case V4L2_CID_FLASH_STROBE:
0b159acdd577dfd drivers/media/video/v4l2-ctrls.c     Sakari Ailus        20=
11-03-21  1315  	case V4L2_CID_FLASH_STROBE_STOP:
2272ab657b508ec drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  20=
12-05-11  1316  	case V4L2_CID_AUTO_FOCUS_START:
2272ab657b508ec drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  20=
12-05-11  1317  	case V4L2_CID_AUTO_FOCUS_STOP:
a0816e5088baab8 drivers/media/v4l2-core/v4l2-ctrls.c Eugen Hristev       20=
19-04-15  1318  	case V4L2_CID_DO_WHITE_BALANCE:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1319  		*type =3D V4L2_CTRL_TYPE_BUTTON;
ef66c0ca09595d7 drivers/media/v4l2-core/v4l2-ctrls.c Ricardo Ribalda     20=
15-03-20  1320  		*flags |=3D V4L2_CTRL_FLAG_WRITE_ONLY |
ef66c0ca09595d7 drivers/media/v4l2-core/v4l2-ctrls.c Ricardo Ribalda     20=
15-03-20  1321  			  V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1322  		*min =3D *max =3D *step =3D *def =3D 0;
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1323  		break;
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1324  	case V4L2_CID_POWER_LINE_FREQUENCY:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1325  	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1326  	case V4L2_CID_MPEG_AUDIO_ENCODING:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1327  	case V4L2_CID_MPEG_AUDIO_L1_BITRATE:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1328  	case V4L2_CID_MPEG_AUDIO_L2_BITRATE:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1329  	case V4L2_CID_MPEG_AUDIO_L3_BITRATE:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1330  	case V4L2_CID_MPEG_AUDIO_AC3_BITRATE:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1331  	case V4L2_CID_MPEG_AUDIO_MODE:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1332  	case V4L2_CID_MPEG_AUDIO_MODE_EXTENSION:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1333  	case V4L2_CID_MPEG_AUDIO_EMPHASIS:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1334  	case V4L2_CID_MPEG_AUDIO_CRC:
24c19a217e543b6 drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
11-12-15  1335  	case V4L2_CID_MPEG_AUDIO_DEC_PLAYBACK:
24c19a217e543b6 drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
11-12-15  1336  	case V4L2_CID_MPEG_AUDIO_DEC_MULTILINGUAL_PLAYBACK:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1337  	case V4L2_CID_MPEG_VIDEO_ENCODING:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1338  	case V4L2_CID_MPEG_VIDEO_ASPECT:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1339  	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1340  	case V4L2_CID_MPEG_STREAM_TYPE:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1341  	case V4L2_CID_MPEG_STREAM_VBI_FMT:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1342  	case V4L2_CID_EXPOSURE_AUTO:
2272ab657b508ec drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  20=
12-05-11  1343  	case V4L2_CID_AUTO_FOCUS_RANGE:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1344  	case V4L2_CID_COLORFX:
e40a05736d45039 drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  20=
12-03-06  1345  	case V4L2_CID_AUTO_N_PRESET_WHITE_BALANCE:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1346  	case V4L2_CID_TUNE_PREEMPHASIS:
0b159acdd577dfd drivers/media/video/v4l2-ctrls.c     Sakari Ailus        20=
11-03-21  1347  	case V4L2_CID_FLASH_LED_MODE:
0b159acdd577dfd drivers/media/video/v4l2-ctrls.c     Sakari Ailus        20=
11-03-21  1348  	case V4L2_CID_FLASH_STROBE_SOURCE:
064f50966eb65e8 drivers/media/video/v4l2-ctrls.c     Kamil Debski        20=
11-06-14  1349  	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:
44f5b2fffc3213c drivers/media/v4l2-core/v4l2-ctrls.c Stanimir Varbanov   20=
20-07-05  1350  	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
064f50966eb65e8 drivers/media/video/v4l2-ctrls.c     Kamil Debski        20=
11-06-14  1351  	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
064f50966eb65e8 drivers/media/video/v4l2-ctrls.c     Kamil Debski        20=
11-06-14  1352  	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
064f50966eb65e8 drivers/media/video/v4l2-ctrls.c     Kamil Debski        20=
11-06-14  1353  	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
064f50966eb65e8 drivers/media/video/v4l2-ctrls.c     Kamil Debski        20=
11-06-14  1354  	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE:
064f50966eb65e8 drivers/media/video/v4l2-ctrls.c     Kamil Debski        20=
11-06-14  1355  	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
064f50966eb65e8 drivers/media/video/v4l2-ctrls.c     Kamil Debski        20=
11-06-14  1356  	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC:
2e81dde94316dfa drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        20=
12-10-03  1357  	case V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE:
2e81dde94316dfa drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        20=
12-10-03  1358  	case V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE:
5902bca94ae0531 drivers/media/v4l2-core/v4l2-ctrls.c Philipp Zabel       20=
19-04-24  1359  	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
5902bca94ae0531 drivers/media/v4l2-core/v4l2-ctrls.c Philipp Zabel       20=
19-04-24  1360  	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:
064f50966eb65e8 drivers/media/video/v4l2-ctrls.c     Kamil Debski        20=
11-06-14  1361  	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
064f50966eb65e8 drivers/media/video/v4l2-ctrls.c     Kamil Debski        20=
11-06-14  1362  	case V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE:
c7361ae1e7a5a53 drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  20=
12-01-20  1363  	case V4L2_CID_JPEG_CHROMA_SUBSAMPLING:
7f84ad8bdb63a8b drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  20=
12-05-01  1364  	case V4L2_CID_ISO_SENSITIVITY_AUTO:
cf072139c7952e2 drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  20=
12-04-30  1365  	case V4L2_CID_EXPOSURE_METERING:
0bf6b7dc5fd1e60 drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  20=
12-04-16  1366  	case V4L2_CID_SCENE_MODE:
977ebec754cce0a drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
12-07-03  1367  	case V4L2_CID_DV_TX_MODE:
977ebec754cce0a drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
12-07-03  1368  	case V4L2_CID_DV_TX_RGB_RANGE:
45cc29afb47f229 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
16-01-27  1369  	case V4L2_CID_DV_TX_IT_CONTENT_TYPE:
977ebec754cce0a drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
12-07-03  1370  	case V4L2_CID_DV_RX_RGB_RANGE:
45cc29afb47f229 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
16-01-27  1371  	case V4L2_CID_DV_RX_IT_CONTENT_TYPE:
5ebef0fbe0f72fa drivers/media/v4l2-core/v4l2-ctrls.c Lad, Prabhakar      20=
12-10-01  1372  	case V4L2_CID_TEST_PATTERN:
446e412597217e9 drivers/media/v4l2-core/v4l2-ctrls.c Laurent Pinchart    20=
16-08-04  1373  	case V4L2_CID_DEINTERLACING_MODE:
aec330a8cbd373d drivers/media/v4l2-core/v4l2-ctrls.c Andrey Smirnov      20=
13-03-26  1374  	case V4L2_CID_TUNE_DEEMPHASIS:
bc9028e1d38419f drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        20=
13-07-09  1375  	case V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_SEL:
5520b9467a39d5e drivers/media/v4l2-core/v4l2-ctrls.c Keiichi Watanabe    20=
18-06-18  1376  	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:
2a75364d09b05f2 drivers/media/v4l2-core/v4l2-ctrls.c Keiichi Watanabe    20=
18-06-18  1377  	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:
5823833c9adab5a drivers/media/v4l2-core/v4l2-ctrls.c Stanimir Varbanov   20=
20-07-11  1378  	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
a77b4fc0bc328b0 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-03-28  1379  	case V4L2_CID_DETECT_MD_MODE:
2c02837bd99cda8 drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     20=
18-02-02  1380  	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:
2c02837bd99cda8 drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     20=
18-02-02  1381  	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
2c02837bd99cda8 drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     20=
18-02-02  1382  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE:
2c02837bd99cda8 drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     20=
18-02-02  1383  	case V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_TYPE:
2c02837bd99cda8 drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     20=
18-02-02  1384  	case V4L2_CID_MPEG_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD:
2c02837bd99cda8 drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     20=
18-02-02  1385  	case V4L2_CID_MPEG_VIDEO_HEVC_TIER:
2c02837bd99cda8 drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     20=
18-02-02  1386  	case V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE:
256fa3920874b0f drivers/media/v4l2-core/v4l2-ctrls.c Paul Kocialkowski   20=
19-10-22  1387  	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:
256fa3920874b0f drivers/media/v4l2-core/v4l2-ctrls.c Paul Kocialkowski   20=
19-10-22  1388  	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:
54a8ffa358a1d15 drivers/media/v4l2-core/v4l2-ctrls.c Ezequiel Garcia     20=
20-11-26  1389  	case V4L2_CID_STATELESS_H264_DECODE_MODE:
54a8ffa358a1d15 drivers/media/v4l2-core/v4l2-ctrls.c Ezequiel Garcia     20=
20-11-26  1390  	case V4L2_CID_STATELESS_H264_START_CODE:
926645d43fd4362 drivers/media/v4l2-core/v4l2-ctrls.c Jacopo Mondi        20=
20-05-09  1391  	case V4L2_CID_CAMERA_ORIENTATION:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1392  		*type =3D V4L2_CTRL_TYPE_MENU;
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1393  		break;
c643ee135190389 drivers/media/video/v4l2-ctrls.c     Sakari Ailus        20=
12-02-02  1394  	case V4L2_CID_LINK_FREQ:
c643ee135190389 drivers/media/video/v4l2-ctrls.c     Sakari Ailus        20=
12-02-02  1395  		*type =3D V4L2_CTRL_TYPE_INTEGER_MENU;
c643ee135190389 drivers/media/video/v4l2-ctrls.c     Sakari Ailus        20=
12-02-02  1396  		break;
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1397  	case V4L2_CID_RDS_TX_PS_NAME:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1398  	case V4L2_CID_RDS_TX_RADIO_TEXT:
9570a14847a9d33 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-07-21  1399  	case V4L2_CID_RDS_RX_PS_NAME:
9570a14847a9d33 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-07-21  1400  	case V4L2_CID_RDS_RX_RADIO_TEXT:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1401  		*type =3D V4L2_CTRL_TYPE_STRING;
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1402  		break;
7f84ad8bdb63a8b drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  20=
12-05-01  1403  	case V4L2_CID_ISO_SENSITIVITY:
d58083c949b3d76 drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  20=
12-03-06  1404  	case V4L2_CID_AUTO_EXPOSURE_BIAS:
bc9028e1d38419f drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        20=
13-07-09  1405  	case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:
bc9028e1d38419f drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        20=
13-07-09  1406  	case V4L2_CID_MPEG_VIDEO_VPX_NUM_REF_FRAMES:
d58083c949b3d76 drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  20=
12-03-06  1407  		*type =3D V4L2_CTRL_TYPE_INTEGER_MENU;
d58083c949b3d76 drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  20=
12-03-06  1408  		break;
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1409  	case V4L2_CID_USER_CLASS:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1410  	case V4L2_CID_CAMERA_CLASS:
6672466d0cb249c drivers/media/v4l2-core/v4l2-ctrls.c Ezequiel Garcia     20=
20-11-26  1411  	case V4L2_CID_CODEC_CLASS:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1412  	case V4L2_CID_FM_TX_CLASS:
0b159acdd577dfd drivers/media/video/v4l2-ctrls.c     Sakari Ailus        20=
11-03-21  1413  	case V4L2_CID_FLASH_CLASS:
c7361ae1e7a5a53 drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  20=
12-01-20  1414  	case V4L2_CID_JPEG_CLASS:
8c9d236ec64f1f1 drivers/media/video/v4l2-ctrls.c     Sakari Ailus        20=
11-10-04  1415  	case V4L2_CID_IMAGE_SOURCE_CLASS:
c643ee135190389 drivers/media/video/v4l2-ctrls.c     Sakari Ailus        20=
12-02-02  1416  	case V4L2_CID_IMAGE_PROC_CLASS:
977ebec754cce0a drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
12-07-03  1417  	case V4L2_CID_DV_CLASS:
aec330a8cbd373d drivers/media/v4l2-core/v4l2-ctrls.c Andrey Smirnov      20=
13-03-26  1418  	case V4L2_CID_FM_RX_CLASS:
80807fada4398d1 drivers/media/v4l2-core/v4l2-ctrls.c Antti Palosaari     20=
14-01-24  1419  	case V4L2_CID_RF_TUNER_CLASS:
a77b4fc0bc328b0 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-03-28  1420  	case V4L2_CID_DETECT_CLASS:
22a3a9cb08dc84f drivers/media/v4l2-core/v4l2-ctrls.c Ezequiel Garcia     20=
20-11-26  1421  	case V4L2_CID_CODEC_STATELESS_CLASS:
db8f453b0957990 drivers/media/v4l2-core/v4l2-ctrls.c Stanimir Varbanov   20=
21-01-19  1422  	case V4L2_CID_COLORIMETRY_CLASS:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1423  		*type =3D V4L2_CTRL_TYPE_CTRL_CLASS;
db8f453b0957990 drivers/media/v4l2-core/v4l2-ctrls.c Stanimir Varbanov   20=
21-01-19  1424  		/* You can neither read nor write these */
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1425  		*flags |=3D V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_WRI=
TE_ONLY;
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1426  		*min =3D *max =3D *step =3D *def =3D 0;
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1427  		break;
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1428  	case V4L2_CID_BG_COLOR:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1429  		*type =3D V4L2_CTRL_TYPE_INTEGER;
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1430  		*step =3D 1;
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1431  		*min =3D 0;
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1432  		/* Max is calculated as RGB888 that is 2^24 */
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1433  		*max =3D 0xFFFFFF;
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1434  		break;
0b159acdd577dfd drivers/media/video/v4l2-ctrls.c     Sakari Ailus        20=
11-03-21  1435  	case V4L2_CID_FLASH_FAULT:
c7361ae1e7a5a53 drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  20=
12-01-20  1436  	case V4L2_CID_JPEG_ACTIVE_MARKER:
fc162a099e7b34b drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  20=
12-05-02  1437  	case V4L2_CID_3A_LOCK:
2272ab657b508ec drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  20=
12-05-11  1438  	case V4L2_CID_AUTO_FOCUS_STATUS:
977ebec754cce0a drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
12-07-03  1439  	case V4L2_CID_DV_TX_HOTPLUG:
977ebec754cce0a drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
12-07-03  1440  	case V4L2_CID_DV_TX_RXSENSE:
977ebec754cce0a drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
12-07-03  1441  	case V4L2_CID_DV_TX_EDID_PRESENT:
977ebec754cce0a drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
12-07-03  1442  	case V4L2_CID_DV_RX_POWER_PRESENT:
0b159acdd577dfd drivers/media/video/v4l2-ctrls.c     Sakari Ailus        20=
11-03-21  1443  		*type =3D V4L2_CTRL_TYPE_BITMASK;
0b159acdd577dfd drivers/media/video/v4l2-ctrls.c     Sakari Ailus        20=
11-03-21  1444  		break;
064f50966eb65e8 drivers/media/video/v4l2-ctrls.c     Kamil Debski        20=
11-06-14  1445  	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
064f50966eb65e8 drivers/media/video/v4l2-ctrls.c     Kamil Debski        20=
11-06-14  1446  	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
064f50966eb65e8 drivers/media/video/v4l2-ctrls.c     Kamil Debski        20=
11-06-14  1447  		*type =3D V4L2_CTRL_TYPE_INTEGER;
064f50966eb65e8 drivers/media/video/v4l2-ctrls.c     Kamil Debski        20=
11-06-14  1448  		*flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
064f50966eb65e8 drivers/media/video/v4l2-ctrls.c     Kamil Debski        20=
11-06-14  1449  		break;
24c19a217e543b6 drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
11-12-15 @1450  	case V4L2_CID_MPEG_VIDEO_DEC_PTS:
0ba2aeb6dab8092 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-04-16  1451  		*type =3D V4L2_CTRL_TYPE_INTEGER64;
0ba2aeb6dab8092 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-04-16  1452  		*flags |=3D V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ=
_ONLY;
0ba2aeb6dab8092 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-04-16  1453  		*min =3D *def =3D 0;
0ba2aeb6dab8092 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-04-16  1454  		*max =3D 0x1ffffffffLL;
0ba2aeb6dab8092 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-04-16  1455  		*step =3D 1;
0ba2aeb6dab8092 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-04-16  1456  		break;
0ba2aeb6dab8092 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-04-16  1457  	case V4L2_CID_MPEG_VIDEO_DEC_FRAME:
0ba2aeb6dab8092 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-04-16  1458  		*type =3D V4L2_CTRL_TYPE_INTEGER64;
0ba2aeb6dab8092 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-04-16  1459  		*flags |=3D V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ=
_ONLY;
0ba2aeb6dab8092 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-04-16  1460  		*min =3D *def =3D 0;
0ba2aeb6dab8092 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-04-16  1461  		*max =3D 0x7fffffffffffffffLL;
0ba2aeb6dab8092 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-04-16  1462  		*step =3D 1;
0ba2aeb6dab8092 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-04-16  1463  		break;
a2b1df0b6f3ebc4 drivers/media/v4l2-core/v4l2-ctrls.c Stanimir Varbanov   20=
21-01-20  1464  	case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:
a2b1df0b6f3ebc4 drivers/media/v4l2-core/v4l2-ctrls.c Stanimir Varbanov   20=
21-01-20  1465  		*type =3D V4L2_CTRL_TYPE_INTEGER64;
a2b1df0b6f3ebc4 drivers/media/v4l2-core/v4l2-ctrls.c Stanimir Varbanov   20=
21-01-20  1466  		*min =3D 0;
a2b1df0b6f3ebc4 drivers/media/v4l2-core/v4l2-ctrls.c Stanimir Varbanov   20=
21-01-20  1467  		/* default for 8 bit black, luma is 16, chroma is 128 */
a2b1df0b6f3ebc4 drivers/media/v4l2-core/v4l2-ctrls.c Stanimir Varbanov   20=
21-01-20  1468  		*def =3D 0x8000800010LL;
a2b1df0b6f3ebc4 drivers/media/v4l2-core/v4l2-ctrls.c Stanimir Varbanov   20=
21-01-20  1469  		*max =3D 0xffffffffffffLL;
a2b1df0b6f3ebc4 drivers/media/v4l2-core/v4l2-ctrls.c Stanimir Varbanov   20=
21-01-20  1470  		*step =3D 1;
a2b1df0b6f3ebc4 drivers/media/v4l2-core/v4l2-ctrls.c Stanimir Varbanov   20=
21-01-20  1471  		break;
c643ee135190389 drivers/media/video/v4l2-ctrls.c     Sakari Ailus        20=
12-02-02  1472  	case V4L2_CID_PIXEL_RATE:
24c19a217e543b6 drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
11-12-15  1473  		*type =3D V4L2_CTRL_TYPE_INTEGER64;
c643ee135190389 drivers/media/video/v4l2-ctrls.c     Sakari Ailus        20=
12-02-02  1474  		*flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
24c19a217e543b6 drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
11-12-15  1475  		break;
a77b4fc0bc328b0 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-03-28  1476  	case V4L2_CID_DETECT_MD_REGION_GRID:
a77b4fc0bc328b0 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-03-28  1477  		*type =3D V4L2_CTRL_TYPE_U8;
a77b4fc0bc328b0 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-03-28  1478  		break;
a77b4fc0bc328b0 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-03-28  1479  	case V4L2_CID_DETECT_MD_THRESHOLD_GRID:
a77b4fc0bc328b0 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-03-28  1480  		*type =3D V4L2_CTRL_TYPE_U16;
a77b4fc0bc328b0 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-03-28  1481  		break;
811c508104d0926 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-07-21  1482  	case V4L2_CID_RDS_TX_ALT_FREQS:
811c508104d0926 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-07-21  1483  		*type =3D V4L2_CTRL_TYPE_U32;
811c508104d0926 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-07-21  1484  		break;
c27bb30e7b6d385 drivers/media/v4l2-core/v4l2-ctrls.c Paul Kocialkowski   20=
18-09-13  1485  	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:
c27bb30e7b6d385 drivers/media/v4l2-core/v4l2-ctrls.c Paul Kocialkowski   20=
18-09-13  1486  		*type =3D V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS;
c27bb30e7b6d385 drivers/media/v4l2-core/v4l2-ctrls.c Paul Kocialkowski   20=
18-09-13  1487  		break;
c27bb30e7b6d385 drivers/media/v4l2-core/v4l2-ctrls.c Paul Kocialkowski   20=
18-09-13  1488  	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION:
c27bb30e7b6d385 drivers/media/v4l2-core/v4l2-ctrls.c Paul Kocialkowski   20=
18-09-13  1489  		*type =3D V4L2_CTRL_TYPE_MPEG2_QUANTIZATION;
c27bb30e7b6d385 drivers/media/v4l2-core/v4l2-ctrls.c Paul Kocialkowski   20=
18-09-13  1490  		break;
2b0825fe16f21c0 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
20-11-26  1491  	case V4L2_CID_STATELESS_FWHT_PARAMS:
2495f39ce1fa027 drivers/media/v4l2-core/v4l2-ctrls.c Dafna Hirschfeld    20=
19-03-06  1492  		*type =3D V4L2_CTRL_TYPE_FWHT_PARAMS;
2495f39ce1fa027 drivers/media/v4l2-core/v4l2-ctrls.c Dafna Hirschfeld    20=
19-03-06  1493  		break;
54a8ffa358a1d15 drivers/media/v4l2-core/v4l2-ctrls.c Ezequiel Garcia     20=
20-11-26  1494  	case V4L2_CID_STATELESS_H264_SPS:
1f0545d3ed1df3a drivers/media/v4l2-core/v4l2-ctrls.c Pawel Osciak        20=
19-05-24  1495  		*type =3D V4L2_CTRL_TYPE_H264_SPS;
1f0545d3ed1df3a drivers/media/v4l2-core/v4l2-ctrls.c Pawel Osciak        20=
19-05-24  1496  		break;
54a8ffa358a1d15 drivers/media/v4l2-core/v4l2-ctrls.c Ezequiel Garcia     20=
20-11-26  1497  	case V4L2_CID_STATELESS_H264_PPS:
1f0545d3ed1df3a drivers/media/v4l2-core/v4l2-ctrls.c Pawel Osciak        20=
19-05-24  1498  		*type =3D V4L2_CTRL_TYPE_H264_PPS;
1f0545d3ed1df3a drivers/media/v4l2-core/v4l2-ctrls.c Pawel Osciak        20=
19-05-24  1499  		break;
54a8ffa358a1d15 drivers/media/v4l2-core/v4l2-ctrls.c Ezequiel Garcia     20=
20-11-26  1500  	case V4L2_CID_STATELESS_H264_SCALING_MATRIX:
1f0545d3ed1df3a drivers/media/v4l2-core/v4l2-ctrls.c Pawel Osciak        20=
19-05-24  1501  		*type =3D V4L2_CTRL_TYPE_H264_SCALING_MATRIX;
1f0545d3ed1df3a drivers/media/v4l2-core/v4l2-ctrls.c Pawel Osciak        20=
19-05-24  1502  		break;
54a8ffa358a1d15 drivers/media/v4l2-core/v4l2-ctrls.c Ezequiel Garcia     20=
20-11-26  1503  	case V4L2_CID_STATELESS_H264_SLICE_PARAMS:
1f0545d3ed1df3a drivers/media/v4l2-core/v4l2-ctrls.c Pawel Osciak        20=
19-05-24  1504  		*type =3D V4L2_CTRL_TYPE_H264_SLICE_PARAMS;
1f0545d3ed1df3a drivers/media/v4l2-core/v4l2-ctrls.c Pawel Osciak        20=
19-05-24  1505  		break;
54a8ffa358a1d15 drivers/media/v4l2-core/v4l2-ctrls.c Ezequiel Garcia     20=
20-11-26  1506  	case V4L2_CID_STATELESS_H264_DECODE_PARAMS:
1f0545d3ed1df3a drivers/media/v4l2-core/v4l2-ctrls.c Pawel Osciak        20=
19-05-24  1507  		*type =3D V4L2_CTRL_TYPE_H264_DECODE_PARAMS;
1f0545d3ed1df3a drivers/media/v4l2-core/v4l2-ctrls.c Pawel Osciak        20=
19-05-24  1508  		break;
54a8ffa358a1d15 drivers/media/v4l2-core/v4l2-ctrls.c Ezequiel Garcia     20=
20-11-26  1509  	case V4L2_CID_STATELESS_H264_PRED_WEIGHTS:
eb44c6c9c236b15 drivers/media/v4l2-core/v4l2-ctrls.c Ezequiel Garcia     20=
20-08-25  1510  		*type =3D V4L2_CTRL_TYPE_H264_PRED_WEIGHTS;
eb44c6c9c236b15 drivers/media/v4l2-core/v4l2-ctrls.c Ezequiel Garcia     20=
20-08-25  1511  		break;
144ec0ff9bc949a drivers/media/v4l2-core/v4l2-ctrls.c Ezequiel Garcia     20=
21-03-04  1512  	case V4L2_CID_STATELESS_VP8_FRAME:
74da24e41337f38 drivers/media/v4l2-core/v4l2-ctrls.c Ezequiel Garcia     20=
21-03-04  1513  		*type =3D V4L2_CTRL_TYPE_VP8_FRAME;
a57d6acaf352d91 drivers/media/v4l2-core/v4l2-ctrls.c Pawel Osciak        20=
19-07-11  1514  		break;
256fa3920874b0f drivers/media/v4l2-core/v4l2-ctrls.c Paul Kocialkowski   20=
19-10-22  1515  	case V4L2_CID_MPEG_VIDEO_HEVC_SPS:
256fa3920874b0f drivers/media/v4l2-core/v4l2-ctrls.c Paul Kocialkowski   20=
19-10-22  1516  		*type =3D V4L2_CTRL_TYPE_HEVC_SPS;
256fa3920874b0f drivers/media/v4l2-core/v4l2-ctrls.c Paul Kocialkowski   20=
19-10-22  1517  		break;
256fa3920874b0f drivers/media/v4l2-core/v4l2-ctrls.c Paul Kocialkowski   20=
19-10-22  1518  	case V4L2_CID_MPEG_VIDEO_HEVC_PPS:
256fa3920874b0f drivers/media/v4l2-core/v4l2-ctrls.c Paul Kocialkowski   20=
19-10-22  1519  		*type =3D V4L2_CTRL_TYPE_HEVC_PPS;
256fa3920874b0f drivers/media/v4l2-core/v4l2-ctrls.c Paul Kocialkowski   20=
19-10-22  1520  		break;
256fa3920874b0f drivers/media/v4l2-core/v4l2-ctrls.c Paul Kocialkowski   20=
19-10-22  1521  	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:
256fa3920874b0f drivers/media/v4l2-core/v4l2-ctrls.c Paul Kocialkowski   20=
19-10-22  1522  		*type =3D V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS;
256fa3920874b0f drivers/media/v4l2-core/v4l2-ctrls.c Paul Kocialkowski   20=
19-10-22  1523  		break;
61fd036d0111167 drivers/media/v4l2-core/v4l2-ctrls.c Ricardo Ribalda     20=
19-10-07  1524  	case V4L2_CID_UNIT_CELL_SIZE:
61fd036d0111167 drivers/media/v4l2-core/v4l2-ctrls.c Ricardo Ribalda     20=
19-10-07  1525  		*type =3D V4L2_CTRL_TYPE_AREA;
61fd036d0111167 drivers/media/v4l2-core/v4l2-ctrls.c Ricardo Ribalda     20=
19-10-07  1526  		*flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
61fd036d0111167 drivers/media/v4l2-core/v4l2-ctrls.c Ricardo Ribalda     20=
19-10-07  1527  		break;
3bdd96bc270b8a4 drivers/media/v4l2-core/v4l2-ctrls.c Stanimir Varbanov   20=
21-01-19  1528  	case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:
3bdd96bc270b8a4 drivers/media/v4l2-core/v4l2-ctrls.c Stanimir Varbanov   20=
21-01-19  1529  		*type =3D V4L2_CTRL_TYPE_HDR10_CLL_INFO;
3bdd96bc270b8a4 drivers/media/v4l2-core/v4l2-ctrls.c Stanimir Varbanov   20=
21-01-19  1530  		break;
3bdd96bc270b8a4 drivers/media/v4l2-core/v4l2-ctrls.c Stanimir Varbanov   20=
21-01-19  1531  	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
3bdd96bc270b8a4 drivers/media/v4l2-core/v4l2-ctrls.c Stanimir Varbanov   20=
21-01-19  1532  		*type =3D V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
29300e3ca9f169e drivers/media/v4l2-core/v4l2-ctrls.c Boris Brezillon     20=
20-05-18  1533  		break;
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1534  	default:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1535  		*type =3D V4L2_CTRL_TYPE_INTEGER;
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1536  		break;
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1537  	}
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1538  	switch (id) {
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1539  	case V4L2_CID_MPEG_AUDIO_ENCODING:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1540  	case V4L2_CID_MPEG_AUDIO_MODE:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1541  	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1542  	case V4L2_CID_MPEG_VIDEO_B_FRAMES:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1543  	case V4L2_CID_MPEG_STREAM_TYPE:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1544  		*flags |=3D V4L2_CTRL_FLAG_UPDATE;
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1545  		break;
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1546  	case V4L2_CID_AUDIO_VOLUME:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1547  	case V4L2_CID_AUDIO_BALANCE:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1548  	case V4L2_CID_AUDIO_BASS:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1549  	case V4L2_CID_AUDIO_TREBLE:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1550  	case V4L2_CID_BRIGHTNESS:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1551  	case V4L2_CID_CONTRAST:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1552  	case V4L2_CID_SATURATION:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1553  	case V4L2_CID_HUE:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1554  	case V4L2_CID_RED_BALANCE:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1555  	case V4L2_CID_BLUE_BALANCE:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1556  	case V4L2_CID_GAMMA:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1557  	case V4L2_CID_SHARPNESS:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1558  	case V4L2_CID_CHROMA_GAIN:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1559  	case V4L2_CID_RDS_TX_DEVIATION:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1560  	case V4L2_CID_AUDIO_LIMITER_RELEASE_TIME:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1561  	case V4L2_CID_AUDIO_LIMITER_DEVIATION:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1562  	case V4L2_CID_AUDIO_COMPRESSION_GAIN:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1563  	case V4L2_CID_AUDIO_COMPRESSION_THRESHOLD:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1564  	case V4L2_CID_AUDIO_COMPRESSION_ATTACK_TIME:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1565  	case V4L2_CID_AUDIO_COMPRESSION_RELEASE_TIME:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1566  	case V4L2_CID_PILOT_TONE_DEVIATION:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1567  	case V4L2_CID_PILOT_TONE_FREQUENCY:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1568  	case V4L2_CID_TUNE_POWER_LEVEL:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1569  	case V4L2_CID_TUNE_ANTENNA_CAPACITOR:
41018cb84a9ed44 drivers/media/v4l2-core/v4l2-ctrls.c Antti Palosaari     20=
15-10-10  1570  	case V4L2_CID_RF_TUNER_RF_GAIN:
80807fada4398d1 drivers/media/v4l2-core/v4l2-ctrls.c Antti Palosaari     20=
14-01-24  1571  	case V4L2_CID_RF_TUNER_LNA_GAIN:
80807fada4398d1 drivers/media/v4l2-core/v4l2-ctrls.c Antti Palosaari     20=
14-01-24  1572  	case V4L2_CID_RF_TUNER_MIXER_GAIN:
80807fada4398d1 drivers/media/v4l2-core/v4l2-ctrls.c Antti Palosaari     20=
14-01-24  1573  	case V4L2_CID_RF_TUNER_IF_GAIN:
3ce569fd7c55ed9 drivers/media/v4l2-core/v4l2-ctrls.c Antti Palosaari     20=
14-01-31  1574  	case V4L2_CID_RF_TUNER_BANDWIDTH:
a77b4fc0bc328b0 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-03-28  1575  	case V4L2_CID_DETECT_MD_GLOBAL_THRESHOLD:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1576  		*flags |=3D V4L2_CTRL_FLAG_SLIDER;
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1577  		break;
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1578  	case V4L2_CID_PAN_RELATIVE:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1579  	case V4L2_CID_TILT_RELATIVE:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1580  	case V4L2_CID_FOCUS_RELATIVE:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1581  	case V4L2_CID_IRIS_RELATIVE:
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1582  	case V4L2_CID_ZOOM_RELATIVE:
ef66c0ca09595d7 drivers/media/v4l2-core/v4l2-ctrls.c Ricardo Ribalda     20=
15-03-20  1583  		*flags |=3D V4L2_CTRL_FLAG_WRITE_ONLY |
ef66c0ca09595d7 drivers/media/v4l2-core/v4l2-ctrls.c Ricardo Ribalda     20=
15-03-20  1584  			  V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1585  		break;
0b159acdd577dfd drivers/media/video/v4l2-ctrls.c     Sakari Ailus        20=
11-03-21  1586  	case V4L2_CID_FLASH_STROBE_STATUS:
2272ab657b508ec drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  20=
12-05-11  1587  	case V4L2_CID_AUTO_FOCUS_STATUS:
0b159acdd577dfd drivers/media/video/v4l2-ctrls.c     Sakari Ailus        20=
11-03-21  1588  	case V4L2_CID_FLASH_READY:
977ebec754cce0a drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
12-07-03  1589  	case V4L2_CID_DV_TX_HOTPLUG:
977ebec754cce0a drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
12-07-03  1590  	case V4L2_CID_DV_TX_RXSENSE:
977ebec754cce0a drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
12-07-03  1591  	case V4L2_CID_DV_TX_EDID_PRESENT:
977ebec754cce0a drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
12-07-03  1592  	case V4L2_CID_DV_RX_POWER_PRESENT:
45cc29afb47f229 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
16-01-27  1593  	case V4L2_CID_DV_RX_IT_CONTENT_TYPE:
9570a14847a9d33 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-07-21  1594  	case V4L2_CID_RDS_RX_PTY:
9570a14847a9d33 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-07-21  1595  	case V4L2_CID_RDS_RX_PS_NAME:
9570a14847a9d33 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-07-21  1596  	case V4L2_CID_RDS_RX_RADIO_TEXT:
9570a14847a9d33 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-07-21  1597  	case V4L2_CID_RDS_RX_TRAFFIC_ANNOUNCEMENT:
9570a14847a9d33 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-07-21  1598  	case V4L2_CID_RDS_RX_TRAFFIC_PROGRAM:
9570a14847a9d33 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        20=
14-07-21  1599  	case V4L2_CID_RDS_RX_MUSIC_SPEECH:
926645d43fd4362 drivers/media/v4l2-core/v4l2-ctrls.c Jacopo Mondi        20=
20-05-09  1600  	case V4L2_CID_CAMERA_ORIENTATION:
926645d43fd4362 drivers/media/v4l2-core/v4l2-ctrls.c Jacopo Mondi        20=
20-05-09  1601  	case V4L2_CID_CAMERA_SENSOR_ROTATION:
0b159acdd577dfd drivers/media/video/v4l2-ctrls.c     Sakari Ailus        20=
11-03-21  1602  		*flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
0b159acdd577dfd drivers/media/video/v4l2-ctrls.c     Sakari Ailus        20=
11-03-21  1603  		break;
9aa4357e9b10b92 drivers/media/v4l2-core/v4l2-ctrls.c Antti Palosaari     20=
14-02-07  1604  	case V4L2_CID_RF_TUNER_PLL_LOCK:
9aa4357e9b10b92 drivers/media/v4l2-core/v4l2-ctrls.c Antti Palosaari     20=
14-02-07  1605  		*flags |=3D V4L2_CTRL_FLAG_VOLATILE;
9aa4357e9b10b92 drivers/media/v4l2-core/v4l2-ctrls.c Antti Palosaari     20=
14-02-07  1606  		break;
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1607  	}
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1608  }
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1609  EXPORT_SYMBOL(v4l2_ctrl_fill);
0996517cf8eaded drivers/media/video/v4l2-ctrls.c     Hans Verkuil        20=
10-08-01  1610  =


:::::: The code at line 1450 was first introduced by commit
:::::: 24c19a217e543b6b4a7715229f0e1fcf4bbd2659 [media] v4l2-ctrls: add new=
 controls for MPEG decoder devices

:::::: TO: Hans Verkuil <hans.verkuil@cisco.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4564013582811554882==--

