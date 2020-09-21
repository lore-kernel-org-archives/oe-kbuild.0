Content-Type: multipart/mixed; boundary="===============7484570115229783375=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/2] media: v4l2-ctrl: Add layer wise bitrate controls for h264
Date: Tue, 22 Sep 2020 07:17:47 +0800
Message-ID: <202009220745.qiIUZZuf%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7484570115229783375==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1600693440-3015-3-git-send-email-dikshita@codeaurora.org>
References: <1600693440-3015-3-git-send-email-dikshita@codeaurora.org>
TO: Dikshita Agarwal <dikshita@codeaurora.org>
TO: linux-media(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
TO: linux-arm-msm(a)vger.kernel.org
CC: mchehab(a)kernel.org
CC: hverkuil-cisco(a)xs4all.nl
CC: ezequiel(a)collabora.com
CC: stanimir.varbanov(a)linaro.org
CC: vgarodia(a)codeaurora.org
CC: majja(a)codeaurora.org
CC: Dikshita Agarwal <dikshita@codeaurora.org>

Hi Dikshita,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linuxtv-media/master]
[also build test WARNING on next-20200921]
[cannot apply to linux/master linus/master v5.9-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dikshita-Agarwal/Add-new-c=
ontrols-for-QP-and-layer-bitrate/20200921-210901
base:   git://linuxtv.org/media_tree.git master
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: i386-randconfig-m021-20200920 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/v4l2-core/v4l2-ctrls.c:1198 v4l2_ctrl_get_name() warn: Functi=
on too hairy.  No more merges.

# https://github.com/0day-ci/linux/commit/625e95c00f72efba64215adc00f771187=
7436b97
git remote add linux-review https://github.com/0day-ci/linux
git fetch --no-tags linux-review Dikshita-Agarwal/Add-new-controls-for-QP-a=
nd-layer-bitrate/20200921-210901
git checkout 625e95c00f72efba64215adc00f7711877436b97
vim +1198 drivers/media/v4l2-core/v4l2-ctrls.c

d1e9b7c12b745a drivers/media/v4l2-core/v4l2-ctrls.c Sylwester Nawrocki  201=
3-07-09   780  =

0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   781  /* Return the control name. */
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   782  const char *v4l2_ctrl_get_name(u32 id)
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   783  {
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   784  	switch (id) {
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   785  	/* USER controls */
59253f29c0f3a8 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-01-27   786  	/* Keep the order of the 'case's the same as in v4l2-contro=
ls.h! */
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   787  	case V4L2_CID_USER_CLASS:		return "User Controls";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   788  	case V4L2_CID_BRIGHTNESS:		return "Brightness";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   789  	case V4L2_CID_CONTRAST:			return "Contrast";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   790  	case V4L2_CID_SATURATION:		return "Saturation";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   791  	case V4L2_CID_HUE:			return "Hue";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   792  	case V4L2_CID_AUDIO_VOLUME:		return "Volume";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   793  	case V4L2_CID_AUDIO_BALANCE:		return "Balance";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   794  	case V4L2_CID_AUDIO_BASS:		return "Bass";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   795  	case V4L2_CID_AUDIO_TREBLE:		return "Treble";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   796  	case V4L2_CID_AUDIO_MUTE:		return "Mute";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   797  	case V4L2_CID_AUDIO_LOUDNESS:		return "Loudness";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   798  	case V4L2_CID_BLACK_LEVEL:		return "Black Level";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   799  	case V4L2_CID_AUTO_WHITE_BALANCE:	return "White Balance, Au=
tomatic";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   800  	case V4L2_CID_DO_WHITE_BALANCE:		return "Do White Balance";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   801  	case V4L2_CID_RED_BALANCE:		return "Red Balance";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   802  	case V4L2_CID_BLUE_BALANCE:		return "Blue Balance";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   803  	case V4L2_CID_GAMMA:			return "Gamma";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   804  	case V4L2_CID_EXPOSURE:			return "Exposure";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   805  	case V4L2_CID_AUTOGAIN:			return "Gain, Automatic";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   806  	case V4L2_CID_GAIN:			return "Gain";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   807  	case V4L2_CID_HFLIP:			return "Horizontal Flip";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   808  	case V4L2_CID_VFLIP:			return "Vertical Flip";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   809  	case V4L2_CID_POWER_LINE_FREQUENCY:	return "Power Line Freq=
uency";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   810  	case V4L2_CID_HUE_AUTO:			return "Hue, Automatic";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   811  	case V4L2_CID_WHITE_BALANCE_TEMPERATURE: return "White Bala=
nce Temperature";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   812  	case V4L2_CID_SHARPNESS:		return "Sharpness";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   813  	case V4L2_CID_BACKLIGHT_COMPENSATION:	return "Backlight Com=
pensation";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   814  	case V4L2_CID_CHROMA_AGC:		return "Chroma AGC";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   815  	case V4L2_CID_COLOR_KILLER:		return "Color Killer";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   816  	case V4L2_CID_COLORFX:			return "Color Effects";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   817  	case V4L2_CID_AUTOBRIGHTNESS:		return "Brightness, Automati=
c";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   818  	case V4L2_CID_BAND_STOP_FILTER:		return "Band-Stop Filter";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   819  	case V4L2_CID_ROTATE:			return "Rotate";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   820  	case V4L2_CID_BG_COLOR:			return "Background Color";
6c8d61119373aa drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-04-25   821  	case V4L2_CID_CHROMA_GAIN:		return "Chroma Gain";
008d35f2f52567 drivers/media/video/v4l2-ctrls.c     Jean-Fran=C3=A7ois Moin=
e 2010-09-13   822  	case V4L2_CID_ILLUMINATORS_1:		return "Illuminator 1";
008d35f2f52567 drivers/media/video/v4l2-ctrls.c     Jean-Fran=C3=A7ois Moin=
e 2010-09-13   823  	case V4L2_CID_ILLUMINATORS_2:		return "Illuminator 2";
f08aacf84f0a2c drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
2-01-16   824  	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:	return "Min Number o=
f Capture Buffers";
f08aacf84f0a2c drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
2-01-16   825  	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:	return "Min Number of=
 Output Buffers";
cc1d3272327596 drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  201=
1-11-14   826  	case V4L2_CID_ALPHA_COMPONENT:		return "Alpha Component";
6491d1adfbf0e2 drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  201=
2-04-02   827  	case V4L2_CID_COLORFX_CBCR:		return "Color Effects, CbCr";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   828  =

bc9028e1d38419 drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
3-07-09   829  	/* Codec controls */
bc9028e1d38419 drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
3-07-09   830  	/* The MPEG controls are applicable to all codec controls
bc9028e1d38419 drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
3-07-09   831  	 * and the 'MPEG' part of the define is historical */
6c8d61119373aa drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-04-25   832  	/* Keep the order of the 'case's the same as in videodev2.h=
! */
bc9028e1d38419 drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
3-07-09   833  	case V4L2_CID_MPEG_CLASS:		return "Codec Controls";
6c8d61119373aa drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-04-25   834  	case V4L2_CID_MPEG_STREAM_TYPE:		return "Stream Type";
6c8d61119373aa drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-04-25   835  	case V4L2_CID_MPEG_STREAM_PID_PMT:	return "Stream PMT Progr=
am ID";
6c8d61119373aa drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-04-25   836  	case V4L2_CID_MPEG_STREAM_PID_AUDIO:	return "Stream Audio P=
rogram ID";
6c8d61119373aa drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-04-25   837  	case V4L2_CID_MPEG_STREAM_PID_VIDEO:	return "Stream Video P=
rogram ID";
6c8d61119373aa drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-04-25   838  	case V4L2_CID_MPEG_STREAM_PID_PCR:	return "Stream PCR Progr=
am ID";
6c8d61119373aa drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-04-25   839  	case V4L2_CID_MPEG_STREAM_PES_ID_AUDIO: return "Stream PES =
Audio ID";
6c8d61119373aa drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-04-25   840  	case V4L2_CID_MPEG_STREAM_PES_ID_VIDEO: return "Stream PES =
Video ID";
6c8d61119373aa drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-04-25   841  	case V4L2_CID_MPEG_STREAM_VBI_FMT:	return "Stream VBI Forma=
t";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   842  	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ: return "Audio Sampl=
ing Frequency";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   843  	case V4L2_CID_MPEG_AUDIO_ENCODING:	return "Audio Encoding";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   844  	case V4L2_CID_MPEG_AUDIO_L1_BITRATE:	return "Audio Layer I =
Bitrate";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   845  	case V4L2_CID_MPEG_AUDIO_L2_BITRATE:	return "Audio Layer II=
 Bitrate";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   846  	case V4L2_CID_MPEG_AUDIO_L3_BITRATE:	return "Audio Layer II=
I Bitrate";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   847  	case V4L2_CID_MPEG_AUDIO_MODE:		return "Audio Stereo Mode";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   848  	case V4L2_CID_MPEG_AUDIO_MODE_EXTENSION: return "Audio Ster=
eo Mode Extension";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   849  	case V4L2_CID_MPEG_AUDIO_EMPHASIS:	return "Audio Emphasis";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   850  	case V4L2_CID_MPEG_AUDIO_CRC:		return "Audio CRC";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   851  	case V4L2_CID_MPEG_AUDIO_MUTE:		return "Audio Mute";
6c8d61119373aa drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-04-25   852  	case V4L2_CID_MPEG_AUDIO_AAC_BITRATE:	return "Audio AAC Bit=
rate";
6c8d61119373aa drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-04-25   853  	case V4L2_CID_MPEG_AUDIO_AC3_BITRATE:	return "Audio AC-3 Bi=
trate";
24c19a217e543b drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
1-12-15   854  	case V4L2_CID_MPEG_AUDIO_DEC_PLAYBACK:	return "Audio Playba=
ck";
24c19a217e543b drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
1-12-15   855  	case V4L2_CID_MPEG_AUDIO_DEC_MULTILINGUAL_PLAYBACK: return =
"Audio Multilingual Playback";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   856  	case V4L2_CID_MPEG_VIDEO_ENCODING:	return "Video Encoding";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   857  	case V4L2_CID_MPEG_VIDEO_ASPECT:	return "Video Aspect";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   858  	case V4L2_CID_MPEG_VIDEO_B_FRAMES:	return "Video B Frames";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   859  	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:	return "Video GOP Size";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   860  	case V4L2_CID_MPEG_VIDEO_GOP_CLOSURE:	return "Video GOP Clo=
sure";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   861  	case V4L2_CID_MPEG_VIDEO_PULLDOWN:	return "Video Pulldown";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   862  	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:	return "Video Bitrat=
e Mode";
4ad1b0d410c88c drivers/media/v4l2-core/v4l2-ctrls.c Maheshwar Ajja      202=
0-05-23   863  	case V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY:	return "Constant=
 Quality";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   864  	case V4L2_CID_MPEG_VIDEO_BITRATE:	return "Video Bitrate";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   865  	case V4L2_CID_MPEG_VIDEO_BITRATE_PEAK:	return "Video Peak B=
itrate";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   866  	case V4L2_CID_MPEG_VIDEO_TEMPORAL_DECIMATION: return "Video=
 Temporal Decimation";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   867  	case V4L2_CID_MPEG_VIDEO_MUTE:		return "Video Mute";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   868  	case V4L2_CID_MPEG_VIDEO_MUTE_YUV:	return "Video Mute YUV";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   869  	case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:	return "D=
ecoder Slice Interface";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   870  	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:	retu=
rn "MPEG4 Loop Filter Enable";
f08aacf84f0a2c drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
2-01-16   871  	case V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB:	return "N=
umber of Intra Refresh MBs";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   872  	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:		return "Frame Le=
vel Rate Control Enable";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   873  	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:			return "H264 MB Le=
vel Rate Control";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   874  	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:			return "Sequence He=
ader Mode";
f08aacf84f0a2c drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
2-01-16   875  	case V4L2_CID_MPEG_VIDEO_MAX_REF_PIC:			return "Max Number =
of Reference Pics";
44f5b2fffc3213 drivers/media/v4l2-core/v4l2-ctrls.c Stanimir Varbanov   202=
0-07-05   876  	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:		return "Frame Sk=
ip Mode";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   877  	case V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP:		return "H263 I-F=
rame QP Value";
f08aacf84f0a2c drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
2-01-16   878  	case V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP:		return "H263 P-F=
rame QP Value";
f08aacf84f0a2c drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
2-01-16   879  	case V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP:		return "H263 B-F=
rame QP Value";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   880  	case V4L2_CID_MPEG_VIDEO_H263_MIN_QP:			return "H263 Minimu=
m QP Value";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   881  	case V4L2_CID_MPEG_VIDEO_H263_MAX_QP:			return "H263 Maximu=
m QP Value";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   882  	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP:		return "H264 I-F=
rame QP Value";
f08aacf84f0a2c drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
2-01-16   883  	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP:		return "H264 P-F=
rame QP Value";
f08aacf84f0a2c drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
2-01-16   884  	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP:		return "H264 B-F=
rame QP Value";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   885  	case V4L2_CID_MPEG_VIDEO_H264_MAX_QP:			return "H264 Maximu=
m QP Value";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   886  	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP:			return "H264 Minimu=
m QP Value";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   887  	case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:		return "H264 =
8x8 Transform Enable";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   888  	case V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE:			return "H264 CPB =
Buffer Size";
f08aacf84f0a2c drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
2-01-16   889  	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:		return "H264 E=
ntropy Mode";
f08aacf84f0a2c drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
2-01-16   890  	case V4L2_CID_MPEG_VIDEO_H264_I_PERIOD:			return "H264 I-Fr=
ame Period";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   891  	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:			return "H264 Level";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   892  	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA:	return "H2=
64 Loop Filter Alpha Offset";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   893  	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA:		return "H2=
64 Loop Filter Beta Offset";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   894  	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE:		return "H2=
64 Loop Filter Mode";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   895  	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:			return "H264 Profi=
le";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   896  	case V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_HEIGHT:	return "V=
ertical Size of SAR";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   897  	case V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_WIDTH:	return "Ho=
rizontal Size of SAR";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   898  	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE:		return "Aspe=
ct Ratio VUI Enable";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   899  	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC:		return "VUI Asp=
ect Ratio IDC";
2e81dde94316df drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
2-10-03   900  	case V4L2_CID_MPEG_VIDEO_H264_SEI_FRAME_PACKING:	return "H2=
64 Enable Frame Packing SEI";
2e81dde94316df drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
2-10-03   901  	case V4L2_CID_MPEG_VIDEO_H264_SEI_FP_CURRENT_FRAME_0:	retur=
n "H264 Set Curr. Frame as Frame0";
2e81dde94316df drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
2-10-03   902  	case V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE:	retu=
rn "H264 FP Arrangement Type";
2e81dde94316df drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
2-10-03   903  	case V4L2_CID_MPEG_VIDEO_H264_FMO:			return "H264 Flexible =
MB Ordering";
2e81dde94316df drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
2-10-03   904  	case V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE:		return "H264 M=
ap Type for FMO";
2e81dde94316df drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
2-10-03   905  	case V4L2_CID_MPEG_VIDEO_H264_FMO_SLICE_GROUP:		return "H26=
4 FMO Number of Slice Groups";
2e81dde94316df drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
2-10-03   906  	case V4L2_CID_MPEG_VIDEO_H264_FMO_CHANGE_DIRECTION:	return =
"H264 FMO Direction of Change";
2e81dde94316df drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
2-10-03   907  	case V4L2_CID_MPEG_VIDEO_H264_FMO_CHANGE_RATE:		return "H26=
4 FMO Size of 1st Slice Grp";
2e81dde94316df drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
2-10-03   908  	case V4L2_CID_MPEG_VIDEO_H264_FMO_RUN_LENGTH:		return "H264=
 FMO No. of Consecutive MBs";
2e81dde94316df drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
2-10-03   909  	case V4L2_CID_MPEG_VIDEO_H264_ASO:			return "H264 Arbitrary=
 Slice Ordering";
2e81dde94316df drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
2-10-03   910  	case V4L2_CID_MPEG_VIDEO_H264_ASO_SLICE_ORDER:		return "H26=
4 ASO Slice Order";
2e81dde94316df drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
2-10-03   911  	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING:	return "=
Enable H264 Hierarchical Coding";
2e81dde94316df drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
2-10-03   912  	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE:	ret=
urn "H264 Hierarchical Coding Type";
2e81dde94316df drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
2-10-03   913  	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER:ret=
urn "H264 Number of HC Layers";
2e81dde94316df drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
2-10-03   914  	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_QP:
2e81dde94316df drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
2-10-03   915  								return "H264 Set QP Value for HC Layers";
50656bad786d00 drivers/media/v4l2-core/v4l2-ctrls.c Philipp Zabel       201=
9-01-10   916  	case V4L2_CID_MPEG_VIDEO_H264_CONSTRAINED_INTRA_PREDICTION:
50656bad786d00 drivers/media/v4l2-core/v4l2-ctrls.c Philipp Zabel       201=
9-01-10   917  								return "H264 Constrained Intra Pred";
d034696cbe5a6e drivers/media/v4l2-core/v4l2-ctrls.c Philipp Zabel       201=
9-01-10   918  	case V4L2_CID_MPEG_VIDEO_H264_CHROMA_QP_INDEX_OFFSET:	retur=
n "H264 Chroma QP Index Offset";
87effaae9e9047 drivers/media/v4l2-core/v4l2-ctrls.c Fish Lin            201=
9-03-28   919  	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MIN_QP:		return "H264=
 I-Frame Minimum QP Value";
87effaae9e9047 drivers/media/v4l2-core/v4l2-ctrls.c Fish Lin            201=
9-03-28   920  	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MAX_QP:		return "H264=
 I-Frame Maximum QP Value";
87effaae9e9047 drivers/media/v4l2-core/v4l2-ctrls.c Fish Lin            201=
9-03-28   921  	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP:		return "H264=
 P-Frame Minimum QP Value";
87effaae9e9047 drivers/media/v4l2-core/v4l2-ctrls.c Fish Lin            201=
9-03-28   922  	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP:		return "H264=
 P-Frame Maximum QP Value";
b8d0a876b2a0e3 drivers/media/v4l2-core/v4l2-ctrls.c Dikshita Agarwal    202=
0-09-21   923  	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP:		return "H264=
 B-Frame Minimum QP Value";
b8d0a876b2a0e3 drivers/media/v4l2-core/v4l2-ctrls.c Dikshita Agarwal    202=
0-09-21   924  	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP:		return "H264=
 B-Frame Maximum QP Value";
625e95c00f72ef drivers/media/v4l2-core/v4l2-ctrls.c Dikshita Agarwal    202=
0-09-21   925  	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR:	return "H2=
64 Hierarchical Lay 0 BitRate";
625e95c00f72ef drivers/media/v4l2-core/v4l2-ctrls.c Dikshita Agarwal    202=
0-09-21   926  	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR:	return "H2=
64 Hierarchical Lay 1 BitRate";
625e95c00f72ef drivers/media/v4l2-core/v4l2-ctrls.c Dikshita Agarwal    202=
0-09-21   927  	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR:	return "H2=
64 Hierarchical Lay 2 BitRate";
625e95c00f72ef drivers/media/v4l2-core/v4l2-ctrls.c Dikshita Agarwal    202=
0-09-21   928  	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR:	return "H2=
64 Hierarchical Lay 3 BitRate";
625e95c00f72ef drivers/media/v4l2-core/v4l2-ctrls.c Dikshita Agarwal    202=
0-09-21   929  	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR:	return "H2=
64 Hierarchical Lay 4 BitRate";
625e95c00f72ef drivers/media/v4l2-core/v4l2-ctrls.c Dikshita Agarwal    202=
0-09-21   930  	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR:	return "H2=
64 Hierarchical Lay 5 BitRate";
625e95c00f72ef drivers/media/v4l2-core/v4l2-ctrls.c Dikshita Agarwal    202=
0-09-21   931  	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L6_BR:	return "H2=
64 Hierarchical Lay 6 BitRate";
1f0545d3ed1df3 drivers/media/v4l2-core/v4l2-ctrls.c Pawel Osciak        201=
9-05-24   932  	case V4L2_CID_MPEG_VIDEO_H264_SPS:			return "H264 Sequence =
Parameter Set";
1f0545d3ed1df3 drivers/media/v4l2-core/v4l2-ctrls.c Pawel Osciak        201=
9-05-24   933  	case V4L2_CID_MPEG_VIDEO_H264_PPS:			return "H264 Picture P=
arameter Set";
1f0545d3ed1df3 drivers/media/v4l2-core/v4l2-ctrls.c Pawel Osciak        201=
9-05-24   934  	case V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX:		return "H264=
 Scaling Matrix";
1f0545d3ed1df3 drivers/media/v4l2-core/v4l2-ctrls.c Pawel Osciak        201=
9-05-24   935  	case V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS:		return "H264 S=
lice Parameters";
1f0545d3ed1df3 drivers/media/v4l2-core/v4l2-ctrls.c Pawel Osciak        201=
9-05-24   936  	case V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS:		return "H264 =
Decode Parameters";
5604be66a56867 drivers/media/v4l2-core/v4l2-ctrls.c Boris Brezillon     201=
9-08-16   937  	case V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE:		return "H264 De=
code Mode";
8cae93e090113e drivers/media/v4l2-core/v4l2-ctrls.c Ezequiel Garcia     201=
9-08-16   938  	case V4L2_CID_MPEG_VIDEO_H264_START_CODE:		return "H264 Sta=
rt Code";
eb44c6c9c236b1 drivers/media/v4l2-core/v4l2-ctrls.c Ezequiel Garcia     202=
0-08-25   939  	case V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS:		return "H264 P=
rediction Weight Table";
5902bca94ae053 drivers/media/v4l2-core/v4l2-ctrls.c Philipp Zabel       201=
9-04-24   940  	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:			return "MPEG2 Level=
";
5902bca94ae053 drivers/media/v4l2-core/v4l2-ctrls.c Philipp Zabel       201=
9-04-24   941  	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:			return "MPEG2 Pro=
file";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   942  	case V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP:		return "MPEG4 I=
-Frame QP Value";
f08aacf84f0a2c drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
2-01-16   943  	case V4L2_CID_MPEG_VIDEO_MPEG4_P_FRAME_QP:		return "MPEG4 P=
-Frame QP Value";
f08aacf84f0a2c drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
2-01-16   944  	case V4L2_CID_MPEG_VIDEO_MPEG4_B_FRAME_QP:		return "MPEG4 B=
-Frame QP Value";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   945  	case V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP:			return "MPEG4 Mini=
mum QP Value";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   946  	case V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP:			return "MPEG4 Maxi=
mum QP Value";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   947  	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:			return "MPEG4 Level=
";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   948  	case V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE:			return "MPEG4 Pro=
file";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   949  	case V4L2_CID_MPEG_VIDEO_MPEG4_QPEL:			return "Quarter Pixe=
l Search Enable";
f08aacf84f0a2c drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
2-01-16   950  	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES:		return "Ma=
ximum Bytes in a Slice";
f08aacf84f0a2c drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
2-01-16   951  	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:		return "Numbe=
r of MBs in a Slice";
f08aacf84f0a2c drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
2-01-16   952  	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:		return "Slice P=
artitioning Method";
064f50966eb65e drivers/media/video/v4l2-ctrls.c     Kamil Debski        201=
1-06-14   953  	case V4L2_CID_MPEG_VIDEO_VBV_SIZE:			return "VBV Buffer Siz=
e";
24c19a217e543b drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
1-12-15   954  	case V4L2_CID_MPEG_VIDEO_DEC_PTS:			return "Video Decoder P=
TS";
24c19a217e543b drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
1-12-15   955  	case V4L2_CID_MPEG_VIDEO_DEC_FRAME:			return "Video Decoder=
 Frame Count";
2e81dde94316df drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
2-10-03   956  	case V4L2_CID_MPEG_VIDEO_VBV_DELAY:			return "Initial Delay=
 for VBV Control";
bf0bedd3715748 drivers/media/v4l2-core/v4l2-ctrls.c Amit Grover         201=
4-02-04   957  	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:		return "Horizo=
ntal MV Search Range";
bf0bedd3715748 drivers/media/v4l2-core/v4l2-ctrls.c Amit Grover         201=
4-02-04   958  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:		return "Vertic=
al MV Search Range";
9ca5470cc14332 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
3-03-17   959  	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:		return "Repeat=
 Sequence Header";
cedc12108b55d0 drivers/media/v4l2-core/v4l2-ctrls.c Wu-Cheng Li         201=
6-01-19   960  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:		return "Force Ke=
y Frame";
c27bb30e7b6d38 drivers/media/v4l2-core/v4l2-ctrls.c Paul Kocialkowski   201=
8-09-13   961  	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:		return "MPEG-=
2 Slice Parameters";
c27bb30e7b6d38 drivers/media/v4l2-core/v4l2-ctrls.c Paul Kocialkowski   201=
8-09-13   962  	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION:		return "MPEG-=
2 Quantization Matrices";
2495f39ce1fa02 drivers/media/v4l2-core/v4l2-ctrls.c Dafna Hirschfeld    201=
9-03-06   963  	case V4L2_CID_MPEG_VIDEO_FWHT_PARAMS:			return "FWHT Statel=
ess Parameters";
2495f39ce1fa02 drivers/media/v4l2-core/v4l2-ctrls.c Dafna Hirschfeld    201=
9-03-06   964  	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP V=
alue";
2495f39ce1fa02 drivers/media/v4l2-core/v4l2-ctrls.c Dafna Hirschfeld    201=
9-03-06   965  	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP V=
alue";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01   966  =

bc9028e1d38419 drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
3-07-09   967  	/* VPX controls */
bc9028e1d38419 drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
3-07-09   968  	case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:		return "VPX N=
umber of Partitions";
bc9028e1d38419 drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
3-07-09   969  	case V4L2_CID_MPEG_VIDEO_VPX_IMD_DISABLE_4X4:		return "VPX =
Intra Mode Decision Disable";
bc9028e1d38419 drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
3-07-09   970  	case V4L2_CID_MPEG_VIDEO_VPX_NUM_REF_FRAMES:		return "VPX N=
o. of Refs for P Frame";
bc9028e1d38419 drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
3-07-09   971  	case V4L2_CID_MPEG_VIDEO_VPX_FILTER_LEVEL:		return "VPX Loo=
p Filter Level Range";
bc9028e1d38419 drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
3-07-09   972  	case V4L2_CID_MPEG_VIDEO_VPX_FILTER_SHARPNESS:		return "VPX=
 Deblocking Effect Control";
bc9028e1d38419 drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
3-07-09   973  	case V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_REF_PERIOD:	retur=
n "VPX Golden Frame Refresh Period";
bc9028e1d38419 drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
3-07-09   974  	case V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_SEL:		return "VPX=
 Golden Frame Indicator";
4773ab99aa8bda drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
3-11-15   975  	case V4L2_CID_MPEG_VIDEO_VPX_MIN_QP:			return "VPX Minimum =
QP Value";
4773ab99aa8bda drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
3-11-15   976  	case V4L2_CID_MPEG_VIDEO_VPX_MAX_QP:			return "VPX Maximum =
QP Value";
4773ab99aa8bda drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
3-11-15   977  	case V4L2_CID_MPEG_VIDEO_VPX_I_FRAME_QP:		return "VPX I-Fra=
me QP Value";
4773ab99aa8bda drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
3-11-15   978  	case V4L2_CID_MPEG_VIDEO_VPX_P_FRAME_QP:		return "VPX P-Fra=
me QP Value";
5520b9467a39d5 drivers/media/v4l2-core/v4l2-ctrls.c Keiichi Watanabe    201=
8-06-18   979  	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:			return "VP8 Profile=
";
2a75364d09b05f drivers/media/v4l2-core/v4l2-ctrls.c Keiichi Watanabe    201=
8-06-18   980  	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:			return "VP9 Profile=
";
5823833c9adab5 drivers/media/v4l2-core/v4l2-ctrls.c Stanimir Varbanov   202=
0-07-11   981  	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:			return "VP9 Level";
a57d6acaf352d9 drivers/media/v4l2-core/v4l2-ctrls.c Pawel Osciak        201=
9-07-11   982  	case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:		return "VP8 Fra=
me Header";
bc9028e1d38419 drivers/media/v4l2-core/v4l2-ctrls.c Arun Kumar K        201=
3-07-09   983  =

2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02   984  	/* HEVC controls */
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02   985  	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP:		return "HEVC I-F=
rame QP Value";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02   986  	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP:		return "HEVC P-F=
rame QP Value";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02   987  	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:		return "HEVC B-F=
rame QP Value";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02   988  	case V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP:			return "HEVC Minimu=
m QP Value";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02   989  	case V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP:			return "HEVC Maximu=
m QP Value";
b8d0a876b2a0e3 drivers/media/v4l2-core/v4l2-ctrls.c Dikshita Agarwal    202=
0-09-21   990  	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MIN_QP:		return "HEVC=
 I-Frame Minimum QP Value";
b8d0a876b2a0e3 drivers/media/v4l2-core/v4l2-ctrls.c Dikshita Agarwal    202=
0-09-21   991  	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MAX_QP:		return "HEVC=
 I-Frame Maximum QP Value";
b8d0a876b2a0e3 drivers/media/v4l2-core/v4l2-ctrls.c Dikshita Agarwal    202=
0-09-21   992  	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MIN_QP:		return "HEVC=
 P-Frame Minimum QP Value";
b8d0a876b2a0e3 drivers/media/v4l2-core/v4l2-ctrls.c Dikshita Agarwal    202=
0-09-21   993  	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MAX_QP:		return "HEVC=
 P-Frame Maximum QP Value";
b8d0a876b2a0e3 drivers/media/v4l2-core/v4l2-ctrls.c Dikshita Agarwal    202=
0-09-21   994  	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MIN_QP:		return "HEVC=
 B-Frame Minimum QP Value";
b8d0a876b2a0e3 drivers/media/v4l2-core/v4l2-ctrls.c Dikshita Agarwal    202=
0-09-21   995  	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MAX_QP:		return "HEVC=
 B-Frame Maximum QP Value";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02   996  	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:			return "HEVC Profi=
le";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02   997  	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:			return "HEVC Level";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02   998  	case V4L2_CID_MPEG_VIDEO_HEVC_TIER:			return "HEVC Tier";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02   999  	case V4L2_CID_MPEG_VIDEO_HEVC_FRAME_RATE_RESOLUTION:	return=
 "HEVC Frame Rate Resolution";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1000  	case V4L2_CID_MPEG_VIDEO_HEVC_MAX_PARTITION_DEPTH:	return "=
HEVC Maximum Coding Unit Depth";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1001  	case V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_TYPE:		return "HEVC R=
efresh Type";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1002  	case V4L2_CID_MPEG_VIDEO_HEVC_CONST_INTRA_PRED:		return "HE=
VC Constant Intra Prediction";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1003  	case V4L2_CID_MPEG_VIDEO_HEVC_LOSSLESS_CU:		return "HEVC Lo=
ssless Encoding";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1004  	case V4L2_CID_MPEG_VIDEO_HEVC_WAVEFRONT:		return "HEVC Wave=
front";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1005  	case V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE:		return "HE=
VC Loop Filter";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1006  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_QP:			return "HEVC QP Va=
lues";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1007  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE:		return "HE=
VC Hierarchical Coding Type";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1008  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_LAYER:	return "HE=
VC Hierarchical Coding Layer";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1009  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L0_QP:	return "HE=
VC Hierarchical Layer 0 QP";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1010  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L1_QP:	return "HE=
VC Hierarchical Layer 1 QP";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1011  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L2_QP:	return "HE=
VC Hierarchical Layer 2 QP";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1012  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L3_QP:	return "HE=
VC Hierarchical Layer 3 QP";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1013  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_QP:	return "HE=
VC Hierarchical Layer 4 QP";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1014  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_QP:	return "HE=
VC Hierarchical Layer 5 QP";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1015  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_QP:	return "HE=
VC Hierarchical Layer 6 QP";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1016  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L0_BR:	return "HE=
VC Hierarchical Lay 0 BitRate";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1017  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L1_BR:	return "HE=
VC Hierarchical Lay 1 BitRate";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1018  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L2_BR:	return "HE=
VC Hierarchical Lay 2 BitRate";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1019  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L3_BR:	return "HE=
VC Hierarchical Lay 3 BitRate";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1020  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR:	return "HE=
VC Hierarchical Lay 4 BitRate";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1021  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:	return "HE=
VC Hierarchical Lay 5 BitRate";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1022  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_BR:	return "HE=
VC Hierarchical Lay 6 BitRate";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1023  	case V4L2_CID_MPEG_VIDEO_HEVC_GENERAL_PB:		return "HEVC Gen=
eral PB";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1024  	case V4L2_CID_MPEG_VIDEO_HEVC_TEMPORAL_ID:		return "HEVC Te=
mporal ID";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1025  	case V4L2_CID_MPEG_VIDEO_HEVC_STRONG_SMOOTHING:		return "HE=
VC Strong Intra Smoothing";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1026  	case V4L2_CID_MPEG_VIDEO_HEVC_INTRA_PU_SPLIT:		return "HEVC=
 Intra PU Split";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1027  	case V4L2_CID_MPEG_VIDEO_HEVC_TMV_PREDICTION:		return "HEVC=
 TMV Prediction";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1028  	case V4L2_CID_MPEG_VIDEO_HEVC_MAX_NUM_MERGE_MV_MINUS1:	retu=
rn "HEVC Max Num of Candidate MVs";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1029  	case V4L2_CID_MPEG_VIDEO_HEVC_WITHOUT_STARTCODE:	return "HE=
VC ENC Without Startcode";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1030  	case V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_PERIOD:		return "HEVC=
 Num of I-Frame b/w 2 IDR";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1031  	case V4L2_CID_MPEG_VIDEO_HEVC_LF_BETA_OFFSET_DIV2:	return "=
HEVC Loop Filter Beta Offset";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1032  	case V4L2_CID_MPEG_VIDEO_HEVC_LF_TC_OFFSET_DIV2:	return "HE=
VC Loop Filter TC Offset";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1033  	case V4L2_CID_MPEG_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD:	return =
"HEVC Size of Length Field";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1034  	case V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES:	return "Re=
ference Frames for a P-Frame";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1035  	case V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR:		return "Pr=
epend SPS and PPS to IDR";
256fa3920874b0 drivers/media/v4l2-core/v4l2-ctrls.c Paul Kocialkowski   201=
9-10-22  1036  	case V4L2_CID_MPEG_VIDEO_HEVC_SPS:			return "HEVC Sequence =
Parameter Set";
256fa3920874b0 drivers/media/v4l2-core/v4l2-ctrls.c Paul Kocialkowski   201=
9-10-22  1037  	case V4L2_CID_MPEG_VIDEO_HEVC_PPS:			return "HEVC Picture P=
arameter Set";
256fa3920874b0 drivers/media/v4l2-core/v4l2-ctrls.c Paul Kocialkowski   201=
9-10-22  1038  	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:		return "HEVC S=
lice Parameters";
256fa3920874b0 drivers/media/v4l2-core/v4l2-ctrls.c Paul Kocialkowski   201=
9-10-22  1039  	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:		return "HEVC De=
code Mode";
256fa3920874b0 drivers/media/v4l2-core/v4l2-ctrls.c Paul Kocialkowski   201=
9-10-22  1040  	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:		return "HEVC Sta=
rt Code";
2c02837bd99cda drivers/media/v4l2-core/v4l2-ctrls.c Smitha T Murthy     201=
8-02-02  1041  =

0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1042  	/* CAMERA controls */
59253f29c0f3a8 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-01-27  1043  	/* Keep the order of the 'case's the same as in v4l2-contro=
ls.h! */
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1044  	case V4L2_CID_CAMERA_CLASS:		return "Camera Controls";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1045  	case V4L2_CID_EXPOSURE_AUTO:		return "Auto Exposure";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1046  	case V4L2_CID_EXPOSURE_ABSOLUTE:	return "Exposure Time, Abs=
olute";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1047  	case V4L2_CID_EXPOSURE_AUTO_PRIORITY:	return "Exposure, Dyn=
amic Framerate";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1048  	case V4L2_CID_PAN_RELATIVE:		return "Pan, Relative";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1049  	case V4L2_CID_TILT_RELATIVE:		return "Tilt, Relative";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1050  	case V4L2_CID_PAN_RESET:		return "Pan, Reset";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1051  	case V4L2_CID_TILT_RESET:		return "Tilt, Reset";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1052  	case V4L2_CID_PAN_ABSOLUTE:		return "Pan, Absolute";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1053  	case V4L2_CID_TILT_ABSOLUTE:		return "Tilt, Absolute";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1054  	case V4L2_CID_FOCUS_ABSOLUTE:		return "Focus, Absolute";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1055  	case V4L2_CID_FOCUS_RELATIVE:		return "Focus, Relative";
2272ab657b508e drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  201=
2-05-11  1056  	case V4L2_CID_FOCUS_AUTO:		return "Focus, Automatic Continu=
ous";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1057  	case V4L2_CID_ZOOM_ABSOLUTE:		return "Zoom, Absolute";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1058  	case V4L2_CID_ZOOM_RELATIVE:		return "Zoom, Relative";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1059  	case V4L2_CID_ZOOM_CONTINUOUS:		return "Zoom, Continuous";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1060  	case V4L2_CID_PRIVACY:			return "Privacy";
6c8d61119373aa drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-04-25  1061  	case V4L2_CID_IRIS_ABSOLUTE:		return "Iris, Absolute";
6c8d61119373aa drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-04-25  1062  	case V4L2_CID_IRIS_RELATIVE:		return "Iris, Relative";
d58083c949b3d7 drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  201=
2-03-06  1063  	case V4L2_CID_AUTO_EXPOSURE_BIAS:	return "Auto Exposure, Bi=
as";
e40a05736d4503 drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  201=
2-03-06  1064  	case V4L2_CID_AUTO_N_PRESET_WHITE_BALANCE: return "White Ba=
lance, Auto & Preset";
44d44a1acde974 drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  201=
2-03-06  1065  	case V4L2_CID_WIDE_DYNAMIC_RANGE:	return "Wide Dynamic Rang=
e";
82b3056c5a77b6 drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  201=
2-05-01  1066  	case V4L2_CID_IMAGE_STABILIZATION:	return "Image Stabilizat=
ion";
7f84ad8bdb63a8 drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  201=
2-05-01  1067  	case V4L2_CID_ISO_SENSITIVITY:		return "ISO Sensitivity";
7f84ad8bdb63a8 drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  201=
2-05-01  1068  	case V4L2_CID_ISO_SENSITIVITY_AUTO:	return "ISO Sensitivity=
, Auto";
cf072139c7952e drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  201=
2-04-30  1069  	case V4L2_CID_EXPOSURE_METERING:	return "Exposure, Metering=
 Mode";
0bf6b7dc5fd1e6 drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  201=
2-04-16  1070  	case V4L2_CID_SCENE_MODE:		return "Scene Mode";
fc162a099e7b34 drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  201=
2-05-02  1071  	case V4L2_CID_3A_LOCK:			return "3A Lock";
2272ab657b508e drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  201=
2-05-11  1072  	case V4L2_CID_AUTO_FOCUS_START:		return "Auto Focus, Start";
2272ab657b508e drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  201=
2-05-11  1073  	case V4L2_CID_AUTO_FOCUS_STOP:		return "Auto Focus, Stop";
2272ab657b508e drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  201=
2-05-11  1074  	case V4L2_CID_AUTO_FOCUS_STATUS:	return "Auto Focus, Status=
";
2272ab657b508e drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  201=
2-05-11  1075  	case V4L2_CID_AUTO_FOCUS_RANGE:		return "Auto Focus, Range";
e3d6eb1c16ef17 drivers/media/v4l2-core/v4l2-ctrls.c Vincent Palatin     201=
4-09-03  1076  	case V4L2_CID_PAN_SPEED:		return "Pan, Speed";
e3d6eb1c16ef17 drivers/media/v4l2-core/v4l2-ctrls.c Vincent Palatin     201=
4-09-03  1077  	case V4L2_CID_TILT_SPEED:		return "Tilt, Speed";
61fd036d011116 drivers/media/v4l2-core/v4l2-ctrls.c Ricardo Ribalda     201=
9-10-07  1078  	case V4L2_CID_UNIT_CELL_SIZE:		return "Unit Cell Size";
926645d43fd436 drivers/media/v4l2-core/v4l2-ctrls.c Jacopo Mondi        202=
0-05-09  1079  	case V4L2_CID_CAMERA_ORIENTATION:	return "Camera Orientatio=
n";
926645d43fd436 drivers/media/v4l2-core/v4l2-ctrls.c Jacopo Mondi        202=
0-05-09  1080  	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor=
 Rotation";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1081  =

59253f29c0f3a8 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-01-27  1082  	/* FM Radio Modulator controls */
59253f29c0f3a8 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-01-27  1083  	/* Keep the order of the 'case's the same as in v4l2-contro=
ls.h! */
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1084  	case V4L2_CID_FM_TX_CLASS:		return "FM Radio Modulator Cont=
rols";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1085  	case V4L2_CID_RDS_TX_DEVIATION:		return "RDS Signal Deviati=
on";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1086  	case V4L2_CID_RDS_TX_PI:		return "RDS Program ID";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1087  	case V4L2_CID_RDS_TX_PTY:		return "RDS Program Type";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1088  	case V4L2_CID_RDS_TX_PS_NAME:		return "RDS PS Name";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1089  	case V4L2_CID_RDS_TX_RADIO_TEXT:	return "RDS Radio Text";
811c508104d092 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-07-21  1090  	case V4L2_CID_RDS_TX_MONO_STEREO:	return "RDS Stereo";
811c508104d092 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-07-21  1091  	case V4L2_CID_RDS_TX_ARTIFICIAL_HEAD:	return "RDS Artificia=
l Head";
811c508104d092 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-07-21  1092  	case V4L2_CID_RDS_TX_COMPRESSED:	return "RDS Compressed";
811c508104d092 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-07-21  1093  	case V4L2_CID_RDS_TX_DYNAMIC_PTY:	return "RDS Dynamic PTY";
811c508104d092 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-07-21  1094  	case V4L2_CID_RDS_TX_TRAFFIC_ANNOUNCEMENT: return "RDS Traf=
fic Announcement";
811c508104d092 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-07-21  1095  	case V4L2_CID_RDS_TX_TRAFFIC_PROGRAM:	return "RDS Traffic P=
rogram";
811c508104d092 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-07-21  1096  	case V4L2_CID_RDS_TX_MUSIC_SPEECH:	return "RDS Music";
811c508104d092 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-07-21  1097  	case V4L2_CID_RDS_TX_ALT_FREQS_ENABLE:	return "RDS Enable A=
lt Frequencies";
811c508104d092 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-07-21  1098  	case V4L2_CID_RDS_TX_ALT_FREQS:		return "RDS Alternate Freq=
uencies";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1099  	case V4L2_CID_AUDIO_LIMITER_ENABLED:	return "Audio Limiter =
Feature Enabled";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1100  	case V4L2_CID_AUDIO_LIMITER_RELEASE_TIME: return "Audio Lim=
iter Release Time";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1101  	case V4L2_CID_AUDIO_LIMITER_DEVIATION:	return "Audio Limite=
r Deviation";
f08aacf84f0a2c drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
2-01-16  1102  	case V4L2_CID_AUDIO_COMPRESSION_ENABLED: return "Audio Comp=
ression Enabled";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1103  	case V4L2_CID_AUDIO_COMPRESSION_GAIN:	return "Audio Compres=
sion Gain";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1104  	case V4L2_CID_AUDIO_COMPRESSION_THRESHOLD: return "Audio Co=
mpression Threshold";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1105  	case V4L2_CID_AUDIO_COMPRESSION_ATTACK_TIME: return "Audio =
Compression Attack Time";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1106  	case V4L2_CID_AUDIO_COMPRESSION_RELEASE_TIME: return "Audio=
 Compression Release Time";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1107  	case V4L2_CID_PILOT_TONE_ENABLED:	return "Pilot Tone Featur=
e Enabled";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1108  	case V4L2_CID_PILOT_TONE_DEVIATION:	return "Pilot Tone Devi=
ation";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1109  	case V4L2_CID_PILOT_TONE_FREQUENCY:	return "Pilot Tone Freq=
uency";
f08aacf84f0a2c drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
2-01-16  1110  	case V4L2_CID_TUNE_PREEMPHASIS:		return "Pre-Emphasis";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1111  	case V4L2_CID_TUNE_POWER_LEVEL:		return "Tune Power Level";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1112  	case V4L2_CID_TUNE_ANTENNA_CAPACITOR:	return "Tune Antenna =
Capacitor";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1113  =

0b159acdd577df drivers/media/video/v4l2-ctrls.c     Sakari Ailus        201=
1-03-21  1114  	/* Flash controls */
59253f29c0f3a8 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-01-27  1115  	/* Keep the order of the 'case's the same as in v4l2-contro=
ls.h! */
f08aacf84f0a2c drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
2-01-16  1116  	case V4L2_CID_FLASH_CLASS:		return "Flash Controls";
f08aacf84f0a2c drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
2-01-16  1117  	case V4L2_CID_FLASH_LED_MODE:		return "LED Mode";
f08aacf84f0a2c drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
2-01-16  1118  	case V4L2_CID_FLASH_STROBE_SOURCE:	return "Strobe Source";
0b159acdd577df drivers/media/video/v4l2-ctrls.c     Sakari Ailus        201=
1-03-21  1119  	case V4L2_CID_FLASH_STROBE:		return "Strobe";
f08aacf84f0a2c drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
2-01-16  1120  	case V4L2_CID_FLASH_STROBE_STOP:	return "Stop Strobe";
f08aacf84f0a2c drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
2-01-16  1121  	case V4L2_CID_FLASH_STROBE_STATUS:	return "Strobe Status";
f08aacf84f0a2c drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
2-01-16  1122  	case V4L2_CID_FLASH_TIMEOUT:		return "Strobe Timeout";
f08aacf84f0a2c drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
2-01-16  1123  	case V4L2_CID_FLASH_INTENSITY:		return "Intensity, Flash Mo=
de";
f08aacf84f0a2c drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
2-01-16  1124  	case V4L2_CID_FLASH_TORCH_INTENSITY:	return "Intensity, Tor=
ch Mode";
f08aacf84f0a2c drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
2-01-16  1125  	case V4L2_CID_FLASH_INDICATOR_INTENSITY: return "Intensity,=
 Indicator";
0b159acdd577df drivers/media/video/v4l2-ctrls.c     Sakari Ailus        201=
1-03-21  1126  	case V4L2_CID_FLASH_FAULT:		return "Faults";
0b159acdd577df drivers/media/video/v4l2-ctrls.c     Sakari Ailus        201=
1-03-21  1127  	case V4L2_CID_FLASH_CHARGE:		return "Charge";
f08aacf84f0a2c drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
2-01-16  1128  	case V4L2_CID_FLASH_READY:		return "Ready to Strobe";
0b159acdd577df drivers/media/video/v4l2-ctrls.c     Sakari Ailus        201=
1-03-21  1129  =

c7361ae1e7a5a5 drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  201=
2-01-20  1130  	/* JPEG encoder controls */
59253f29c0f3a8 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-01-27  1131  	/* Keep the order of the 'case's the same as in v4l2-contro=
ls.h! */
c7361ae1e7a5a5 drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  201=
2-01-20  1132  	case V4L2_CID_JPEG_CLASS:		return "JPEG Compression Control=
s";
c7361ae1e7a5a5 drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  201=
2-01-20  1133  	case V4L2_CID_JPEG_CHROMA_SUBSAMPLING:	return "Chroma Subsa=
mpling";
c7361ae1e7a5a5 drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  201=
2-01-20  1134  	case V4L2_CID_JPEG_RESTART_INTERVAL:	return "Restart Interv=
al";
c7361ae1e7a5a5 drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  201=
2-01-20  1135  	case V4L2_CID_JPEG_COMPRESSION_QUALITY:	return "Compression=
 Quality";
c7361ae1e7a5a5 drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  201=
2-01-20  1136  	case V4L2_CID_JPEG_ACTIVE_MARKER:	return "Active Markers";
c7361ae1e7a5a5 drivers/media/video/v4l2-ctrls.c     Sylwester Nawrocki  201=
2-01-20  1137  =

8c9d236ec64f1f drivers/media/video/v4l2-ctrls.c     Sakari Ailus        201=
1-10-04  1138  	/* Image source controls */
59253f29c0f3a8 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-01-27  1139  	/* Keep the order of the 'case's the same as in v4l2-contro=
ls.h! */
8c9d236ec64f1f drivers/media/video/v4l2-ctrls.c     Sakari Ailus        201=
1-10-04  1140  	case V4L2_CID_IMAGE_SOURCE_CLASS:	return "Image Source Cont=
rols";
8c9d236ec64f1f drivers/media/video/v4l2-ctrls.c     Sakari Ailus        201=
1-10-04  1141  	case V4L2_CID_VBLANK:			return "Vertical Blanking";
8c9d236ec64f1f drivers/media/video/v4l2-ctrls.c     Sakari Ailus        201=
1-10-04  1142  	case V4L2_CID_HBLANK:			return "Horizontal Blanking";
8c9d236ec64f1f drivers/media/video/v4l2-ctrls.c     Sakari Ailus        201=
1-10-04  1143  	case V4L2_CID_ANALOGUE_GAIN:		return "Analogue Gain";
0fc87864879c46 drivers/media/v4l2-core/v4l2-ctrls.c Sakari Ailus        201=
4-05-28  1144  	case V4L2_CID_TEST_PATTERN_RED:		return "Red Pixel Value";
0fc87864879c46 drivers/media/v4l2-core/v4l2-ctrls.c Sakari Ailus        201=
4-05-28  1145  	case V4L2_CID_TEST_PATTERN_GREENR:	return "Green (Red) Pixe=
l Value";
0fc87864879c46 drivers/media/v4l2-core/v4l2-ctrls.c Sakari Ailus        201=
4-05-28  1146  	case V4L2_CID_TEST_PATTERN_BLUE:	return "Blue Pixel Value";
0fc87864879c46 drivers/media/v4l2-core/v4l2-ctrls.c Sakari Ailus        201=
4-05-28  1147  	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pix=
el Value";
8c9d236ec64f1f drivers/media/video/v4l2-ctrls.c     Sakari Ailus        201=
1-10-04  1148  =

c643ee13519038 drivers/media/video/v4l2-ctrls.c     Sakari Ailus        201=
2-02-02  1149  	/* Image processing controls */
59253f29c0f3a8 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-01-27  1150  	/* Keep the order of the 'case's the same as in v4l2-contro=
ls.h! */
c643ee13519038 drivers/media/video/v4l2-ctrls.c     Sakari Ailus        201=
2-02-02  1151  	case V4L2_CID_IMAGE_PROC_CLASS:		return "Image Processing C=
ontrols";
c643ee13519038 drivers/media/video/v4l2-ctrls.c     Sakari Ailus        201=
2-02-02  1152  	case V4L2_CID_LINK_FREQ:		return "Link Frequency";
c643ee13519038 drivers/media/video/v4l2-ctrls.c     Sakari Ailus        201=
2-02-02  1153  	case V4L2_CID_PIXEL_RATE:		return "Pixel Rate";
5ebef0fbe0f72f drivers/media/v4l2-core/v4l2-ctrls.c Lad, Prabhakar      201=
2-10-01  1154  	case V4L2_CID_TEST_PATTERN:		return "Test Pattern";
446e412597217e drivers/media/v4l2-core/v4l2-ctrls.c Laurent Pinchart    201=
6-08-04  1155  	case V4L2_CID_DEINTERLACING_MODE:	return "Deinterlacing Mod=
e";
e72cb0e79475b0 drivers/media/v4l2-core/v4l2-ctrls.c Sakari Ailus        201=
7-06-08  1156  	case V4L2_CID_DIGITAL_GAIN:		return "Digital Gain";
c643ee13519038 drivers/media/video/v4l2-ctrls.c     Sakari Ailus        201=
2-02-02  1157  =

977ebec754cce0 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
2-07-03  1158  	/* DV controls */
59253f29c0f3a8 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-01-27  1159  	/* Keep the order of the 'case's the same as in v4l2-contro=
ls.h! */
977ebec754cce0 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
2-07-03  1160  	case V4L2_CID_DV_CLASS:			return "Digital Video Controls";
977ebec754cce0 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
2-07-03  1161  	case V4L2_CID_DV_TX_HOTPLUG:		return "Hotplug Present";
977ebec754cce0 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
2-07-03  1162  	case V4L2_CID_DV_TX_RXSENSE:		return "RxSense Present";
977ebec754cce0 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
2-07-03  1163  	case V4L2_CID_DV_TX_EDID_PRESENT:	return "EDID Present";
977ebec754cce0 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
2-07-03  1164  	case V4L2_CID_DV_TX_MODE:		return "Transmit Mode";
977ebec754cce0 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
2-07-03  1165  	case V4L2_CID_DV_TX_RGB_RANGE:		return "Tx RGB Quantization=
 Range";
45cc29afb47f22 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
6-01-27  1166  	case V4L2_CID_DV_TX_IT_CONTENT_TYPE:	return "Tx IT Content =
Type";
977ebec754cce0 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
2-07-03  1167  	case V4L2_CID_DV_RX_POWER_PRESENT:	return "Power Present";
977ebec754cce0 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
2-07-03  1168  	case V4L2_CID_DV_RX_RGB_RANGE:		return "Rx RGB Quantization=
 Range";
45cc29afb47f22 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
6-01-27  1169  	case V4L2_CID_DV_RX_IT_CONTENT_TYPE:	return "Rx IT Content =
Type";
977ebec754cce0 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
2-07-03  1170  =

aec330a8cbd373 drivers/media/v4l2-core/v4l2-ctrls.c Andrey Smirnov      201=
3-03-26  1171  	case V4L2_CID_FM_RX_CLASS:		return "FM Radio Receiver Contr=
ols";
aec330a8cbd373 drivers/media/v4l2-core/v4l2-ctrls.c Andrey Smirnov      201=
3-03-26  1172  	case V4L2_CID_TUNE_DEEMPHASIS:		return "De-Emphasis";
aec330a8cbd373 drivers/media/v4l2-core/v4l2-ctrls.c Andrey Smirnov      201=
3-03-26  1173  	case V4L2_CID_RDS_RECEPTION:		return "RDS Reception";
80807fada4398d drivers/media/v4l2-core/v4l2-ctrls.c Antti Palosaari     201=
4-01-24  1174  	case V4L2_CID_RF_TUNER_CLASS:		return "RF Tuner Controls";
41018cb84a9ed4 drivers/media/v4l2-core/v4l2-ctrls.c Antti Palosaari     201=
5-10-10  1175  	case V4L2_CID_RF_TUNER_RF_GAIN:		return "RF Gain";
80807fada4398d drivers/media/v4l2-core/v4l2-ctrls.c Antti Palosaari     201=
4-01-24  1176  	case V4L2_CID_RF_TUNER_LNA_GAIN_AUTO:	return "LNA Gain, Aut=
o";
80807fada4398d drivers/media/v4l2-core/v4l2-ctrls.c Antti Palosaari     201=
4-01-24  1177  	case V4L2_CID_RF_TUNER_LNA_GAIN:	return "LNA Gain";
80807fada4398d drivers/media/v4l2-core/v4l2-ctrls.c Antti Palosaari     201=
4-01-24  1178  	case V4L2_CID_RF_TUNER_MIXER_GAIN_AUTO:	return "Mixer Gain,=
 Auto";
80807fada4398d drivers/media/v4l2-core/v4l2-ctrls.c Antti Palosaari     201=
4-01-24  1179  	case V4L2_CID_RF_TUNER_MIXER_GAIN:	return "Mixer Gain";
80807fada4398d drivers/media/v4l2-core/v4l2-ctrls.c Antti Palosaari     201=
4-01-24  1180  	case V4L2_CID_RF_TUNER_IF_GAIN_AUTO:	return "IF Gain, Auto";
80807fada4398d drivers/media/v4l2-core/v4l2-ctrls.c Antti Palosaari     201=
4-01-24  1181  	case V4L2_CID_RF_TUNER_IF_GAIN:		return "IF Gain";
3ce569fd7c55ed drivers/media/v4l2-core/v4l2-ctrls.c Antti Palosaari     201=
4-01-31  1182  	case V4L2_CID_RF_TUNER_BANDWIDTH_AUTO:	return "Bandwidth, A=
uto";
3ce569fd7c55ed drivers/media/v4l2-core/v4l2-ctrls.c Antti Palosaari     201=
4-01-31  1183  	case V4L2_CID_RF_TUNER_BANDWIDTH:	return "Bandwidth";
9aa4357e9b10b9 drivers/media/v4l2-core/v4l2-ctrls.c Antti Palosaari     201=
4-02-07  1184  	case V4L2_CID_RF_TUNER_PLL_LOCK:	return "PLL Lock";
9570a14847a9d3 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-07-21  1185  	case V4L2_CID_RDS_RX_PTY:		return "RDS Program Type";
9570a14847a9d3 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-07-21  1186  	case V4L2_CID_RDS_RX_PS_NAME:		return "RDS PS Name";
9570a14847a9d3 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-07-21  1187  	case V4L2_CID_RDS_RX_RADIO_TEXT:	return "RDS Radio Text";
9570a14847a9d3 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-07-21  1188  	case V4L2_CID_RDS_RX_TRAFFIC_ANNOUNCEMENT: return "RDS Traf=
fic Announcement";
9570a14847a9d3 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-07-21  1189  	case V4L2_CID_RDS_RX_TRAFFIC_PROGRAM:	return "RDS Traffic P=
rogram";
9570a14847a9d3 drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-07-21  1190  	case V4L2_CID_RDS_RX_MUSIC_SPEECH:	return "RDS Music";
a77b4fc0bc328b drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-03-28  1191  =

a77b4fc0bc328b drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-03-28  1192  	/* Detection controls */
a77b4fc0bc328b drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-03-28  1193  	/* Keep the order of the 'case's the same as in v4l2-contro=
ls.h! */
a77b4fc0bc328b drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-03-28  1194  	case V4L2_CID_DETECT_CLASS:		return "Detection Controls";
a77b4fc0bc328b drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-03-28  1195  	case V4L2_CID_DETECT_MD_MODE:		return "Motion Detection Mod=
e";
a77b4fc0bc328b drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-03-28  1196  	case V4L2_CID_DETECT_MD_GLOBAL_THRESHOLD: return "MD Global=
 Threshold";
a77b4fc0bc328b drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-03-28  1197  	case V4L2_CID_DETECT_MD_THRESHOLD_GRID:	return "MD Threshol=
d Grid";
a77b4fc0bc328b drivers/media/v4l2-core/v4l2-ctrls.c Hans Verkuil        201=
4-03-28 @1198  	case V4L2_CID_DETECT_MD_REGION_GRID:	return "MD Region Grid=
";
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1199  	default:
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1200  		return NULL;
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1201  	}
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1202  }
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1203  EXPORT_SYMBOL(v4l2_ctrl_get_name);
0996517cf8eade drivers/media/video/v4l2-ctrls.c     Hans Verkuil        201=
0-08-01  1204  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7484570115229783375==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
xNa0Hx14x2VHKd7/D8vAnSZMpAIA
--===============7484570115229783375==--

