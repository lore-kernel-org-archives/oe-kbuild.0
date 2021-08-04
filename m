Content-Type: multipart/mixed; boundary="===============5372633612343060848=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 1/2] media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAIN_XXX controls
Date: Thu, 05 Aug 2021 02:44:52 +0800
Message-ID: <202108050224.wfN5ErRw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5372633612343060848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210722121249.16483-2-david.plowman@raspberrypi.com>
References: <20210722121249.16483-2-david.plowman@raspberrypi.com>
TO: David Plowman <david.plowman@raspberrypi.com>
TO: linux-media(a)vger.kernel.org
TO: sakari.ailus(a)iki.fi
TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
TO: Kieran Bingham <kieran.bingham@ideasonboard.com>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
TO: Hans Verkuil <hverkuil@xs4all.nl>
CC: David Plowman <david.plowman@raspberrypi.com>

Hi David,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linuxtv-media/master]
[also build test WARNING on v5.14-rc4 next-20210804]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/David-Plowman/New-V4L2-con=
trols-V4L2_CID_NOTIFY_GAIN_XXX/20210722-201502
base:   git://linuxtv.org/media_tree.git master
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: x86_64-randconfig-m001-20210804 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/v4l2-core/v4l2-ctrls-defs.c:1186 v4l2_ctrl_get_name() warn: F=
unction too hairy.  No more merges.

vim +1186 drivers/media/v4l2-core/v4l2-ctrls-defs.c

71c689dc2e732d Hans Verkuil      2021-04-27   740  =

71c689dc2e732d Hans Verkuil      2021-04-27   741  /* Return the control na=
me. */
71c689dc2e732d Hans Verkuil      2021-04-27   742  const char *v4l2_ctrl_ge=
t_name(u32 id)
71c689dc2e732d Hans Verkuil      2021-04-27   743  {
71c689dc2e732d Hans Verkuil      2021-04-27   744  	switch (id) {
71c689dc2e732d Hans Verkuil      2021-04-27   745  	/* USER controls */
71c689dc2e732d Hans Verkuil      2021-04-27   746  	/* Keep the order of th=
e 'case's the same as in v4l2-controls.h! */
71c689dc2e732d Hans Verkuil      2021-04-27   747  	case V4L2_CID_USER_CLAS=
S:		return "User Controls";
71c689dc2e732d Hans Verkuil      2021-04-27   748  	case V4L2_CID_BRIGHTNES=
S:		return "Brightness";
71c689dc2e732d Hans Verkuil      2021-04-27   749  	case V4L2_CID_CONTRAST:=
			return "Contrast";
71c689dc2e732d Hans Verkuil      2021-04-27   750  	case V4L2_CID_SATURATIO=
N:		return "Saturation";
71c689dc2e732d Hans Verkuil      2021-04-27   751  	case V4L2_CID_HUE:			re=
turn "Hue";
71c689dc2e732d Hans Verkuil      2021-04-27   752  	case V4L2_CID_AUDIO_VOL=
UME:		return "Volume";
71c689dc2e732d Hans Verkuil      2021-04-27   753  	case V4L2_CID_AUDIO_BAL=
ANCE:		return "Balance";
71c689dc2e732d Hans Verkuil      2021-04-27   754  	case V4L2_CID_AUDIO_BAS=
S:		return "Bass";
71c689dc2e732d Hans Verkuil      2021-04-27   755  	case V4L2_CID_AUDIO_TRE=
BLE:		return "Treble";
71c689dc2e732d Hans Verkuil      2021-04-27   756  	case V4L2_CID_AUDIO_MUT=
E:		return "Mute";
71c689dc2e732d Hans Verkuil      2021-04-27   757  	case V4L2_CID_AUDIO_LOU=
DNESS:		return "Loudness";
71c689dc2e732d Hans Verkuil      2021-04-27   758  	case V4L2_CID_BLACK_LEV=
EL:		return "Black Level";
71c689dc2e732d Hans Verkuil      2021-04-27   759  	case V4L2_CID_AUTO_WHIT=
E_BALANCE:	return "White Balance, Automatic";
71c689dc2e732d Hans Verkuil      2021-04-27   760  	case V4L2_CID_DO_WHITE_=
BALANCE:		return "Do White Balance";
71c689dc2e732d Hans Verkuil      2021-04-27   761  	case V4L2_CID_RED_BALAN=
CE:		return "Red Balance";
71c689dc2e732d Hans Verkuil      2021-04-27   762  	case V4L2_CID_BLUE_BALA=
NCE:		return "Blue Balance";
71c689dc2e732d Hans Verkuil      2021-04-27   763  	case V4L2_CID_GAMMA:			=
return "Gamma";
71c689dc2e732d Hans Verkuil      2021-04-27   764  	case V4L2_CID_EXPOSURE:=
			return "Exposure";
71c689dc2e732d Hans Verkuil      2021-04-27   765  	case V4L2_CID_AUTOGAIN:=
			return "Gain, Automatic";
71c689dc2e732d Hans Verkuil      2021-04-27   766  	case V4L2_CID_GAIN:			r=
eturn "Gain";
71c689dc2e732d Hans Verkuil      2021-04-27   767  	case V4L2_CID_HFLIP:			=
return "Horizontal Flip";
71c689dc2e732d Hans Verkuil      2021-04-27   768  	case V4L2_CID_VFLIP:			=
return "Vertical Flip";
71c689dc2e732d Hans Verkuil      2021-04-27   769  	case V4L2_CID_POWER_LIN=
E_FREQUENCY:	return "Power Line Frequency";
71c689dc2e732d Hans Verkuil      2021-04-27   770  	case V4L2_CID_HUE_AUTO:=
			return "Hue, Automatic";
71c689dc2e732d Hans Verkuil      2021-04-27   771  	case V4L2_CID_WHITE_BAL=
ANCE_TEMPERATURE: return "White Balance Temperature";
71c689dc2e732d Hans Verkuil      2021-04-27   772  	case V4L2_CID_SHARPNESS=
:		return "Sharpness";
71c689dc2e732d Hans Verkuil      2021-04-27   773  	case V4L2_CID_BACKLIGHT=
_COMPENSATION:	return "Backlight Compensation";
71c689dc2e732d Hans Verkuil      2021-04-27   774  	case V4L2_CID_CHROMA_AG=
C:		return "Chroma AGC";
71c689dc2e732d Hans Verkuil      2021-04-27   775  	case V4L2_CID_COLOR_KIL=
LER:		return "Color Killer";
71c689dc2e732d Hans Verkuil      2021-04-27   776  	case V4L2_CID_COLORFX:	=
		return "Color Effects";
71c689dc2e732d Hans Verkuil      2021-04-27   777  	case V4L2_CID_AUTOBRIGH=
TNESS:		return "Brightness, Automatic";
71c689dc2e732d Hans Verkuil      2021-04-27   778  	case V4L2_CID_BAND_STOP=
_FILTER:		return "Band-Stop Filter";
71c689dc2e732d Hans Verkuil      2021-04-27   779  	case V4L2_CID_ROTATE:		=
	return "Rotate";
71c689dc2e732d Hans Verkuil      2021-04-27   780  	case V4L2_CID_BG_COLOR:=
			return "Background Color";
71c689dc2e732d Hans Verkuil      2021-04-27   781  	case V4L2_CID_CHROMA_GA=
IN:		return "Chroma Gain";
71c689dc2e732d Hans Verkuil      2021-04-27   782  	case V4L2_CID_ILLUMINAT=
ORS_1:		return "Illuminator 1";
71c689dc2e732d Hans Verkuil      2021-04-27   783  	case V4L2_CID_ILLUMINAT=
ORS_2:		return "Illuminator 2";
71c689dc2e732d Hans Verkuil      2021-04-27   784  	case V4L2_CID_MIN_BUFFE=
RS_FOR_CAPTURE:	return "Min Number of Capture Buffers";
71c689dc2e732d Hans Verkuil      2021-04-27   785  	case V4L2_CID_MIN_BUFFE=
RS_FOR_OUTPUT:	return "Min Number of Output Buffers";
71c689dc2e732d Hans Verkuil      2021-04-27   786  	case V4L2_CID_ALPHA_COM=
PONENT:		return "Alpha Component";
71c689dc2e732d Hans Verkuil      2021-04-27   787  	case V4L2_CID_COLORFX_C=
BCR:		return "Color Effects, CbCr";
71c689dc2e732d Hans Verkuil      2021-04-27   788  =

71c689dc2e732d Hans Verkuil      2021-04-27   789  	/*
71c689dc2e732d Hans Verkuil      2021-04-27   790  	 * Codec controls
71c689dc2e732d Hans Verkuil      2021-04-27   791  	 *
71c689dc2e732d Hans Verkuil      2021-04-27   792  	 * The MPEG controls ar=
e applicable to all codec controls
71c689dc2e732d Hans Verkuil      2021-04-27   793  	 * and the 'MPEG' part =
of the define is historical.
71c689dc2e732d Hans Verkuil      2021-04-27   794  	 *
71c689dc2e732d Hans Verkuil      2021-04-27   795  	 * Keep the order of th=
e 'case's the same as in videodev2.h!
71c689dc2e732d Hans Verkuil      2021-04-27   796  	 */
71c689dc2e732d Hans Verkuil      2021-04-27   797  	case V4L2_CID_CODEC_CLA=
SS:		return "Codec Controls";
71c689dc2e732d Hans Verkuil      2021-04-27   798  	case V4L2_CID_MPEG_STRE=
AM_TYPE:		return "Stream Type";
71c689dc2e732d Hans Verkuil      2021-04-27   799  	case V4L2_CID_MPEG_STRE=
AM_PID_PMT:	return "Stream PMT Program ID";
71c689dc2e732d Hans Verkuil      2021-04-27   800  	case V4L2_CID_MPEG_STRE=
AM_PID_AUDIO:	return "Stream Audio Program ID";
71c689dc2e732d Hans Verkuil      2021-04-27   801  	case V4L2_CID_MPEG_STRE=
AM_PID_VIDEO:	return "Stream Video Program ID";
71c689dc2e732d Hans Verkuil      2021-04-27   802  	case V4L2_CID_MPEG_STRE=
AM_PID_PCR:	return "Stream PCR Program ID";
71c689dc2e732d Hans Verkuil      2021-04-27   803  	case V4L2_CID_MPEG_STRE=
AM_PES_ID_AUDIO: return "Stream PES Audio ID";
71c689dc2e732d Hans Verkuil      2021-04-27   804  	case V4L2_CID_MPEG_STRE=
AM_PES_ID_VIDEO: return "Stream PES Video ID";
71c689dc2e732d Hans Verkuil      2021-04-27   805  	case V4L2_CID_MPEG_STRE=
AM_VBI_FMT:	return "Stream VBI Format";
71c689dc2e732d Hans Verkuil      2021-04-27   806  	case V4L2_CID_MPEG_AUDI=
O_SAMPLING_FREQ: return "Audio Sampling Frequency";
71c689dc2e732d Hans Verkuil      2021-04-27   807  	case V4L2_CID_MPEG_AUDI=
O_ENCODING:	return "Audio Encoding";
71c689dc2e732d Hans Verkuil      2021-04-27   808  	case V4L2_CID_MPEG_AUDI=
O_L1_BITRATE:	return "Audio Layer I Bitrate";
71c689dc2e732d Hans Verkuil      2021-04-27   809  	case V4L2_CID_MPEG_AUDI=
O_L2_BITRATE:	return "Audio Layer II Bitrate";
71c689dc2e732d Hans Verkuil      2021-04-27   810  	case V4L2_CID_MPEG_AUDI=
O_L3_BITRATE:	return "Audio Layer III Bitrate";
71c689dc2e732d Hans Verkuil      2021-04-27   811  	case V4L2_CID_MPEG_AUDI=
O_MODE:		return "Audio Stereo Mode";
71c689dc2e732d Hans Verkuil      2021-04-27   812  	case V4L2_CID_MPEG_AUDI=
O_MODE_EXTENSION: return "Audio Stereo Mode Extension";
71c689dc2e732d Hans Verkuil      2021-04-27   813  	case V4L2_CID_MPEG_AUDI=
O_EMPHASIS:	return "Audio Emphasis";
71c689dc2e732d Hans Verkuil      2021-04-27   814  	case V4L2_CID_MPEG_AUDI=
O_CRC:		return "Audio CRC";
71c689dc2e732d Hans Verkuil      2021-04-27   815  	case V4L2_CID_MPEG_AUDI=
O_MUTE:		return "Audio Mute";
71c689dc2e732d Hans Verkuil      2021-04-27   816  	case V4L2_CID_MPEG_AUDI=
O_AAC_BITRATE:	return "Audio AAC Bitrate";
71c689dc2e732d Hans Verkuil      2021-04-27   817  	case V4L2_CID_MPEG_AUDI=
O_AC3_BITRATE:	return "Audio AC-3 Bitrate";
71c689dc2e732d Hans Verkuil      2021-04-27   818  	case V4L2_CID_MPEG_AUDI=
O_DEC_PLAYBACK:	return "Audio Playback";
71c689dc2e732d Hans Verkuil      2021-04-27   819  	case V4L2_CID_MPEG_AUDI=
O_DEC_MULTILINGUAL_PLAYBACK: return "Audio Multilingual Playback";
71c689dc2e732d Hans Verkuil      2021-04-27   820  	case V4L2_CID_MPEG_VIDE=
O_ENCODING:	return "Video Encoding";
71c689dc2e732d Hans Verkuil      2021-04-27   821  	case V4L2_CID_MPEG_VIDE=
O_ASPECT:	return "Video Aspect";
71c689dc2e732d Hans Verkuil      2021-04-27   822  	case V4L2_CID_MPEG_VIDE=
O_B_FRAMES:	return "Video B Frames";
71c689dc2e732d Hans Verkuil      2021-04-27   823  	case V4L2_CID_MPEG_VIDE=
O_GOP_SIZE:	return "Video GOP Size";
71c689dc2e732d Hans Verkuil      2021-04-27   824  	case V4L2_CID_MPEG_VIDE=
O_GOP_CLOSURE:	return "Video GOP Closure";
71c689dc2e732d Hans Verkuil      2021-04-27   825  	case V4L2_CID_MPEG_VIDE=
O_PULLDOWN:	return "Video Pulldown";
71c689dc2e732d Hans Verkuil      2021-04-27   826  	case V4L2_CID_MPEG_VIDE=
O_BITRATE_MODE:	return "Video Bitrate Mode";
71c689dc2e732d Hans Verkuil      2021-04-27   827  	case V4L2_CID_MPEG_VIDE=
O_CONSTANT_QUALITY:	return "Constant Quality";
71c689dc2e732d Hans Verkuil      2021-04-27   828  	case V4L2_CID_MPEG_VIDE=
O_BITRATE:	return "Video Bitrate";
71c689dc2e732d Hans Verkuil      2021-04-27   829  	case V4L2_CID_MPEG_VIDE=
O_BITRATE_PEAK:	return "Video Peak Bitrate";
71c689dc2e732d Hans Verkuil      2021-04-27   830  	case V4L2_CID_MPEG_VIDE=
O_TEMPORAL_DECIMATION: return "Video Temporal Decimation";
71c689dc2e732d Hans Verkuil      2021-04-27   831  	case V4L2_CID_MPEG_VIDE=
O_MUTE:		return "Video Mute";
71c689dc2e732d Hans Verkuil      2021-04-27   832  	case V4L2_CID_MPEG_VIDE=
O_MUTE_YUV:	return "Video Mute YUV";
71c689dc2e732d Hans Verkuil      2021-04-27   833  	case V4L2_CID_MPEG_VIDE=
O_DECODER_SLICE_INTERFACE:	return "Decoder Slice Interface";
71c689dc2e732d Hans Verkuil      2021-04-27   834  	case V4L2_CID_MPEG_VIDE=
O_DECODER_MPEG4_DEBLOCK_FILTER:	return "MPEG4 Loop Filter Enable";
71c689dc2e732d Hans Verkuil      2021-04-27   835  	case V4L2_CID_MPEG_VIDE=
O_CYCLIC_INTRA_REFRESH_MB:	return "Number of Intra Refresh MBs";
71c689dc2e732d Hans Verkuil      2021-04-27   836  	case V4L2_CID_MPEG_VIDE=
O_FRAME_RC_ENABLE:		return "Frame Level Rate Control Enable";
71c689dc2e732d Hans Verkuil      2021-04-27   837  	case V4L2_CID_MPEG_VIDE=
O_MB_RC_ENABLE:			return "H264 MB Level Rate Control";
71c689dc2e732d Hans Verkuil      2021-04-27   838  	case V4L2_CID_MPEG_VIDE=
O_HEADER_MODE:			return "Sequence Header Mode";
71c689dc2e732d Hans Verkuil      2021-04-27   839  	case V4L2_CID_MPEG_VIDE=
O_MAX_REF_PIC:			return "Max Number of Reference Pics";
71c689dc2e732d Hans Verkuil      2021-04-27   840  	case V4L2_CID_MPEG_VIDE=
O_FRAME_SKIP_MODE:		return "Frame Skip Mode";
71c689dc2e732d Hans Verkuil      2021-04-27   841  	case V4L2_CID_MPEG_VIDE=
O_DEC_DISPLAY_DELAY:		return "Display Delay";
71c689dc2e732d Hans Verkuil      2021-04-27   842  	case V4L2_CID_MPEG_VIDE=
O_DEC_DISPLAY_DELAY_ENABLE:	return "Display Delay Enable";
71c689dc2e732d Hans Verkuil      2021-04-27   843  	case V4L2_CID_MPEG_VIDE=
O_AU_DELIMITER:			return "Generate Access Unit Delimiters";
71c689dc2e732d Hans Verkuil      2021-04-27   844  	case V4L2_CID_MPEG_VIDE=
O_H263_I_FRAME_QP:		return "H263 I-Frame QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   845  	case V4L2_CID_MPEG_VIDE=
O_H263_P_FRAME_QP:		return "H263 P-Frame QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   846  	case V4L2_CID_MPEG_VIDE=
O_H263_B_FRAME_QP:		return "H263 B-Frame QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   847  	case V4L2_CID_MPEG_VIDE=
O_H263_MIN_QP:			return "H263 Minimum QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   848  	case V4L2_CID_MPEG_VIDE=
O_H263_MAX_QP:			return "H263 Maximum QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   849  	case V4L2_CID_MPEG_VIDE=
O_H264_I_FRAME_QP:		return "H264 I-Frame QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   850  	case V4L2_CID_MPEG_VIDE=
O_H264_P_FRAME_QP:		return "H264 P-Frame QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   851  	case V4L2_CID_MPEG_VIDE=
O_H264_B_FRAME_QP:		return "H264 B-Frame QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   852  	case V4L2_CID_MPEG_VIDE=
O_H264_MAX_QP:			return "H264 Maximum QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   853  	case V4L2_CID_MPEG_VIDE=
O_H264_MIN_QP:			return "H264 Minimum QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   854  	case V4L2_CID_MPEG_VIDE=
O_H264_8X8_TRANSFORM:		return "H264 8x8 Transform Enable";
71c689dc2e732d Hans Verkuil      2021-04-27   855  	case V4L2_CID_MPEG_VIDE=
O_H264_CPB_SIZE:			return "H264 CPB Buffer Size";
71c689dc2e732d Hans Verkuil      2021-04-27   856  	case V4L2_CID_MPEG_VIDE=
O_H264_ENTROPY_MODE:		return "H264 Entropy Mode";
71c689dc2e732d Hans Verkuil      2021-04-27   857  	case V4L2_CID_MPEG_VIDE=
O_H264_I_PERIOD:			return "H264 I-Frame Period";
71c689dc2e732d Hans Verkuil      2021-04-27   858  	case V4L2_CID_MPEG_VIDE=
O_H264_LEVEL:			return "H264 Level";
71c689dc2e732d Hans Verkuil      2021-04-27   859  	case V4L2_CID_MPEG_VIDE=
O_H264_LOOP_FILTER_ALPHA:	return "H264 Loop Filter Alpha Offset";
71c689dc2e732d Hans Verkuil      2021-04-27   860  	case V4L2_CID_MPEG_VIDE=
O_H264_LOOP_FILTER_BETA:		return "H264 Loop Filter Beta Offset";
71c689dc2e732d Hans Verkuil      2021-04-27   861  	case V4L2_CID_MPEG_VIDE=
O_H264_LOOP_FILTER_MODE:		return "H264 Loop Filter Mode";
71c689dc2e732d Hans Verkuil      2021-04-27   862  	case V4L2_CID_MPEG_VIDE=
O_H264_PROFILE:			return "H264 Profile";
71c689dc2e732d Hans Verkuil      2021-04-27   863  	case V4L2_CID_MPEG_VIDE=
O_H264_VUI_EXT_SAR_HEIGHT:	return "Vertical Size of SAR";
71c689dc2e732d Hans Verkuil      2021-04-27   864  	case V4L2_CID_MPEG_VIDE=
O_H264_VUI_EXT_SAR_WIDTH:	return "Horizontal Size of SAR";
71c689dc2e732d Hans Verkuil      2021-04-27   865  	case V4L2_CID_MPEG_VIDE=
O_H264_VUI_SAR_ENABLE:		return "Aspect Ratio VUI Enable";
71c689dc2e732d Hans Verkuil      2021-04-27   866  	case V4L2_CID_MPEG_VIDE=
O_H264_VUI_SAR_IDC:		return "VUI Aspect Ratio IDC";
71c689dc2e732d Hans Verkuil      2021-04-27   867  	case V4L2_CID_MPEG_VIDE=
O_H264_SEI_FRAME_PACKING:	return "H264 Enable Frame Packing SEI";
71c689dc2e732d Hans Verkuil      2021-04-27   868  	case V4L2_CID_MPEG_VIDE=
O_H264_SEI_FP_CURRENT_FRAME_0:	return "H264 Set Curr. Frame as Frame0";
71c689dc2e732d Hans Verkuil      2021-04-27   869  	case V4L2_CID_MPEG_VIDE=
O_H264_SEI_FP_ARRANGEMENT_TYPE:	return "H264 FP Arrangement Type";
71c689dc2e732d Hans Verkuil      2021-04-27   870  	case V4L2_CID_MPEG_VIDE=
O_H264_FMO:			return "H264 Flexible MB Ordering";
71c689dc2e732d Hans Verkuil      2021-04-27   871  	case V4L2_CID_MPEG_VIDE=
O_H264_FMO_MAP_TYPE:		return "H264 Map Type for FMO";
71c689dc2e732d Hans Verkuil      2021-04-27   872  	case V4L2_CID_MPEG_VIDE=
O_H264_FMO_SLICE_GROUP:		return "H264 FMO Number of Slice Groups";
71c689dc2e732d Hans Verkuil      2021-04-27   873  	case V4L2_CID_MPEG_VIDE=
O_H264_FMO_CHANGE_DIRECTION:	return "H264 FMO Direction of Change";
71c689dc2e732d Hans Verkuil      2021-04-27   874  	case V4L2_CID_MPEG_VIDE=
O_H264_FMO_CHANGE_RATE:		return "H264 FMO Size of 1st Slice Grp";
71c689dc2e732d Hans Verkuil      2021-04-27   875  	case V4L2_CID_MPEG_VIDE=
O_H264_FMO_RUN_LENGTH:		return "H264 FMO No. of Consecutive MBs";
71c689dc2e732d Hans Verkuil      2021-04-27   876  	case V4L2_CID_MPEG_VIDE=
O_H264_ASO:			return "H264 Arbitrary Slice Ordering";
71c689dc2e732d Hans Verkuil      2021-04-27   877  	case V4L2_CID_MPEG_VIDE=
O_H264_ASO_SLICE_ORDER:		return "H264 ASO Slice Order";
71c689dc2e732d Hans Verkuil      2021-04-27   878  	case V4L2_CID_MPEG_VIDE=
O_H264_HIERARCHICAL_CODING:	return "Enable H264 Hierarchical Coding";
71c689dc2e732d Hans Verkuil      2021-04-27   879  	case V4L2_CID_MPEG_VIDE=
O_H264_HIERARCHICAL_CODING_TYPE:	return "H264 Hierarchical Coding Type";
71c689dc2e732d Hans Verkuil      2021-04-27   880  	case V4L2_CID_MPEG_VIDE=
O_H264_HIERARCHICAL_CODING_LAYER:return "H264 Number of HC Layers";
71c689dc2e732d Hans Verkuil      2021-04-27   881  	case V4L2_CID_MPEG_VIDE=
O_H264_HIERARCHICAL_CODING_LAYER_QP:
71c689dc2e732d Hans Verkuil      2021-04-27   882  								return "H264 Set=
 QP Value for HC Layers";
71c689dc2e732d Hans Verkuil      2021-04-27   883  	case V4L2_CID_MPEG_VIDE=
O_H264_CONSTRAINED_INTRA_PREDICTION:
71c689dc2e732d Hans Verkuil      2021-04-27   884  								return "H264 Con=
strained Intra Pred";
71c689dc2e732d Hans Verkuil      2021-04-27   885  	case V4L2_CID_MPEG_VIDE=
O_H264_CHROMA_QP_INDEX_OFFSET:	return "H264 Chroma QP Index Offset";
71c689dc2e732d Hans Verkuil      2021-04-27   886  	case V4L2_CID_MPEG_VIDE=
O_H264_I_FRAME_MIN_QP:		return "H264 I-Frame Minimum QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   887  	case V4L2_CID_MPEG_VIDE=
O_H264_I_FRAME_MAX_QP:		return "H264 I-Frame Maximum QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   888  	case V4L2_CID_MPEG_VIDE=
O_H264_P_FRAME_MIN_QP:		return "H264 P-Frame Minimum QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   889  	case V4L2_CID_MPEG_VIDE=
O_H264_P_FRAME_MAX_QP:		return "H264 P-Frame Maximum QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   890  	case V4L2_CID_MPEG_VIDE=
O_H264_B_FRAME_MIN_QP:		return "H264 B-Frame Minimum QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   891  	case V4L2_CID_MPEG_VIDE=
O_H264_B_FRAME_MAX_QP:		return "H264 B-Frame Maximum QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   892  	case V4L2_CID_MPEG_VIDE=
O_H264_HIER_CODING_L0_BR:	return "H264 Hierarchical Lay 0 Bitrate";
71c689dc2e732d Hans Verkuil      2021-04-27   893  	case V4L2_CID_MPEG_VIDE=
O_H264_HIER_CODING_L1_BR:	return "H264 Hierarchical Lay 1 Bitrate";
71c689dc2e732d Hans Verkuil      2021-04-27   894  	case V4L2_CID_MPEG_VIDE=
O_H264_HIER_CODING_L2_BR:	return "H264 Hierarchical Lay 2 Bitrate";
71c689dc2e732d Hans Verkuil      2021-04-27   895  	case V4L2_CID_MPEG_VIDE=
O_H264_HIER_CODING_L3_BR:	return "H264 Hierarchical Lay 3 Bitrate";
71c689dc2e732d Hans Verkuil      2021-04-27   896  	case V4L2_CID_MPEG_VIDE=
O_H264_HIER_CODING_L4_BR:	return "H264 Hierarchical Lay 4 Bitrate";
71c689dc2e732d Hans Verkuil      2021-04-27   897  	case V4L2_CID_MPEG_VIDE=
O_H264_HIER_CODING_L5_BR:	return "H264 Hierarchical Lay 5 Bitrate";
71c689dc2e732d Hans Verkuil      2021-04-27   898  	case V4L2_CID_MPEG_VIDE=
O_H264_HIER_CODING_L6_BR:	return "H264 Hierarchical Lay 6 Bitrate";
71c689dc2e732d Hans Verkuil      2021-04-27   899  	case V4L2_CID_MPEG_VIDE=
O_MPEG2_LEVEL:			return "MPEG2 Level";
71c689dc2e732d Hans Verkuil      2021-04-27   900  	case V4L2_CID_MPEG_VIDE=
O_MPEG2_PROFILE:			return "MPEG2 Profile";
71c689dc2e732d Hans Verkuil      2021-04-27   901  	case V4L2_CID_MPEG_VIDE=
O_MPEG4_I_FRAME_QP:		return "MPEG4 I-Frame QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   902  	case V4L2_CID_MPEG_VIDE=
O_MPEG4_P_FRAME_QP:		return "MPEG4 P-Frame QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   903  	case V4L2_CID_MPEG_VIDE=
O_MPEG4_B_FRAME_QP:		return "MPEG4 B-Frame QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   904  	case V4L2_CID_MPEG_VIDE=
O_MPEG4_MIN_QP:			return "MPEG4 Minimum QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   905  	case V4L2_CID_MPEG_VIDE=
O_MPEG4_MAX_QP:			return "MPEG4 Maximum QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   906  	case V4L2_CID_MPEG_VIDE=
O_MPEG4_LEVEL:			return "MPEG4 Level";
71c689dc2e732d Hans Verkuil      2021-04-27   907  	case V4L2_CID_MPEG_VIDE=
O_MPEG4_PROFILE:			return "MPEG4 Profile";
71c689dc2e732d Hans Verkuil      2021-04-27   908  	case V4L2_CID_MPEG_VIDE=
O_MPEG4_QPEL:			return "Quarter Pixel Search Enable";
71c689dc2e732d Hans Verkuil      2021-04-27   909  	case V4L2_CID_MPEG_VIDE=
O_MULTI_SLICE_MAX_BYTES:		return "Maximum Bytes in a Slice";
71c689dc2e732d Hans Verkuil      2021-04-27   910  	case V4L2_CID_MPEG_VIDE=
O_MULTI_SLICE_MAX_MB:		return "Number of MBs in a Slice";
71c689dc2e732d Hans Verkuil      2021-04-27   911  	case V4L2_CID_MPEG_VIDE=
O_MULTI_SLICE_MODE:		return "Slice Partitioning Method";
71c689dc2e732d Hans Verkuil      2021-04-27   912  	case V4L2_CID_MPEG_VIDE=
O_VBV_SIZE:			return "VBV Buffer Size";
71c689dc2e732d Hans Verkuil      2021-04-27   913  	case V4L2_CID_MPEG_VIDE=
O_DEC_PTS:			return "Video Decoder PTS";
71c689dc2e732d Hans Verkuil      2021-04-27   914  	case V4L2_CID_MPEG_VIDE=
O_DEC_FRAME:			return "Video Decoder Frame Count";
71c689dc2e732d Hans Verkuil      2021-04-27   915  	case V4L2_CID_MPEG_VIDE=
O_DEC_CONCEAL_COLOR:		return "Video Decoder Conceal Color";
71c689dc2e732d Hans Verkuil      2021-04-27   916  	case V4L2_CID_MPEG_VIDE=
O_VBV_DELAY:			return "Initial Delay for VBV Control";
71c689dc2e732d Hans Verkuil      2021-04-27   917  	case V4L2_CID_MPEG_VIDE=
O_MV_H_SEARCH_RANGE:		return "Horizontal MV Search Range";
71c689dc2e732d Hans Verkuil      2021-04-27   918  	case V4L2_CID_MPEG_VIDE=
O_MV_V_SEARCH_RANGE:		return "Vertical MV Search Range";
71c689dc2e732d Hans Verkuil      2021-04-27   919  	case V4L2_CID_MPEG_VIDE=
O_REPEAT_SEQ_HEADER:		return "Repeat Sequence Header";
71c689dc2e732d Hans Verkuil      2021-04-27   920  	case V4L2_CID_MPEG_VIDE=
O_FORCE_KEY_FRAME:		return "Force Key Frame";
71c689dc2e732d Hans Verkuil      2021-04-27   921  	case V4L2_CID_MPEG_VIDE=
O_BASELAYER_PRIORITY_ID:		return "Base Layer Priority ID";
71c689dc2e732d Hans Verkuil      2021-04-27   922  	case V4L2_CID_MPEG_VIDE=
O_LTR_COUNT:			return "LTR Count";
71c689dc2e732d Hans Verkuil      2021-04-27   923  	case V4L2_CID_MPEG_VIDE=
O_FRAME_LTR_INDEX:		return "Frame LTR Index";
71c689dc2e732d Hans Verkuil      2021-04-27   924  	case V4L2_CID_MPEG_VIDE=
O_USE_LTR_FRAMES:		return "Use LTR Frames";
71c689dc2e732d Hans Verkuil      2021-04-27   925  	case V4L2_CID_FWHT_I_FR=
AME_QP:				return "FWHT I-Frame QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   926  	case V4L2_CID_FWHT_P_FR=
AME_QP:				return "FWHT P-Frame QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   927  =

71c689dc2e732d Hans Verkuil      2021-04-27   928  	/* VPX controls */
71c689dc2e732d Hans Verkuil      2021-04-27   929  	case V4L2_CID_MPEG_VIDE=
O_VPX_NUM_PARTITIONS:		return "VPX Number of Partitions";
71c689dc2e732d Hans Verkuil      2021-04-27   930  	case V4L2_CID_MPEG_VIDE=
O_VPX_IMD_DISABLE_4X4:		return "VPX Intra Mode Decision Disable";
71c689dc2e732d Hans Verkuil      2021-04-27   931  	case V4L2_CID_MPEG_VIDE=
O_VPX_NUM_REF_FRAMES:		return "VPX No. of Refs for P Frame";
71c689dc2e732d Hans Verkuil      2021-04-27   932  	case V4L2_CID_MPEG_VIDE=
O_VPX_FILTER_LEVEL:		return "VPX Loop Filter Level Range";
71c689dc2e732d Hans Verkuil      2021-04-27   933  	case V4L2_CID_MPEG_VIDE=
O_VPX_FILTER_SHARPNESS:		return "VPX Deblocking Effect Control";
71c689dc2e732d Hans Verkuil      2021-04-27   934  	case V4L2_CID_MPEG_VIDE=
O_VPX_GOLDEN_FRAME_REF_PERIOD:	return "VPX Golden Frame Refresh Period";
71c689dc2e732d Hans Verkuil      2021-04-27   935  	case V4L2_CID_MPEG_VIDE=
O_VPX_GOLDEN_FRAME_SEL:		return "VPX Golden Frame Indicator";
71c689dc2e732d Hans Verkuil      2021-04-27   936  	case V4L2_CID_MPEG_VIDE=
O_VPX_MIN_QP:			return "VPX Minimum QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   937  	case V4L2_CID_MPEG_VIDE=
O_VPX_MAX_QP:			return "VPX Maximum QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   938  	case V4L2_CID_MPEG_VIDE=
O_VPX_I_FRAME_QP:		return "VPX I-Frame QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   939  	case V4L2_CID_MPEG_VIDE=
O_VPX_P_FRAME_QP:		return "VPX P-Frame QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   940  	case V4L2_CID_MPEG_VIDE=
O_VP8_PROFILE:			return "VP8 Profile";
71c689dc2e732d Hans Verkuil      2021-04-27   941  	case V4L2_CID_MPEG_VIDE=
O_VP9_PROFILE:			return "VP9 Profile";
71c689dc2e732d Hans Verkuil      2021-04-27   942  	case V4L2_CID_MPEG_VIDE=
O_VP9_LEVEL:			return "VP9 Level";
71c689dc2e732d Hans Verkuil      2021-04-27   943  =

71c689dc2e732d Hans Verkuil      2021-04-27   944  	/* HEVC controls */
71c689dc2e732d Hans Verkuil      2021-04-27   945  	case V4L2_CID_MPEG_VIDE=
O_HEVC_I_FRAME_QP:		return "HEVC I-Frame QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   946  	case V4L2_CID_MPEG_VIDE=
O_HEVC_P_FRAME_QP:		return "HEVC P-Frame QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   947  	case V4L2_CID_MPEG_VIDE=
O_HEVC_B_FRAME_QP:		return "HEVC B-Frame QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   948  	case V4L2_CID_MPEG_VIDE=
O_HEVC_MIN_QP:			return "HEVC Minimum QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   949  	case V4L2_CID_MPEG_VIDE=
O_HEVC_MAX_QP:			return "HEVC Maximum QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   950  	case V4L2_CID_MPEG_VIDE=
O_HEVC_I_FRAME_MIN_QP:		return "HEVC I-Frame Minimum QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   951  	case V4L2_CID_MPEG_VIDE=
O_HEVC_I_FRAME_MAX_QP:		return "HEVC I-Frame Maximum QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   952  	case V4L2_CID_MPEG_VIDE=
O_HEVC_P_FRAME_MIN_QP:		return "HEVC P-Frame Minimum QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   953  	case V4L2_CID_MPEG_VIDE=
O_HEVC_P_FRAME_MAX_QP:		return "HEVC P-Frame Maximum QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   954  	case V4L2_CID_MPEG_VIDE=
O_HEVC_B_FRAME_MIN_QP:		return "HEVC B-Frame Minimum QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   955  	case V4L2_CID_MPEG_VIDE=
O_HEVC_B_FRAME_MAX_QP:		return "HEVC B-Frame Maximum QP Value";
71c689dc2e732d Hans Verkuil      2021-04-27   956  	case V4L2_CID_MPEG_VIDE=
O_HEVC_PROFILE:			return "HEVC Profile";
71c689dc2e732d Hans Verkuil      2021-04-27   957  	case V4L2_CID_MPEG_VIDE=
O_HEVC_LEVEL:			return "HEVC Level";
71c689dc2e732d Hans Verkuil      2021-04-27   958  	case V4L2_CID_MPEG_VIDE=
O_HEVC_TIER:			return "HEVC Tier";
71c689dc2e732d Hans Verkuil      2021-04-27   959  	case V4L2_CID_MPEG_VIDE=
O_HEVC_FRAME_RATE_RESOLUTION:	return "HEVC Frame Rate Resolution";
71c689dc2e732d Hans Verkuil      2021-04-27   960  	case V4L2_CID_MPEG_VIDE=
O_HEVC_MAX_PARTITION_DEPTH:	return "HEVC Maximum Coding Unit Depth";
71c689dc2e732d Hans Verkuil      2021-04-27   961  	case V4L2_CID_MPEG_VIDE=
O_HEVC_REFRESH_TYPE:		return "HEVC Refresh Type";
71c689dc2e732d Hans Verkuil      2021-04-27   962  	case V4L2_CID_MPEG_VIDE=
O_HEVC_CONST_INTRA_PRED:		return "HEVC Constant Intra Prediction";
71c689dc2e732d Hans Verkuil      2021-04-27   963  	case V4L2_CID_MPEG_VIDE=
O_HEVC_LOSSLESS_CU:		return "HEVC Lossless Encoding";
71c689dc2e732d Hans Verkuil      2021-04-27   964  	case V4L2_CID_MPEG_VIDE=
O_HEVC_WAVEFRONT:		return "HEVC Wavefront";
71c689dc2e732d Hans Verkuil      2021-04-27   965  	case V4L2_CID_MPEG_VIDE=
O_HEVC_LOOP_FILTER_MODE:		return "HEVC Loop Filter";
71c689dc2e732d Hans Verkuil      2021-04-27   966  	case V4L2_CID_MPEG_VIDE=
O_HEVC_HIER_QP:			return "HEVC QP Values";
71c689dc2e732d Hans Verkuil      2021-04-27   967  	case V4L2_CID_MPEG_VIDE=
O_HEVC_HIER_CODING_TYPE:		return "HEVC Hierarchical Coding Type";
71c689dc2e732d Hans Verkuil      2021-04-27   968  	case V4L2_CID_MPEG_VIDE=
O_HEVC_HIER_CODING_LAYER:	return "HEVC Hierarchical Coding Layer";
71c689dc2e732d Hans Verkuil      2021-04-27   969  	case V4L2_CID_MPEG_VIDE=
O_HEVC_HIER_CODING_L0_QP:	return "HEVC Hierarchical Layer 0 QP";
71c689dc2e732d Hans Verkuil      2021-04-27   970  	case V4L2_CID_MPEG_VIDE=
O_HEVC_HIER_CODING_L1_QP:	return "HEVC Hierarchical Layer 1 QP";
71c689dc2e732d Hans Verkuil      2021-04-27   971  	case V4L2_CID_MPEG_VIDE=
O_HEVC_HIER_CODING_L2_QP:	return "HEVC Hierarchical Layer 2 QP";
71c689dc2e732d Hans Verkuil      2021-04-27   972  	case V4L2_CID_MPEG_VIDE=
O_HEVC_HIER_CODING_L3_QP:	return "HEVC Hierarchical Layer 3 QP";
71c689dc2e732d Hans Verkuil      2021-04-27   973  	case V4L2_CID_MPEG_VIDE=
O_HEVC_HIER_CODING_L4_QP:	return "HEVC Hierarchical Layer 4 QP";
71c689dc2e732d Hans Verkuil      2021-04-27   974  	case V4L2_CID_MPEG_VIDE=
O_HEVC_HIER_CODING_L5_QP:	return "HEVC Hierarchical Layer 5 QP";
71c689dc2e732d Hans Verkuil      2021-04-27   975  	case V4L2_CID_MPEG_VIDE=
O_HEVC_HIER_CODING_L6_QP:	return "HEVC Hierarchical Layer 6 QP";
71c689dc2e732d Hans Verkuil      2021-04-27   976  	case V4L2_CID_MPEG_VIDE=
O_HEVC_HIER_CODING_L0_BR:	return "HEVC Hierarchical Lay 0 BitRate";
71c689dc2e732d Hans Verkuil      2021-04-27   977  	case V4L2_CID_MPEG_VIDE=
O_HEVC_HIER_CODING_L1_BR:	return "HEVC Hierarchical Lay 1 BitRate";
71c689dc2e732d Hans Verkuil      2021-04-27   978  	case V4L2_CID_MPEG_VIDE=
O_HEVC_HIER_CODING_L2_BR:	return "HEVC Hierarchical Lay 2 BitRate";
71c689dc2e732d Hans Verkuil      2021-04-27   979  	case V4L2_CID_MPEG_VIDE=
O_HEVC_HIER_CODING_L3_BR:	return "HEVC Hierarchical Lay 3 BitRate";
71c689dc2e732d Hans Verkuil      2021-04-27   980  	case V4L2_CID_MPEG_VIDE=
O_HEVC_HIER_CODING_L4_BR:	return "HEVC Hierarchical Lay 4 BitRate";
71c689dc2e732d Hans Verkuil      2021-04-27   981  	case V4L2_CID_MPEG_VIDE=
O_HEVC_HIER_CODING_L5_BR:	return "HEVC Hierarchical Lay 5 BitRate";
71c689dc2e732d Hans Verkuil      2021-04-27   982  	case V4L2_CID_MPEG_VIDE=
O_HEVC_HIER_CODING_L6_BR:	return "HEVC Hierarchical Lay 6 BitRate";
71c689dc2e732d Hans Verkuil      2021-04-27   983  	case V4L2_CID_MPEG_VIDE=
O_HEVC_GENERAL_PB:		return "HEVC General PB";
71c689dc2e732d Hans Verkuil      2021-04-27   984  	case V4L2_CID_MPEG_VIDE=
O_HEVC_TEMPORAL_ID:		return "HEVC Temporal ID";
71c689dc2e732d Hans Verkuil      2021-04-27   985  	case V4L2_CID_MPEG_VIDE=
O_HEVC_STRONG_SMOOTHING:		return "HEVC Strong Intra Smoothing";
71c689dc2e732d Hans Verkuil      2021-04-27   986  	case V4L2_CID_MPEG_VIDE=
O_HEVC_INTRA_PU_SPLIT:		return "HEVC Intra PU Split";
71c689dc2e732d Hans Verkuil      2021-04-27   987  	case V4L2_CID_MPEG_VIDE=
O_HEVC_TMV_PREDICTION:		return "HEVC TMV Prediction";
71c689dc2e732d Hans Verkuil      2021-04-27   988  	case V4L2_CID_MPEG_VIDE=
O_HEVC_MAX_NUM_MERGE_MV_MINUS1:	return "HEVC Max Num of Candidate MVs";
71c689dc2e732d Hans Verkuil      2021-04-27   989  	case V4L2_CID_MPEG_VIDE=
O_HEVC_WITHOUT_STARTCODE:	return "HEVC ENC Without Startcode";
71c689dc2e732d Hans Verkuil      2021-04-27   990  	case V4L2_CID_MPEG_VIDE=
O_HEVC_REFRESH_PERIOD:		return "HEVC Num of I-Frame b/w 2 IDR";
71c689dc2e732d Hans Verkuil      2021-04-27   991  	case V4L2_CID_MPEG_VIDE=
O_HEVC_LF_BETA_OFFSET_DIV2:	return "HEVC Loop Filter Beta Offset";
71c689dc2e732d Hans Verkuil      2021-04-27   992  	case V4L2_CID_MPEG_VIDE=
O_HEVC_LF_TC_OFFSET_DIV2:	return "HEVC Loop Filter TC Offset";
71c689dc2e732d Hans Verkuil      2021-04-27   993  	case V4L2_CID_MPEG_VIDE=
O_HEVC_SIZE_OF_LENGTH_FIELD:	return "HEVC Size of Length Field";
71c689dc2e732d Hans Verkuil      2021-04-27   994  	case V4L2_CID_MPEG_VIDE=
O_REF_NUMBER_FOR_PFRAMES:	return "Reference Frames for a P-Frame";
71c689dc2e732d Hans Verkuil      2021-04-27   995  	case V4L2_CID_MPEG_VIDE=
O_PREPEND_SPSPPS_TO_IDR:		return "Prepend SPS and PPS to IDR";
71c689dc2e732d Hans Verkuil      2021-04-27   996  	case V4L2_CID_MPEG_VIDE=
O_HEVC_SPS:			return "HEVC Sequence Parameter Set";
71c689dc2e732d Hans Verkuil      2021-04-27   997  	case V4L2_CID_MPEG_VIDE=
O_HEVC_PPS:			return "HEVC Picture Parameter Set";
71c689dc2e732d Hans Verkuil      2021-04-27   998  	case V4L2_CID_MPEG_VIDE=
O_HEVC_SLICE_PARAMS:		return "HEVC Slice Parameters";
d395a78db9eabd Benjamin Gaignard 2021-06-03   999  	case V4L2_CID_MPEG_VIDE=
O_HEVC_DECODE_PARAMS:		return "HEVC Decode Parameters";
71c689dc2e732d Hans Verkuil      2021-04-27  1000  	case V4L2_CID_MPEG_VIDE=
O_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
71c689dc2e732d Hans Verkuil      2021-04-27  1001  	case V4L2_CID_MPEG_VIDE=
O_HEVC_START_CODE:		return "HEVC Start Code";
71c689dc2e732d Hans Verkuil      2021-04-27  1002  =

71c689dc2e732d Hans Verkuil      2021-04-27  1003  	/* CAMERA controls */
71c689dc2e732d Hans Verkuil      2021-04-27  1004  	/* Keep the order of th=
e 'case's the same as in v4l2-controls.h! */
71c689dc2e732d Hans Verkuil      2021-04-27  1005  	case V4L2_CID_CAMERA_CL=
ASS:		return "Camera Controls";
71c689dc2e732d Hans Verkuil      2021-04-27  1006  	case V4L2_CID_EXPOSURE_=
AUTO:		return "Auto Exposure";
71c689dc2e732d Hans Verkuil      2021-04-27  1007  	case V4L2_CID_EXPOSURE_=
ABSOLUTE:	return "Exposure Time, Absolute";
71c689dc2e732d Hans Verkuil      2021-04-27  1008  	case V4L2_CID_EXPOSURE_=
AUTO_PRIORITY:	return "Exposure, Dynamic Framerate";
71c689dc2e732d Hans Verkuil      2021-04-27  1009  	case V4L2_CID_PAN_RELAT=
IVE:		return "Pan, Relative";
71c689dc2e732d Hans Verkuil      2021-04-27  1010  	case V4L2_CID_TILT_RELA=
TIVE:		return "Tilt, Relative";
71c689dc2e732d Hans Verkuil      2021-04-27  1011  	case V4L2_CID_PAN_RESET=
:		return "Pan, Reset";
71c689dc2e732d Hans Verkuil      2021-04-27  1012  	case V4L2_CID_TILT_RESE=
T:		return "Tilt, Reset";
71c689dc2e732d Hans Verkuil      2021-04-27  1013  	case V4L2_CID_PAN_ABSOL=
UTE:		return "Pan, Absolute";
71c689dc2e732d Hans Verkuil      2021-04-27  1014  	case V4L2_CID_TILT_ABSO=
LUTE:		return "Tilt, Absolute";
71c689dc2e732d Hans Verkuil      2021-04-27  1015  	case V4L2_CID_FOCUS_ABS=
OLUTE:		return "Focus, Absolute";
71c689dc2e732d Hans Verkuil      2021-04-27  1016  	case V4L2_CID_FOCUS_REL=
ATIVE:		return "Focus, Relative";
71c689dc2e732d Hans Verkuil      2021-04-27  1017  	case V4L2_CID_FOCUS_AUT=
O:		return "Focus, Automatic Continuous";
71c689dc2e732d Hans Verkuil      2021-04-27  1018  	case V4L2_CID_ZOOM_ABSO=
LUTE:		return "Zoom, Absolute";
71c689dc2e732d Hans Verkuil      2021-04-27  1019  	case V4L2_CID_ZOOM_RELA=
TIVE:		return "Zoom, Relative";
71c689dc2e732d Hans Verkuil      2021-04-27  1020  	case V4L2_CID_ZOOM_CONT=
INUOUS:		return "Zoom, Continuous";
71c689dc2e732d Hans Verkuil      2021-04-27  1021  	case V4L2_CID_PRIVACY:	=
		return "Privacy";
71c689dc2e732d Hans Verkuil      2021-04-27  1022  	case V4L2_CID_IRIS_ABSO=
LUTE:		return "Iris, Absolute";
71c689dc2e732d Hans Verkuil      2021-04-27  1023  	case V4L2_CID_IRIS_RELA=
TIVE:		return "Iris, Relative";
71c689dc2e732d Hans Verkuil      2021-04-27  1024  	case V4L2_CID_AUTO_EXPO=
SURE_BIAS:	return "Auto Exposure, Bias";
71c689dc2e732d Hans Verkuil      2021-04-27  1025  	case V4L2_CID_AUTO_N_PR=
ESET_WHITE_BALANCE: return "White Balance, Auto & Preset";
71c689dc2e732d Hans Verkuil      2021-04-27  1026  	case V4L2_CID_WIDE_DYNA=
MIC_RANGE:	return "Wide Dynamic Range";
71c689dc2e732d Hans Verkuil      2021-04-27  1027  	case V4L2_CID_IMAGE_STA=
BILIZATION:	return "Image Stabilization";
71c689dc2e732d Hans Verkuil      2021-04-27  1028  	case V4L2_CID_ISO_SENSI=
TIVITY:		return "ISO Sensitivity";
71c689dc2e732d Hans Verkuil      2021-04-27  1029  	case V4L2_CID_ISO_SENSI=
TIVITY_AUTO:	return "ISO Sensitivity, Auto";
71c689dc2e732d Hans Verkuil      2021-04-27  1030  	case V4L2_CID_EXPOSURE_=
METERING:	return "Exposure, Metering Mode";
71c689dc2e732d Hans Verkuil      2021-04-27  1031  	case V4L2_CID_SCENE_MOD=
E:		return "Scene Mode";
71c689dc2e732d Hans Verkuil      2021-04-27  1032  	case V4L2_CID_3A_LOCK:	=
		return "3A Lock";
71c689dc2e732d Hans Verkuil      2021-04-27  1033  	case V4L2_CID_AUTO_FOCU=
S_START:		return "Auto Focus, Start";
71c689dc2e732d Hans Verkuil      2021-04-27  1034  	case V4L2_CID_AUTO_FOCU=
S_STOP:		return "Auto Focus, Stop";
71c689dc2e732d Hans Verkuil      2021-04-27  1035  	case V4L2_CID_AUTO_FOCU=
S_STATUS:	return "Auto Focus, Status";
71c689dc2e732d Hans Verkuil      2021-04-27  1036  	case V4L2_CID_AUTO_FOCU=
S_RANGE:		return "Auto Focus, Range";
71c689dc2e732d Hans Verkuil      2021-04-27  1037  	case V4L2_CID_PAN_SPEED=
:		return "Pan, Speed";
71c689dc2e732d Hans Verkuil      2021-04-27  1038  	case V4L2_CID_TILT_SPEE=
D:		return "Tilt, Speed";
71c689dc2e732d Hans Verkuil      2021-04-27  1039  	case V4L2_CID_UNIT_CELL=
_SIZE:		return "Unit Cell Size";
71c689dc2e732d Hans Verkuil      2021-04-27  1040  	case V4L2_CID_CAMERA_OR=
IENTATION:	return "Camera Orientation";
71c689dc2e732d Hans Verkuil      2021-04-27  1041  	case V4L2_CID_CAMERA_SE=
NSOR_ROTATION:	return "Camera Sensor Rotation";
71c689dc2e732d Hans Verkuil      2021-04-27  1042  =

71c689dc2e732d Hans Verkuil      2021-04-27  1043  	/* FM Radio Modulator c=
ontrols */
71c689dc2e732d Hans Verkuil      2021-04-27  1044  	/* Keep the order of th=
e 'case's the same as in v4l2-controls.h! */
71c689dc2e732d Hans Verkuil      2021-04-27  1045  	case V4L2_CID_FM_TX_CLA=
SS:		return "FM Radio Modulator Controls";
71c689dc2e732d Hans Verkuil      2021-04-27  1046  	case V4L2_CID_RDS_TX_DE=
VIATION:		return "RDS Signal Deviation";
71c689dc2e732d Hans Verkuil      2021-04-27  1047  	case V4L2_CID_RDS_TX_PI=
:		return "RDS Program ID";
71c689dc2e732d Hans Verkuil      2021-04-27  1048  	case V4L2_CID_RDS_TX_PT=
Y:		return "RDS Program Type";
71c689dc2e732d Hans Verkuil      2021-04-27  1049  	case V4L2_CID_RDS_TX_PS=
_NAME:		return "RDS PS Name";
71c689dc2e732d Hans Verkuil      2021-04-27  1050  	case V4L2_CID_RDS_TX_RA=
DIO_TEXT:	return "RDS Radio Text";
71c689dc2e732d Hans Verkuil      2021-04-27  1051  	case V4L2_CID_RDS_TX_MO=
NO_STEREO:	return "RDS Stereo";
71c689dc2e732d Hans Verkuil      2021-04-27  1052  	case V4L2_CID_RDS_TX_AR=
TIFICIAL_HEAD:	return "RDS Artificial Head";
71c689dc2e732d Hans Verkuil      2021-04-27  1053  	case V4L2_CID_RDS_TX_CO=
MPRESSED:	return "RDS Compressed";
71c689dc2e732d Hans Verkuil      2021-04-27  1054  	case V4L2_CID_RDS_TX_DY=
NAMIC_PTY:	return "RDS Dynamic PTY";
71c689dc2e732d Hans Verkuil      2021-04-27  1055  	case V4L2_CID_RDS_TX_TR=
AFFIC_ANNOUNCEMENT: return "RDS Traffic Announcement";
71c689dc2e732d Hans Verkuil      2021-04-27  1056  	case V4L2_CID_RDS_TX_TR=
AFFIC_PROGRAM:	return "RDS Traffic Program";
71c689dc2e732d Hans Verkuil      2021-04-27  1057  	case V4L2_CID_RDS_TX_MU=
SIC_SPEECH:	return "RDS Music";
71c689dc2e732d Hans Verkuil      2021-04-27  1058  	case V4L2_CID_RDS_TX_AL=
T_FREQS_ENABLE:	return "RDS Enable Alt Frequencies";
71c689dc2e732d Hans Verkuil      2021-04-27  1059  	case V4L2_CID_RDS_TX_AL=
T_FREQS:		return "RDS Alternate Frequencies";
71c689dc2e732d Hans Verkuil      2021-04-27  1060  	case V4L2_CID_AUDIO_LIM=
ITER_ENABLED:	return "Audio Limiter Feature Enabled";
71c689dc2e732d Hans Verkuil      2021-04-27  1061  	case V4L2_CID_AUDIO_LIM=
ITER_RELEASE_TIME: return "Audio Limiter Release Time";
71c689dc2e732d Hans Verkuil      2021-04-27  1062  	case V4L2_CID_AUDIO_LIM=
ITER_DEVIATION:	return "Audio Limiter Deviation";
71c689dc2e732d Hans Verkuil      2021-04-27  1063  	case V4L2_CID_AUDIO_COM=
PRESSION_ENABLED: return "Audio Compression Enabled";
71c689dc2e732d Hans Verkuil      2021-04-27  1064  	case V4L2_CID_AUDIO_COM=
PRESSION_GAIN:	return "Audio Compression Gain";
71c689dc2e732d Hans Verkuil      2021-04-27  1065  	case V4L2_CID_AUDIO_COM=
PRESSION_THRESHOLD: return "Audio Compression Threshold";
71c689dc2e732d Hans Verkuil      2021-04-27  1066  	case V4L2_CID_AUDIO_COM=
PRESSION_ATTACK_TIME: return "Audio Compression Attack Time";
71c689dc2e732d Hans Verkuil      2021-04-27  1067  	case V4L2_CID_AUDIO_COM=
PRESSION_RELEASE_TIME: return "Audio Compression Release Time";
71c689dc2e732d Hans Verkuil      2021-04-27  1068  	case V4L2_CID_PILOT_TON=
E_ENABLED:	return "Pilot Tone Feature Enabled";
71c689dc2e732d Hans Verkuil      2021-04-27  1069  	case V4L2_CID_PILOT_TON=
E_DEVIATION:	return "Pilot Tone Deviation";
71c689dc2e732d Hans Verkuil      2021-04-27  1070  	case V4L2_CID_PILOT_TON=
E_FREQUENCY:	return "Pilot Tone Frequency";
71c689dc2e732d Hans Verkuil      2021-04-27  1071  	case V4L2_CID_TUNE_PREE=
MPHASIS:		return "Pre-Emphasis";
71c689dc2e732d Hans Verkuil      2021-04-27  1072  	case V4L2_CID_TUNE_POWE=
R_LEVEL:		return "Tune Power Level";
71c689dc2e732d Hans Verkuil      2021-04-27  1073  	case V4L2_CID_TUNE_ANTE=
NNA_CAPACITOR:	return "Tune Antenna Capacitor";
71c689dc2e732d Hans Verkuil      2021-04-27  1074  =

71c689dc2e732d Hans Verkuil      2021-04-27  1075  	/* Flash controls */
71c689dc2e732d Hans Verkuil      2021-04-27  1076  	/* Keep the order of th=
e 'case's the same as in v4l2-controls.h! */
71c689dc2e732d Hans Verkuil      2021-04-27  1077  	case V4L2_CID_FLASH_CLA=
SS:		return "Flash Controls";
71c689dc2e732d Hans Verkuil      2021-04-27  1078  	case V4L2_CID_FLASH_LED=
_MODE:		return "LED Mode";
71c689dc2e732d Hans Verkuil      2021-04-27  1079  	case V4L2_CID_FLASH_STR=
OBE_SOURCE:	return "Strobe Source";
71c689dc2e732d Hans Verkuil      2021-04-27  1080  	case V4L2_CID_FLASH_STR=
OBE:		return "Strobe";
71c689dc2e732d Hans Verkuil      2021-04-27  1081  	case V4L2_CID_FLASH_STR=
OBE_STOP:	return "Stop Strobe";
71c689dc2e732d Hans Verkuil      2021-04-27  1082  	case V4L2_CID_FLASH_STR=
OBE_STATUS:	return "Strobe Status";
71c689dc2e732d Hans Verkuil      2021-04-27  1083  	case V4L2_CID_FLASH_TIM=
EOUT:		return "Strobe Timeout";
71c689dc2e732d Hans Verkuil      2021-04-27  1084  	case V4L2_CID_FLASH_INT=
ENSITY:		return "Intensity, Flash Mode";
71c689dc2e732d Hans Verkuil      2021-04-27  1085  	case V4L2_CID_FLASH_TOR=
CH_INTENSITY:	return "Intensity, Torch Mode";
71c689dc2e732d Hans Verkuil      2021-04-27  1086  	case V4L2_CID_FLASH_IND=
ICATOR_INTENSITY: return "Intensity, Indicator";
71c689dc2e732d Hans Verkuil      2021-04-27  1087  	case V4L2_CID_FLASH_FAU=
LT:		return "Faults";
71c689dc2e732d Hans Verkuil      2021-04-27  1088  	case V4L2_CID_FLASH_CHA=
RGE:		return "Charge";
71c689dc2e732d Hans Verkuil      2021-04-27  1089  	case V4L2_CID_FLASH_REA=
DY:		return "Ready to Strobe";
71c689dc2e732d Hans Verkuil      2021-04-27  1090  =

71c689dc2e732d Hans Verkuil      2021-04-27  1091  	/* JPEG encoder control=
s */
71c689dc2e732d Hans Verkuil      2021-04-27  1092  	/* Keep the order of th=
e 'case's the same as in v4l2-controls.h! */
71c689dc2e732d Hans Verkuil      2021-04-27  1093  	case V4L2_CID_JPEG_CLAS=
S:		return "JPEG Compression Controls";
71c689dc2e732d Hans Verkuil      2021-04-27  1094  	case V4L2_CID_JPEG_CHRO=
MA_SUBSAMPLING:	return "Chroma Subsampling";
71c689dc2e732d Hans Verkuil      2021-04-27  1095  	case V4L2_CID_JPEG_REST=
ART_INTERVAL:	return "Restart Interval";
71c689dc2e732d Hans Verkuil      2021-04-27  1096  	case V4L2_CID_JPEG_COMP=
RESSION_QUALITY:	return "Compression Quality";
71c689dc2e732d Hans Verkuil      2021-04-27  1097  	case V4L2_CID_JPEG_ACTI=
VE_MARKER:	return "Active Markers";
71c689dc2e732d Hans Verkuil      2021-04-27  1098  =

71c689dc2e732d Hans Verkuil      2021-04-27  1099  	/* Image source control=
s */
71c689dc2e732d Hans Verkuil      2021-04-27  1100  	/* Keep the order of th=
e 'case's the same as in v4l2-controls.h! */
71c689dc2e732d Hans Verkuil      2021-04-27  1101  	case V4L2_CID_IMAGE_SOU=
RCE_CLASS:	return "Image Source Controls";
71c689dc2e732d Hans Verkuil      2021-04-27  1102  	case V4L2_CID_VBLANK:		=
	return "Vertical Blanking";
71c689dc2e732d Hans Verkuil      2021-04-27  1103  	case V4L2_CID_HBLANK:		=
	return "Horizontal Blanking";
71c689dc2e732d Hans Verkuil      2021-04-27  1104  	case V4L2_CID_ANALOGUE_=
GAIN:		return "Analogue Gain";
71c689dc2e732d Hans Verkuil      2021-04-27  1105  	case V4L2_CID_TEST_PATT=
ERN_RED:		return "Red Pixel Value";
71c689dc2e732d Hans Verkuil      2021-04-27  1106  	case V4L2_CID_TEST_PATT=
ERN_GREENR:	return "Green (Red) Pixel Value";
71c689dc2e732d Hans Verkuil      2021-04-27  1107  	case V4L2_CID_TEST_PATT=
ERN_BLUE:	return "Blue Pixel Value";
71c689dc2e732d Hans Verkuil      2021-04-27  1108  	case V4L2_CID_TEST_PATT=
ERN_GREENB:	return "Green (Blue) Pixel Value";
90e88afaa6541d David Plowman     2021-07-22  1109  	case V4L2_CID_NOTIFY_GA=
IN_RED:		return "Notify Red Gain";
90e88afaa6541d David Plowman     2021-07-22  1110  	case V4L2_CID_NOTIFY_GA=
IN_GREENR:	return "Notify Green (Red) Gain";
90e88afaa6541d David Plowman     2021-07-22  1111  	case V4L2_CID_NOTIFY_GA=
IN_BLUE:		return "Notify Blue Gain";
90e88afaa6541d David Plowman     2021-07-22  1112  	case V4L2_CID_NOTIFY_GA=
IN_GREENB:	return "Notify Green (Blue) Gain";
71c689dc2e732d Hans Verkuil      2021-04-27  1113  =

71c689dc2e732d Hans Verkuil      2021-04-27  1114  	/* Image processing con=
trols */
71c689dc2e732d Hans Verkuil      2021-04-27  1115  	/* Keep the order of th=
e 'case's the same as in v4l2-controls.h! */
71c689dc2e732d Hans Verkuil      2021-04-27  1116  	case V4L2_CID_IMAGE_PRO=
C_CLASS:		return "Image Processing Controls";
71c689dc2e732d Hans Verkuil      2021-04-27  1117  	case V4L2_CID_LINK_FREQ=
:		return "Link Frequency";
71c689dc2e732d Hans Verkuil      2021-04-27  1118  	case V4L2_CID_PIXEL_RAT=
E:		return "Pixel Rate";
71c689dc2e732d Hans Verkuil      2021-04-27  1119  	case V4L2_CID_TEST_PATT=
ERN:		return "Test Pattern";
71c689dc2e732d Hans Verkuil      2021-04-27  1120  	case V4L2_CID_DEINTERLA=
CING_MODE:	return "Deinterlacing Mode";
71c689dc2e732d Hans Verkuil      2021-04-27  1121  	case V4L2_CID_DIGITAL_G=
AIN:		return "Digital Gain";
71c689dc2e732d Hans Verkuil      2021-04-27  1122  =

71c689dc2e732d Hans Verkuil      2021-04-27  1123  	/* DV controls */
71c689dc2e732d Hans Verkuil      2021-04-27  1124  	/* Keep the order of th=
e 'case's the same as in v4l2-controls.h! */
71c689dc2e732d Hans Verkuil      2021-04-27  1125  	case V4L2_CID_DV_CLASS:=
			return "Digital Video Controls";
71c689dc2e732d Hans Verkuil      2021-04-27  1126  	case V4L2_CID_DV_TX_HOT=
PLUG:		return "Hotplug Present";
71c689dc2e732d Hans Verkuil      2021-04-27  1127  	case V4L2_CID_DV_TX_RXS=
ENSE:		return "RxSense Present";
71c689dc2e732d Hans Verkuil      2021-04-27  1128  	case V4L2_CID_DV_TX_EDI=
D_PRESENT:	return "EDID Present";
71c689dc2e732d Hans Verkuil      2021-04-27  1129  	case V4L2_CID_DV_TX_MOD=
E:		return "Transmit Mode";
71c689dc2e732d Hans Verkuil      2021-04-27  1130  	case V4L2_CID_DV_TX_RGB=
_RANGE:		return "Tx RGB Quantization Range";
71c689dc2e732d Hans Verkuil      2021-04-27  1131  	case V4L2_CID_DV_TX_IT_=
CONTENT_TYPE:	return "Tx IT Content Type";
71c689dc2e732d Hans Verkuil      2021-04-27  1132  	case V4L2_CID_DV_RX_POW=
ER_PRESENT:	return "Power Present";
71c689dc2e732d Hans Verkuil      2021-04-27  1133  	case V4L2_CID_DV_RX_RGB=
_RANGE:		return "Rx RGB Quantization Range";
71c689dc2e732d Hans Verkuil      2021-04-27  1134  	case V4L2_CID_DV_RX_IT_=
CONTENT_TYPE:	return "Rx IT Content Type";
71c689dc2e732d Hans Verkuil      2021-04-27  1135  =

71c689dc2e732d Hans Verkuil      2021-04-27  1136  	case V4L2_CID_FM_RX_CLA=
SS:		return "FM Radio Receiver Controls";
71c689dc2e732d Hans Verkuil      2021-04-27  1137  	case V4L2_CID_TUNE_DEEM=
PHASIS:		return "De-Emphasis";
71c689dc2e732d Hans Verkuil      2021-04-27  1138  	case V4L2_CID_RDS_RECEP=
TION:		return "RDS Reception";
71c689dc2e732d Hans Verkuil      2021-04-27  1139  	case V4L2_CID_RF_TUNER_=
CLASS:		return "RF Tuner Controls";
71c689dc2e732d Hans Verkuil      2021-04-27  1140  	case V4L2_CID_RF_TUNER_=
RF_GAIN:		return "RF Gain";
71c689dc2e732d Hans Verkuil      2021-04-27  1141  	case V4L2_CID_RF_TUNER_=
LNA_GAIN_AUTO:	return "LNA Gain, Auto";
71c689dc2e732d Hans Verkuil      2021-04-27  1142  	case V4L2_CID_RF_TUNER_=
LNA_GAIN:	return "LNA Gain";
71c689dc2e732d Hans Verkuil      2021-04-27  1143  	case V4L2_CID_RF_TUNER_=
MIXER_GAIN_AUTO:	return "Mixer Gain, Auto";
71c689dc2e732d Hans Verkuil      2021-04-27  1144  	case V4L2_CID_RF_TUNER_=
MIXER_GAIN:	return "Mixer Gain";
71c689dc2e732d Hans Verkuil      2021-04-27  1145  	case V4L2_CID_RF_TUNER_=
IF_GAIN_AUTO:	return "IF Gain, Auto";
71c689dc2e732d Hans Verkuil      2021-04-27  1146  	case V4L2_CID_RF_TUNER_=
IF_GAIN:		return "IF Gain";
71c689dc2e732d Hans Verkuil      2021-04-27  1147  	case V4L2_CID_RF_TUNER_=
BANDWIDTH_AUTO:	return "Bandwidth, Auto";
71c689dc2e732d Hans Verkuil      2021-04-27  1148  	case V4L2_CID_RF_TUNER_=
BANDWIDTH:	return "Bandwidth";
71c689dc2e732d Hans Verkuil      2021-04-27  1149  	case V4L2_CID_RF_TUNER_=
PLL_LOCK:	return "PLL Lock";
71c689dc2e732d Hans Verkuil      2021-04-27  1150  	case V4L2_CID_RDS_RX_PT=
Y:		return "RDS Program Type";
71c689dc2e732d Hans Verkuil      2021-04-27  1151  	case V4L2_CID_RDS_RX_PS=
_NAME:		return "RDS PS Name";
71c689dc2e732d Hans Verkuil      2021-04-27  1152  	case V4L2_CID_RDS_RX_RA=
DIO_TEXT:	return "RDS Radio Text";
71c689dc2e732d Hans Verkuil      2021-04-27  1153  	case V4L2_CID_RDS_RX_TR=
AFFIC_ANNOUNCEMENT: return "RDS Traffic Announcement";
71c689dc2e732d Hans Verkuil      2021-04-27  1154  	case V4L2_CID_RDS_RX_TR=
AFFIC_PROGRAM:	return "RDS Traffic Program";
71c689dc2e732d Hans Verkuil      2021-04-27  1155  	case V4L2_CID_RDS_RX_MU=
SIC_SPEECH:	return "RDS Music";
71c689dc2e732d Hans Verkuil      2021-04-27  1156  =

71c689dc2e732d Hans Verkuil      2021-04-27  1157  	/* Detection controls */
71c689dc2e732d Hans Verkuil      2021-04-27  1158  	/* Keep the order of th=
e 'case's the same as in v4l2-controls.h! */
71c689dc2e732d Hans Verkuil      2021-04-27  1159  	case V4L2_CID_DETECT_CL=
ASS:		return "Detection Controls";
71c689dc2e732d Hans Verkuil      2021-04-27  1160  	case V4L2_CID_DETECT_MD=
_MODE:		return "Motion Detection Mode";
71c689dc2e732d Hans Verkuil      2021-04-27  1161  	case V4L2_CID_DETECT_MD=
_GLOBAL_THRESHOLD: return "MD Global Threshold";
71c689dc2e732d Hans Verkuil      2021-04-27  1162  	case V4L2_CID_DETECT_MD=
_THRESHOLD_GRID:	return "MD Threshold Grid";
71c689dc2e732d Hans Verkuil      2021-04-27  1163  	case V4L2_CID_DETECT_MD=
_REGION_GRID:	return "MD Region Grid";
71c689dc2e732d Hans Verkuil      2021-04-27  1164  =

71c689dc2e732d Hans Verkuil      2021-04-27  1165  	/* Stateless Codec cont=
rols */
71c689dc2e732d Hans Verkuil      2021-04-27  1166  	/* Keep the order of th=
e 'case's the same as in v4l2-controls.h! */
71c689dc2e732d Hans Verkuil      2021-04-27  1167  	case V4L2_CID_CODEC_STA=
TELESS_CLASS:	return "Stateless Codec Controls";
71c689dc2e732d Hans Verkuil      2021-04-27  1168  	case V4L2_CID_STATELESS=
_H264_DECODE_MODE:		return "H264 Decode Mode";
71c689dc2e732d Hans Verkuil      2021-04-27  1169  	case V4L2_CID_STATELESS=
_H264_START_CODE:		return "H264 Start Code";
71c689dc2e732d Hans Verkuil      2021-04-27  1170  	case V4L2_CID_STATELESS=
_H264_SPS:			return "H264 Sequence Parameter Set";
71c689dc2e732d Hans Verkuil      2021-04-27  1171  	case V4L2_CID_STATELESS=
_H264_PPS:			return "H264 Picture Parameter Set";
71c689dc2e732d Hans Verkuil      2021-04-27  1172  	case V4L2_CID_STATELESS=
_H264_SCALING_MATRIX:		return "H264 Scaling Matrix";
71c689dc2e732d Hans Verkuil      2021-04-27  1173  	case V4L2_CID_STATELESS=
_H264_PRED_WEIGHTS:		return "H264 Prediction Weight Table";
71c689dc2e732d Hans Verkuil      2021-04-27  1174  	case V4L2_CID_STATELESS=
_H264_SLICE_PARAMS:		return "H264 Slice Parameters";
71c689dc2e732d Hans Verkuil      2021-04-27  1175  	case V4L2_CID_STATELESS=
_H264_DECODE_PARAMS:		return "H264 Decode Parameters";
71c689dc2e732d Hans Verkuil      2021-04-27  1176  	case V4L2_CID_STATELESS=
_FWHT_PARAMS:			return "FWHT Stateless Parameters";
71c689dc2e732d Hans Verkuil      2021-04-27  1177  	case V4L2_CID_STATELESS=
_VP8_FRAME:			return "VP8 Frame Parameters";
71c689dc2e732d Hans Verkuil      2021-04-27  1178  	case V4L2_CID_STATELESS=
_MPEG2_SEQUENCE:			return "MPEG-2 Sequence Header";
71c689dc2e732d Hans Verkuil      2021-04-27  1179  	case V4L2_CID_STATELESS=
_MPEG2_PICTURE:			return "MPEG-2 Picture Header";
71c689dc2e732d Hans Verkuil      2021-04-27  1180  	case V4L2_CID_STATELESS=
_MPEG2_QUANTISATION:		return "MPEG-2 Quantisation Matrices";
71c689dc2e732d Hans Verkuil      2021-04-27  1181  =

71c689dc2e732d Hans Verkuil      2021-04-27  1182  	/* Colorimetry controls=
 */
71c689dc2e732d Hans Verkuil      2021-04-27  1183  	/* Keep the order of th=
e 'case's the same as in v4l2-controls.h! */
71c689dc2e732d Hans Verkuil      2021-04-27  1184  	case V4L2_CID_COLORIMET=
RY_CLASS:	return "Colorimetry Controls";
71c689dc2e732d Hans Verkuil      2021-04-27  1185  	case V4L2_CID_COLORIMET=
RY_HDR10_CLL_INFO:		return "HDR10 Content Light Info";
71c689dc2e732d Hans Verkuil      2021-04-27 @1186  	case V4L2_CID_COLORIMET=
RY_HDR10_MASTERING_DISPLAY:	return "HDR10 Mastering Display";
71c689dc2e732d Hans Verkuil      2021-04-27  1187  	default:
71c689dc2e732d Hans Verkuil      2021-04-27  1188  		return NULL;
71c689dc2e732d Hans Verkuil      2021-04-27  1189  	}
71c689dc2e732d Hans Verkuil      2021-04-27  1190  }
71c689dc2e732d Hans Verkuil      2021-04-27  1191  EXPORT_SYMBOL(v4l2_ctrl_=
get_name);
71c689dc2e732d Hans Verkuil      2021-04-27  1192  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5372633612343060848==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
oVePk6dEeIL8H8NJemH7BgIA
--===============5372633612343060848==--

