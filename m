Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1932E111F
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Apr 2023 01:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680917722; x=1712453722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z80h2f3+RwWQGVHOTYgLicpTrM00tdbrc7mnqXPx2pI=;
  b=kKmoDhX6MUgA1KfKePzLIlZYadP88iSNA/127rYoOBEAM9V6QGmP3zgV
   aqdUW2mfOupoF2+f7BWm7f+ELGH5D/HVRgj28eK73LpOlDyQ2POOKMbfy
   q9XjOWDC4b8i5I1hNUIIvPa9MBvRyOvmtrXUUPEmwRw8rnG7XB6fj6dHn
   zoLyQKVsA+p7rWzz2VuWcJbaMJqGfxMuoky6EjmtkrhtZ3raQb8eMnHNh
   44vUvCypbLu0bgZichpHCFjKy4C96SXZfKM+bsjChRIqhSpZgCH77KN/S
   6MO6Dc8iJwiTu1ASZPw3gZX2OB/05gmyPU+GUBEaAiu9GfGQHMAKPBcCO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="340584759"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="340584759"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 18:35:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="752190175"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="752190175"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Apr 2023 18:35:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkxU6-000T8N-2q;
	Sat, 08 Apr 2023 01:35:18 +0000
Date: Sat, 8 Apr 2023 09:35:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RFC 4/4] media: v4l2-ctrls: add controls for individual
 zoom lenses
Message-ID: <202304080916.XTTAwaSB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230406-feature-controls-lens-v1-4-543189a680de@wolfvision.net>
References: <20230406-feature-controls-lens-v1-4-543189a680de@wolfvision.net>
TO: Michael Riesch via B4 Relay <devnull+michael.riesch.wolfvision.net@kernel.org>

Hi Michael,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on fe15c26ee26efa11741a7b632e9f23b01aca4cc6]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Riesch-via-B4-Relay/media-v4l2-ctrls-add-lens-group-status-controls-for-zoom-and-focus/20230406-223922
base:   fe15c26ee26efa11741a7b632e9f23b01aca4cc6
patch link:    https://lore.kernel.org/r/20230406-feature-controls-lens-v1-4-543189a680de%40wolfvision.net
patch subject: [PATCH RFC 4/4] media: v4l2-ctrls: add controls for individual zoom lenses
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: x86_64-randconfig-m001-20230403 (https://download.01.org/0day-ci/archive/20230408/202304080916.XTTAwaSB-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304080916.XTTAwaSB-lkp@intel.com/

smatch warnings:
drivers/media/v4l2-core/v4l2-ctrls-defs.c:1214 v4l2_ctrl_get_name() warn: Function too hairy.  No more merges.

vim +1214 drivers/media/v4l2-core/v4l2-ctrls-defs.c

71c689dc2e732d Hans Verkuil          2021-04-27   747  
71c689dc2e732d Hans Verkuil          2021-04-27   748  /* Return the control name. */
71c689dc2e732d Hans Verkuil          2021-04-27   749  const char *v4l2_ctrl_get_name(u32 id)
71c689dc2e732d Hans Verkuil          2021-04-27   750  {
71c689dc2e732d Hans Verkuil          2021-04-27   751  	switch (id) {
71c689dc2e732d Hans Verkuil          2021-04-27   752  	/* USER controls */
71c689dc2e732d Hans Verkuil          2021-04-27   753  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
71c689dc2e732d Hans Verkuil          2021-04-27   754  	case V4L2_CID_USER_CLASS:		return "User Controls";
71c689dc2e732d Hans Verkuil          2021-04-27   755  	case V4L2_CID_BRIGHTNESS:		return "Brightness";
71c689dc2e732d Hans Verkuil          2021-04-27   756  	case V4L2_CID_CONTRAST:			return "Contrast";
71c689dc2e732d Hans Verkuil          2021-04-27   757  	case V4L2_CID_SATURATION:		return "Saturation";
71c689dc2e732d Hans Verkuil          2021-04-27   758  	case V4L2_CID_HUE:			return "Hue";
71c689dc2e732d Hans Verkuil          2021-04-27   759  	case V4L2_CID_AUDIO_VOLUME:		return "Volume";
71c689dc2e732d Hans Verkuil          2021-04-27   760  	case V4L2_CID_AUDIO_BALANCE:		return "Balance";
71c689dc2e732d Hans Verkuil          2021-04-27   761  	case V4L2_CID_AUDIO_BASS:		return "Bass";
71c689dc2e732d Hans Verkuil          2021-04-27   762  	case V4L2_CID_AUDIO_TREBLE:		return "Treble";
71c689dc2e732d Hans Verkuil          2021-04-27   763  	case V4L2_CID_AUDIO_MUTE:		return "Mute";
71c689dc2e732d Hans Verkuil          2021-04-27   764  	case V4L2_CID_AUDIO_LOUDNESS:		return "Loudness";
71c689dc2e732d Hans Verkuil          2021-04-27   765  	case V4L2_CID_BLACK_LEVEL:		return "Black Level";
71c689dc2e732d Hans Verkuil          2021-04-27   766  	case V4L2_CID_AUTO_WHITE_BALANCE:	return "White Balance, Automatic";
71c689dc2e732d Hans Verkuil          2021-04-27   767  	case V4L2_CID_DO_WHITE_BALANCE:		return "Do White Balance";
71c689dc2e732d Hans Verkuil          2021-04-27   768  	case V4L2_CID_RED_BALANCE:		return "Red Balance";
71c689dc2e732d Hans Verkuil          2021-04-27   769  	case V4L2_CID_BLUE_BALANCE:		return "Blue Balance";
71c689dc2e732d Hans Verkuil          2021-04-27   770  	case V4L2_CID_GAMMA:			return "Gamma";
71c689dc2e732d Hans Verkuil          2021-04-27   771  	case V4L2_CID_EXPOSURE:			return "Exposure";
71c689dc2e732d Hans Verkuil          2021-04-27   772  	case V4L2_CID_AUTOGAIN:			return "Gain, Automatic";
71c689dc2e732d Hans Verkuil          2021-04-27   773  	case V4L2_CID_GAIN:			return "Gain";
71c689dc2e732d Hans Verkuil          2021-04-27   774  	case V4L2_CID_HFLIP:			return "Horizontal Flip";
71c689dc2e732d Hans Verkuil          2021-04-27   775  	case V4L2_CID_VFLIP:			return "Vertical Flip";
71c689dc2e732d Hans Verkuil          2021-04-27   776  	case V4L2_CID_POWER_LINE_FREQUENCY:	return "Power Line Frequency";
71c689dc2e732d Hans Verkuil          2021-04-27   777  	case V4L2_CID_HUE_AUTO:			return "Hue, Automatic";
71c689dc2e732d Hans Verkuil          2021-04-27   778  	case V4L2_CID_WHITE_BALANCE_TEMPERATURE: return "White Balance Temperature";
71c689dc2e732d Hans Verkuil          2021-04-27   779  	case V4L2_CID_SHARPNESS:		return "Sharpness";
71c689dc2e732d Hans Verkuil          2021-04-27   780  	case V4L2_CID_BACKLIGHT_COMPENSATION:	return "Backlight Compensation";
71c689dc2e732d Hans Verkuil          2021-04-27   781  	case V4L2_CID_CHROMA_AGC:		return "Chroma AGC";
71c689dc2e732d Hans Verkuil          2021-04-27   782  	case V4L2_CID_COLOR_KILLER:		return "Color Killer";
71c689dc2e732d Hans Verkuil          2021-04-27   783  	case V4L2_CID_COLORFX:			return "Color Effects";
71c689dc2e732d Hans Verkuil          2021-04-27   784  	case V4L2_CID_AUTOBRIGHTNESS:		return "Brightness, Automatic";
71c689dc2e732d Hans Verkuil          2021-04-27   785  	case V4L2_CID_BAND_STOP_FILTER:		return "Band-Stop Filter";
71c689dc2e732d Hans Verkuil          2021-04-27   786  	case V4L2_CID_ROTATE:			return "Rotate";
71c689dc2e732d Hans Verkuil          2021-04-27   787  	case V4L2_CID_BG_COLOR:			return "Background Color";
71c689dc2e732d Hans Verkuil          2021-04-27   788  	case V4L2_CID_CHROMA_GAIN:		return "Chroma Gain";
71c689dc2e732d Hans Verkuil          2021-04-27   789  	case V4L2_CID_ILLUMINATORS_1:		return "Illuminator 1";
71c689dc2e732d Hans Verkuil          2021-04-27   790  	case V4L2_CID_ILLUMINATORS_2:		return "Illuminator 2";
71c689dc2e732d Hans Verkuil          2021-04-27   791  	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:	return "Min Number of Capture Buffers";
71c689dc2e732d Hans Verkuil          2021-04-27   792  	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:	return "Min Number of Output Buffers";
71c689dc2e732d Hans Verkuil          2021-04-27   793  	case V4L2_CID_ALPHA_COMPONENT:		return "Alpha Component";
71c689dc2e732d Hans Verkuil          2021-04-27   794  	case V4L2_CID_COLORFX_CBCR:		return "Color Effects, CbCr";
ef9f18a9e3a041 Dillon Min            2021-10-19   795  	case V4L2_CID_COLORFX_RGB:              return "Color Effects, RGB";
71c689dc2e732d Hans Verkuil          2021-04-27   796  
71c689dc2e732d Hans Verkuil          2021-04-27   797  	/*
71c689dc2e732d Hans Verkuil          2021-04-27   798  	 * Codec controls
71c689dc2e732d Hans Verkuil          2021-04-27   799  	 *
71c689dc2e732d Hans Verkuil          2021-04-27   800  	 * The MPEG controls are applicable to all codec controls
71c689dc2e732d Hans Verkuil          2021-04-27   801  	 * and the 'MPEG' part of the define is historical.
71c689dc2e732d Hans Verkuil          2021-04-27   802  	 *
71c689dc2e732d Hans Verkuil          2021-04-27   803  	 * Keep the order of the 'case's the same as in videodev2.h!
71c689dc2e732d Hans Verkuil          2021-04-27   804  	 */
71c689dc2e732d Hans Verkuil          2021-04-27   805  	case V4L2_CID_CODEC_CLASS:		return "Codec Controls";
71c689dc2e732d Hans Verkuil          2021-04-27   806  	case V4L2_CID_MPEG_STREAM_TYPE:		return "Stream Type";
71c689dc2e732d Hans Verkuil          2021-04-27   807  	case V4L2_CID_MPEG_STREAM_PID_PMT:	return "Stream PMT Program ID";
71c689dc2e732d Hans Verkuil          2021-04-27   808  	case V4L2_CID_MPEG_STREAM_PID_AUDIO:	return "Stream Audio Program ID";
71c689dc2e732d Hans Verkuil          2021-04-27   809  	case V4L2_CID_MPEG_STREAM_PID_VIDEO:	return "Stream Video Program ID";
71c689dc2e732d Hans Verkuil          2021-04-27   810  	case V4L2_CID_MPEG_STREAM_PID_PCR:	return "Stream PCR Program ID";
71c689dc2e732d Hans Verkuil          2021-04-27   811  	case V4L2_CID_MPEG_STREAM_PES_ID_AUDIO: return "Stream PES Audio ID";
71c689dc2e732d Hans Verkuil          2021-04-27   812  	case V4L2_CID_MPEG_STREAM_PES_ID_VIDEO: return "Stream PES Video ID";
71c689dc2e732d Hans Verkuil          2021-04-27   813  	case V4L2_CID_MPEG_STREAM_VBI_FMT:	return "Stream VBI Format";
71c689dc2e732d Hans Verkuil          2021-04-27   814  	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ: return "Audio Sampling Frequency";
71c689dc2e732d Hans Verkuil          2021-04-27   815  	case V4L2_CID_MPEG_AUDIO_ENCODING:	return "Audio Encoding";
71c689dc2e732d Hans Verkuil          2021-04-27   816  	case V4L2_CID_MPEG_AUDIO_L1_BITRATE:	return "Audio Layer I Bitrate";
71c689dc2e732d Hans Verkuil          2021-04-27   817  	case V4L2_CID_MPEG_AUDIO_L2_BITRATE:	return "Audio Layer II Bitrate";
71c689dc2e732d Hans Verkuil          2021-04-27   818  	case V4L2_CID_MPEG_AUDIO_L3_BITRATE:	return "Audio Layer III Bitrate";
71c689dc2e732d Hans Verkuil          2021-04-27   819  	case V4L2_CID_MPEG_AUDIO_MODE:		return "Audio Stereo Mode";
71c689dc2e732d Hans Verkuil          2021-04-27   820  	case V4L2_CID_MPEG_AUDIO_MODE_EXTENSION: return "Audio Stereo Mode Extension";
71c689dc2e732d Hans Verkuil          2021-04-27   821  	case V4L2_CID_MPEG_AUDIO_EMPHASIS:	return "Audio Emphasis";
71c689dc2e732d Hans Verkuil          2021-04-27   822  	case V4L2_CID_MPEG_AUDIO_CRC:		return "Audio CRC";
71c689dc2e732d Hans Verkuil          2021-04-27   823  	case V4L2_CID_MPEG_AUDIO_MUTE:		return "Audio Mute";
71c689dc2e732d Hans Verkuil          2021-04-27   824  	case V4L2_CID_MPEG_AUDIO_AAC_BITRATE:	return "Audio AAC Bitrate";
71c689dc2e732d Hans Verkuil          2021-04-27   825  	case V4L2_CID_MPEG_AUDIO_AC3_BITRATE:	return "Audio AC-3 Bitrate";
71c689dc2e732d Hans Verkuil          2021-04-27   826  	case V4L2_CID_MPEG_AUDIO_DEC_PLAYBACK:	return "Audio Playback";
71c689dc2e732d Hans Verkuil          2021-04-27   827  	case V4L2_CID_MPEG_AUDIO_DEC_MULTILINGUAL_PLAYBACK: return "Audio Multilingual Playback";
71c689dc2e732d Hans Verkuil          2021-04-27   828  	case V4L2_CID_MPEG_VIDEO_ENCODING:	return "Video Encoding";
71c689dc2e732d Hans Verkuil          2021-04-27   829  	case V4L2_CID_MPEG_VIDEO_ASPECT:	return "Video Aspect";
71c689dc2e732d Hans Verkuil          2021-04-27   830  	case V4L2_CID_MPEG_VIDEO_B_FRAMES:	return "Video B Frames";
71c689dc2e732d Hans Verkuil          2021-04-27   831  	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:	return "Video GOP Size";
71c689dc2e732d Hans Verkuil          2021-04-27   832  	case V4L2_CID_MPEG_VIDEO_GOP_CLOSURE:	return "Video GOP Closure";
71c689dc2e732d Hans Verkuil          2021-04-27   833  	case V4L2_CID_MPEG_VIDEO_PULLDOWN:	return "Video Pulldown";
71c689dc2e732d Hans Verkuil          2021-04-27   834  	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:	return "Video Bitrate Mode";
71c689dc2e732d Hans Verkuil          2021-04-27   835  	case V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY:	return "Constant Quality";
71c689dc2e732d Hans Verkuil          2021-04-27   836  	case V4L2_CID_MPEG_VIDEO_BITRATE:	return "Video Bitrate";
71c689dc2e732d Hans Verkuil          2021-04-27   837  	case V4L2_CID_MPEG_VIDEO_BITRATE_PEAK:	return "Video Peak Bitrate";
71c689dc2e732d Hans Verkuil          2021-04-27   838  	case V4L2_CID_MPEG_VIDEO_TEMPORAL_DECIMATION: return "Video Temporal Decimation";
71c689dc2e732d Hans Verkuil          2021-04-27   839  	case V4L2_CID_MPEG_VIDEO_MUTE:		return "Video Mute";
71c689dc2e732d Hans Verkuil          2021-04-27   840  	case V4L2_CID_MPEG_VIDEO_MUTE_YUV:	return "Video Mute YUV";
71c689dc2e732d Hans Verkuil          2021-04-27   841  	case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:	return "Decoder Slice Interface";
71c689dc2e732d Hans Verkuil          2021-04-27   842  	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:	return "MPEG4 Loop Filter Enable";
71c689dc2e732d Hans Verkuil          2021-04-27   843  	case V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB:	return "Number of Intra Refresh MBs";
fcbc4acf8b8dff Dikshita Agarwal      2022-04-19   844  	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:	return "Intra Refresh Period Type";
9d5adeecc40936 Stanimir Varbanov     2021-06-22   845  	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:		return "Intra Refresh Period";
71c689dc2e732d Hans Verkuil          2021-04-27   846  	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:		return "Frame Level Rate Control Enable";
71c689dc2e732d Hans Verkuil          2021-04-27   847  	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:			return "H264 MB Level Rate Control";
71c689dc2e732d Hans Verkuil          2021-04-27   848  	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:			return "Sequence Header Mode";
71c689dc2e732d Hans Verkuil          2021-04-27   849  	case V4L2_CID_MPEG_VIDEO_MAX_REF_PIC:			return "Max Number of Reference Pics";
71c689dc2e732d Hans Verkuil          2021-04-27   850  	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:		return "Frame Skip Mode";
71c689dc2e732d Hans Verkuil          2021-04-27   851  	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY:		return "Display Delay";
71c689dc2e732d Hans Verkuil          2021-04-27   852  	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE:	return "Display Delay Enable";
71c689dc2e732d Hans Verkuil          2021-04-27   853  	case V4L2_CID_MPEG_VIDEO_AU_DELIMITER:			return "Generate Access Unit Delimiters";
71c689dc2e732d Hans Verkuil          2021-04-27   854  	case V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP:		return "H263 I-Frame QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   855  	case V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP:		return "H263 P-Frame QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   856  	case V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP:		return "H263 B-Frame QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   857  	case V4L2_CID_MPEG_VIDEO_H263_MIN_QP:			return "H263 Minimum QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   858  	case V4L2_CID_MPEG_VIDEO_H263_MAX_QP:			return "H263 Maximum QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   859  	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP:		return "H264 I-Frame QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   860  	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP:		return "H264 P-Frame QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   861  	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP:		return "H264 B-Frame QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   862  	case V4L2_CID_MPEG_VIDEO_H264_MAX_QP:			return "H264 Maximum QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   863  	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP:			return "H264 Minimum QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   864  	case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:		return "H264 8x8 Transform Enable";
71c689dc2e732d Hans Verkuil          2021-04-27   865  	case V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE:			return "H264 CPB Buffer Size";
71c689dc2e732d Hans Verkuil          2021-04-27   866  	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:		return "H264 Entropy Mode";
71c689dc2e732d Hans Verkuil          2021-04-27   867  	case V4L2_CID_MPEG_VIDEO_H264_I_PERIOD:			return "H264 I-Frame Period";
71c689dc2e732d Hans Verkuil          2021-04-27   868  	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:			return "H264 Level";
71c689dc2e732d Hans Verkuil          2021-04-27   869  	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA:	return "H264 Loop Filter Alpha Offset";
71c689dc2e732d Hans Verkuil          2021-04-27   870  	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA:		return "H264 Loop Filter Beta Offset";
71c689dc2e732d Hans Verkuil          2021-04-27   871  	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE:		return "H264 Loop Filter Mode";
71c689dc2e732d Hans Verkuil          2021-04-27   872  	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:			return "H264 Profile";
71c689dc2e732d Hans Verkuil          2021-04-27   873  	case V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_HEIGHT:	return "Vertical Size of SAR";
71c689dc2e732d Hans Verkuil          2021-04-27   874  	case V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_WIDTH:	return "Horizontal Size of SAR";
71c689dc2e732d Hans Verkuil          2021-04-27   875  	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE:		return "Aspect Ratio VUI Enable";
71c689dc2e732d Hans Verkuil          2021-04-27   876  	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC:		return "VUI Aspect Ratio IDC";
71c689dc2e732d Hans Verkuil          2021-04-27   877  	case V4L2_CID_MPEG_VIDEO_H264_SEI_FRAME_PACKING:	return "H264 Enable Frame Packing SEI";
71c689dc2e732d Hans Verkuil          2021-04-27   878  	case V4L2_CID_MPEG_VIDEO_H264_SEI_FP_CURRENT_FRAME_0:	return "H264 Set Curr. Frame as Frame0";
71c689dc2e732d Hans Verkuil          2021-04-27   879  	case V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE:	return "H264 FP Arrangement Type";
71c689dc2e732d Hans Verkuil          2021-04-27   880  	case V4L2_CID_MPEG_VIDEO_H264_FMO:			return "H264 Flexible MB Ordering";
71c689dc2e732d Hans Verkuil          2021-04-27   881  	case V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE:		return "H264 Map Type for FMO";
71c689dc2e732d Hans Verkuil          2021-04-27   882  	case V4L2_CID_MPEG_VIDEO_H264_FMO_SLICE_GROUP:		return "H264 FMO Number of Slice Groups";
71c689dc2e732d Hans Verkuil          2021-04-27   883  	case V4L2_CID_MPEG_VIDEO_H264_FMO_CHANGE_DIRECTION:	return "H264 FMO Direction of Change";
71c689dc2e732d Hans Verkuil          2021-04-27   884  	case V4L2_CID_MPEG_VIDEO_H264_FMO_CHANGE_RATE:		return "H264 FMO Size of 1st Slice Grp";
71c689dc2e732d Hans Verkuil          2021-04-27   885  	case V4L2_CID_MPEG_VIDEO_H264_FMO_RUN_LENGTH:		return "H264 FMO No. of Consecutive MBs";
71c689dc2e732d Hans Verkuil          2021-04-27   886  	case V4L2_CID_MPEG_VIDEO_H264_ASO:			return "H264 Arbitrary Slice Ordering";
71c689dc2e732d Hans Verkuil          2021-04-27   887  	case V4L2_CID_MPEG_VIDEO_H264_ASO_SLICE_ORDER:		return "H264 ASO Slice Order";
71c689dc2e732d Hans Verkuil          2021-04-27   888  	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING:	return "Enable H264 Hierarchical Coding";
71c689dc2e732d Hans Verkuil          2021-04-27   889  	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE:	return "H264 Hierarchical Coding Type";
71c689dc2e732d Hans Verkuil          2021-04-27   890  	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER:return "H264 Number of HC Layers";
71c689dc2e732d Hans Verkuil          2021-04-27   891  	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_QP:
71c689dc2e732d Hans Verkuil          2021-04-27   892  								return "H264 Set QP Value for HC Layers";
71c689dc2e732d Hans Verkuil          2021-04-27   893  	case V4L2_CID_MPEG_VIDEO_H264_CONSTRAINED_INTRA_PREDICTION:
71c689dc2e732d Hans Verkuil          2021-04-27   894  								return "H264 Constrained Intra Pred";
71c689dc2e732d Hans Verkuil          2021-04-27   895  	case V4L2_CID_MPEG_VIDEO_H264_CHROMA_QP_INDEX_OFFSET:	return "H264 Chroma QP Index Offset";
71c689dc2e732d Hans Verkuil          2021-04-27   896  	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MIN_QP:		return "H264 I-Frame Minimum QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   897  	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MAX_QP:		return "H264 I-Frame Maximum QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   898  	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP:		return "H264 P-Frame Minimum QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   899  	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP:		return "H264 P-Frame Maximum QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   900  	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP:		return "H264 B-Frame Minimum QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   901  	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP:		return "H264 B-Frame Maximum QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   902  	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR:	return "H264 Hierarchical Lay 0 Bitrate";
71c689dc2e732d Hans Verkuil          2021-04-27   903  	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR:	return "H264 Hierarchical Lay 1 Bitrate";
71c689dc2e732d Hans Verkuil          2021-04-27   904  	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR:	return "H264 Hierarchical Lay 2 Bitrate";
71c689dc2e732d Hans Verkuil          2021-04-27   905  	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR:	return "H264 Hierarchical Lay 3 Bitrate";
71c689dc2e732d Hans Verkuil          2021-04-27   906  	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR:	return "H264 Hierarchical Lay 4 Bitrate";
71c689dc2e732d Hans Verkuil          2021-04-27   907  	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR:	return "H264 Hierarchical Lay 5 Bitrate";
71c689dc2e732d Hans Verkuil          2021-04-27   908  	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L6_BR:	return "H264 Hierarchical Lay 6 Bitrate";
71c689dc2e732d Hans Verkuil          2021-04-27   909  	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:			return "MPEG2 Level";
71c689dc2e732d Hans Verkuil          2021-04-27   910  	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:			return "MPEG2 Profile";
71c689dc2e732d Hans Verkuil          2021-04-27   911  	case V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP:		return "MPEG4 I-Frame QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   912  	case V4L2_CID_MPEG_VIDEO_MPEG4_P_FRAME_QP:		return "MPEG4 P-Frame QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   913  	case V4L2_CID_MPEG_VIDEO_MPEG4_B_FRAME_QP:		return "MPEG4 B-Frame QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   914  	case V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP:			return "MPEG4 Minimum QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   915  	case V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP:			return "MPEG4 Maximum QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   916  	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:			return "MPEG4 Level";
71c689dc2e732d Hans Verkuil          2021-04-27   917  	case V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE:			return "MPEG4 Profile";
71c689dc2e732d Hans Verkuil          2021-04-27   918  	case V4L2_CID_MPEG_VIDEO_MPEG4_QPEL:			return "Quarter Pixel Search Enable";
71c689dc2e732d Hans Verkuil          2021-04-27   919  	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES:		return "Maximum Bytes in a Slice";
71c689dc2e732d Hans Verkuil          2021-04-27   920  	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:		return "Number of MBs in a Slice";
71c689dc2e732d Hans Verkuil          2021-04-27   921  	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:		return "Slice Partitioning Method";
71c689dc2e732d Hans Verkuil          2021-04-27   922  	case V4L2_CID_MPEG_VIDEO_VBV_SIZE:			return "VBV Buffer Size";
71c689dc2e732d Hans Verkuil          2021-04-27   923  	case V4L2_CID_MPEG_VIDEO_DEC_PTS:			return "Video Decoder PTS";
71c689dc2e732d Hans Verkuil          2021-04-27   924  	case V4L2_CID_MPEG_VIDEO_DEC_FRAME:			return "Video Decoder Frame Count";
71c689dc2e732d Hans Verkuil          2021-04-27   925  	case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:		return "Video Decoder Conceal Color";
71c689dc2e732d Hans Verkuil          2021-04-27   926  	case V4L2_CID_MPEG_VIDEO_VBV_DELAY:			return "Initial Delay for VBV Control";
71c689dc2e732d Hans Verkuil          2021-04-27   927  	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:		return "Horizontal MV Search Range";
71c689dc2e732d Hans Verkuil          2021-04-27   928  	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:		return "Vertical MV Search Range";
71c689dc2e732d Hans Verkuil          2021-04-27   929  	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:		return "Repeat Sequence Header";
71c689dc2e732d Hans Verkuil          2021-04-27   930  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:		return "Force Key Frame";
71c689dc2e732d Hans Verkuil          2021-04-27   931  	case V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID:		return "Base Layer Priority ID";
71c689dc2e732d Hans Verkuil          2021-04-27   932  	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:			return "LTR Count";
71c689dc2e732d Hans Verkuil          2021-04-27   933  	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "Frame LTR Index";
71c689dc2e732d Hans Verkuil          2021-04-27   934  	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:		return "Use LTR Frames";
71c689dc2e732d Hans Verkuil          2021-04-27   935  	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   936  	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   937  
71c689dc2e732d Hans Verkuil          2021-04-27   938  	/* VPX controls */
71c689dc2e732d Hans Verkuil          2021-04-27   939  	case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:		return "VPX Number of Partitions";
71c689dc2e732d Hans Verkuil          2021-04-27   940  	case V4L2_CID_MPEG_VIDEO_VPX_IMD_DISABLE_4X4:		return "VPX Intra Mode Decision Disable";
71c689dc2e732d Hans Verkuil          2021-04-27   941  	case V4L2_CID_MPEG_VIDEO_VPX_NUM_REF_FRAMES:		return "VPX No. of Refs for P Frame";
71c689dc2e732d Hans Verkuil          2021-04-27   942  	case V4L2_CID_MPEG_VIDEO_VPX_FILTER_LEVEL:		return "VPX Loop Filter Level Range";
71c689dc2e732d Hans Verkuil          2021-04-27   943  	case V4L2_CID_MPEG_VIDEO_VPX_FILTER_SHARPNESS:		return "VPX Deblocking Effect Control";
71c689dc2e732d Hans Verkuil          2021-04-27   944  	case V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_REF_PERIOD:	return "VPX Golden Frame Refresh Period";
71c689dc2e732d Hans Verkuil          2021-04-27   945  	case V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_SEL:		return "VPX Golden Frame Indicator";
71c689dc2e732d Hans Verkuil          2021-04-27   946  	case V4L2_CID_MPEG_VIDEO_VPX_MIN_QP:			return "VPX Minimum QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   947  	case V4L2_CID_MPEG_VIDEO_VPX_MAX_QP:			return "VPX Maximum QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   948  	case V4L2_CID_MPEG_VIDEO_VPX_I_FRAME_QP:		return "VPX I-Frame QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   949  	case V4L2_CID_MPEG_VIDEO_VPX_P_FRAME_QP:		return "VPX P-Frame QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   950  	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:			return "VP8 Profile";
71c689dc2e732d Hans Verkuil          2021-04-27   951  	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:			return "VP9 Profile";
71c689dc2e732d Hans Verkuil          2021-04-27   952  	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:			return "VP9 Level";
71c689dc2e732d Hans Verkuil          2021-04-27   953  
71c689dc2e732d Hans Verkuil          2021-04-27   954  	/* HEVC controls */
71c689dc2e732d Hans Verkuil          2021-04-27   955  	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP:		return "HEVC I-Frame QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   956  	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP:		return "HEVC P-Frame QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   957  	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:		return "HEVC B-Frame QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   958  	case V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP:			return "HEVC Minimum QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   959  	case V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP:			return "HEVC Maximum QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   960  	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MIN_QP:		return "HEVC I-Frame Minimum QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   961  	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MAX_QP:		return "HEVC I-Frame Maximum QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   962  	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MIN_QP:		return "HEVC P-Frame Minimum QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   963  	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MAX_QP:		return "HEVC P-Frame Maximum QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   964  	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MIN_QP:		return "HEVC B-Frame Minimum QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   965  	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MAX_QP:		return "HEVC B-Frame Maximum QP Value";
71c689dc2e732d Hans Verkuil          2021-04-27   966  	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:			return "HEVC Profile";
71c689dc2e732d Hans Verkuil          2021-04-27   967  	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:			return "HEVC Level";
71c689dc2e732d Hans Verkuil          2021-04-27   968  	case V4L2_CID_MPEG_VIDEO_HEVC_TIER:			return "HEVC Tier";
71c689dc2e732d Hans Verkuil          2021-04-27   969  	case V4L2_CID_MPEG_VIDEO_HEVC_FRAME_RATE_RESOLUTION:	return "HEVC Frame Rate Resolution";
71c689dc2e732d Hans Verkuil          2021-04-27   970  	case V4L2_CID_MPEG_VIDEO_HEVC_MAX_PARTITION_DEPTH:	return "HEVC Maximum Coding Unit Depth";
71c689dc2e732d Hans Verkuil          2021-04-27   971  	case V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_TYPE:		return "HEVC Refresh Type";
71c689dc2e732d Hans Verkuil          2021-04-27   972  	case V4L2_CID_MPEG_VIDEO_HEVC_CONST_INTRA_PRED:		return "HEVC Constant Intra Prediction";
71c689dc2e732d Hans Verkuil          2021-04-27   973  	case V4L2_CID_MPEG_VIDEO_HEVC_LOSSLESS_CU:		return "HEVC Lossless Encoding";
71c689dc2e732d Hans Verkuil          2021-04-27   974  	case V4L2_CID_MPEG_VIDEO_HEVC_WAVEFRONT:		return "HEVC Wavefront";
71c689dc2e732d Hans Verkuil          2021-04-27   975  	case V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE:		return "HEVC Loop Filter";
71c689dc2e732d Hans Verkuil          2021-04-27   976  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_QP:			return "HEVC QP Values";
71c689dc2e732d Hans Verkuil          2021-04-27   977  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE:		return "HEVC Hierarchical Coding Type";
71c689dc2e732d Hans Verkuil          2021-04-27   978  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_LAYER:	return "HEVC Hierarchical Coding Layer";
71c689dc2e732d Hans Verkuil          2021-04-27   979  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L0_QP:	return "HEVC Hierarchical Layer 0 QP";
71c689dc2e732d Hans Verkuil          2021-04-27   980  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L1_QP:	return "HEVC Hierarchical Layer 1 QP";
71c689dc2e732d Hans Verkuil          2021-04-27   981  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L2_QP:	return "HEVC Hierarchical Layer 2 QP";
71c689dc2e732d Hans Verkuil          2021-04-27   982  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L3_QP:	return "HEVC Hierarchical Layer 3 QP";
71c689dc2e732d Hans Verkuil          2021-04-27   983  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_QP:	return "HEVC Hierarchical Layer 4 QP";
71c689dc2e732d Hans Verkuil          2021-04-27   984  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_QP:	return "HEVC Hierarchical Layer 5 QP";
71c689dc2e732d Hans Verkuil          2021-04-27   985  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_QP:	return "HEVC Hierarchical Layer 6 QP";
71c689dc2e732d Hans Verkuil          2021-04-27   986  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L0_BR:	return "HEVC Hierarchical Lay 0 BitRate";
71c689dc2e732d Hans Verkuil          2021-04-27   987  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L1_BR:	return "HEVC Hierarchical Lay 1 BitRate";
71c689dc2e732d Hans Verkuil          2021-04-27   988  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L2_BR:	return "HEVC Hierarchical Lay 2 BitRate";
71c689dc2e732d Hans Verkuil          2021-04-27   989  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L3_BR:	return "HEVC Hierarchical Lay 3 BitRate";
71c689dc2e732d Hans Verkuil          2021-04-27   990  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR:	return "HEVC Hierarchical Lay 4 BitRate";
71c689dc2e732d Hans Verkuil          2021-04-27   991  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:	return "HEVC Hierarchical Lay 5 BitRate";
71c689dc2e732d Hans Verkuil          2021-04-27   992  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_BR:	return "HEVC Hierarchical Lay 6 BitRate";
71c689dc2e732d Hans Verkuil          2021-04-27   993  	case V4L2_CID_MPEG_VIDEO_HEVC_GENERAL_PB:		return "HEVC General PB";
71c689dc2e732d Hans Verkuil          2021-04-27   994  	case V4L2_CID_MPEG_VIDEO_HEVC_TEMPORAL_ID:		return "HEVC Temporal ID";
71c689dc2e732d Hans Verkuil          2021-04-27   995  	case V4L2_CID_MPEG_VIDEO_HEVC_STRONG_SMOOTHING:		return "HEVC Strong Intra Smoothing";
71c689dc2e732d Hans Verkuil          2021-04-27   996  	case V4L2_CID_MPEG_VIDEO_HEVC_INTRA_PU_SPLIT:		return "HEVC Intra PU Split";
71c689dc2e732d Hans Verkuil          2021-04-27   997  	case V4L2_CID_MPEG_VIDEO_HEVC_TMV_PREDICTION:		return "HEVC TMV Prediction";
71c689dc2e732d Hans Verkuil          2021-04-27   998  	case V4L2_CID_MPEG_VIDEO_HEVC_MAX_NUM_MERGE_MV_MINUS1:	return "HEVC Max Num of Candidate MVs";
71c689dc2e732d Hans Verkuil          2021-04-27   999  	case V4L2_CID_MPEG_VIDEO_HEVC_WITHOUT_STARTCODE:	return "HEVC ENC Without Startcode";
71c689dc2e732d Hans Verkuil          2021-04-27  1000  	case V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_PERIOD:		return "HEVC Num of I-Frame b/w 2 IDR";
71c689dc2e732d Hans Verkuil          2021-04-27  1001  	case V4L2_CID_MPEG_VIDEO_HEVC_LF_BETA_OFFSET_DIV2:	return "HEVC Loop Filter Beta Offset";
71c689dc2e732d Hans Verkuil          2021-04-27  1002  	case V4L2_CID_MPEG_VIDEO_HEVC_LF_TC_OFFSET_DIV2:	return "HEVC Loop Filter TC Offset";
71c689dc2e732d Hans Verkuil          2021-04-27  1003  	case V4L2_CID_MPEG_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD:	return "HEVC Size of Length Field";
71c689dc2e732d Hans Verkuil          2021-04-27  1004  	case V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES:	return "Reference Frames for a P-Frame";
71c689dc2e732d Hans Verkuil          2021-04-27  1005  	case V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR:		return "Prepend SPS and PPS to IDR";
71c689dc2e732d Hans Verkuil          2021-04-27  1006  
71c689dc2e732d Hans Verkuil          2021-04-27  1007  	/* CAMERA controls */
71c689dc2e732d Hans Verkuil          2021-04-27  1008  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
71c689dc2e732d Hans Verkuil          2021-04-27  1009  	case V4L2_CID_CAMERA_CLASS:		return "Camera Controls";
71c689dc2e732d Hans Verkuil          2021-04-27  1010  	case V4L2_CID_EXPOSURE_AUTO:		return "Auto Exposure";
71c689dc2e732d Hans Verkuil          2021-04-27  1011  	case V4L2_CID_EXPOSURE_ABSOLUTE:	return "Exposure Time, Absolute";
71c689dc2e732d Hans Verkuil          2021-04-27  1012  	case V4L2_CID_EXPOSURE_AUTO_PRIORITY:	return "Exposure, Dynamic Framerate";
71c689dc2e732d Hans Verkuil          2021-04-27  1013  	case V4L2_CID_PAN_RELATIVE:		return "Pan, Relative";
71c689dc2e732d Hans Verkuil          2021-04-27  1014  	case V4L2_CID_TILT_RELATIVE:		return "Tilt, Relative";
71c689dc2e732d Hans Verkuil          2021-04-27  1015  	case V4L2_CID_PAN_RESET:		return "Pan, Reset";
71c689dc2e732d Hans Verkuil          2021-04-27  1016  	case V4L2_CID_TILT_RESET:		return "Tilt, Reset";
71c689dc2e732d Hans Verkuil          2021-04-27  1017  	case V4L2_CID_PAN_ABSOLUTE:		return "Pan, Absolute";
71c689dc2e732d Hans Verkuil          2021-04-27  1018  	case V4L2_CID_TILT_ABSOLUTE:		return "Tilt, Absolute";
71c689dc2e732d Hans Verkuil          2021-04-27  1019  	case V4L2_CID_FOCUS_ABSOLUTE:		return "Focus, Absolute";
71c689dc2e732d Hans Verkuil          2021-04-27  1020  	case V4L2_CID_FOCUS_RELATIVE:		return "Focus, Relative";
71c689dc2e732d Hans Verkuil          2021-04-27  1021  	case V4L2_CID_FOCUS_AUTO:		return "Focus, Automatic Continuous";
71c689dc2e732d Hans Verkuil          2021-04-27  1022  	case V4L2_CID_ZOOM_ABSOLUTE:		return "Zoom, Absolute";
71c689dc2e732d Hans Verkuil          2021-04-27  1023  	case V4L2_CID_ZOOM_RELATIVE:		return "Zoom, Relative";
71c689dc2e732d Hans Verkuil          2021-04-27  1024  	case V4L2_CID_ZOOM_CONTINUOUS:		return "Zoom, Continuous";
71c689dc2e732d Hans Verkuil          2021-04-27  1025  	case V4L2_CID_PRIVACY:			return "Privacy";
71c689dc2e732d Hans Verkuil          2021-04-27  1026  	case V4L2_CID_IRIS_ABSOLUTE:		return "Iris, Absolute";
71c689dc2e732d Hans Verkuil          2021-04-27  1027  	case V4L2_CID_IRIS_RELATIVE:		return "Iris, Relative";
71c689dc2e732d Hans Verkuil          2021-04-27  1028  	case V4L2_CID_AUTO_EXPOSURE_BIAS:	return "Auto Exposure, Bias";
71c689dc2e732d Hans Verkuil          2021-04-27  1029  	case V4L2_CID_AUTO_N_PRESET_WHITE_BALANCE: return "White Balance, Auto & Preset";
71c689dc2e732d Hans Verkuil          2021-04-27  1030  	case V4L2_CID_WIDE_DYNAMIC_RANGE:	return "Wide Dynamic Range";
71c689dc2e732d Hans Verkuil          2021-04-27  1031  	case V4L2_CID_IMAGE_STABILIZATION:	return "Image Stabilization";
71c689dc2e732d Hans Verkuil          2021-04-27  1032  	case V4L2_CID_ISO_SENSITIVITY:		return "ISO Sensitivity";
71c689dc2e732d Hans Verkuil          2021-04-27  1033  	case V4L2_CID_ISO_SENSITIVITY_AUTO:	return "ISO Sensitivity, Auto";
71c689dc2e732d Hans Verkuil          2021-04-27  1034  	case V4L2_CID_EXPOSURE_METERING:	return "Exposure, Metering Mode";
71c689dc2e732d Hans Verkuil          2021-04-27  1035  	case V4L2_CID_SCENE_MODE:		return "Scene Mode";
71c689dc2e732d Hans Verkuil          2021-04-27  1036  	case V4L2_CID_3A_LOCK:			return "3A Lock";
71c689dc2e732d Hans Verkuil          2021-04-27  1037  	case V4L2_CID_AUTO_FOCUS_START:		return "Auto Focus, Start";
71c689dc2e732d Hans Verkuil          2021-04-27  1038  	case V4L2_CID_AUTO_FOCUS_STOP:		return "Auto Focus, Stop";
71c689dc2e732d Hans Verkuil          2021-04-27  1039  	case V4L2_CID_AUTO_FOCUS_STATUS:	return "Auto Focus, Status";
71c689dc2e732d Hans Verkuil          2021-04-27  1040  	case V4L2_CID_AUTO_FOCUS_RANGE:		return "Auto Focus, Range";
71c689dc2e732d Hans Verkuil          2021-04-27  1041  	case V4L2_CID_PAN_SPEED:		return "Pan, Speed";
71c689dc2e732d Hans Verkuil          2021-04-27  1042  	case V4L2_CID_TILT_SPEED:		return "Tilt, Speed";
71c689dc2e732d Hans Verkuil          2021-04-27  1043  	case V4L2_CID_UNIT_CELL_SIZE:		return "Unit Cell Size";
71c689dc2e732d Hans Verkuil          2021-04-27  1044  	case V4L2_CID_CAMERA_ORIENTATION:	return "Camera Orientation";
71c689dc2e732d Hans Verkuil          2021-04-27  1045  	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
7673f3058bd251 Benjamin Mugnier      2022-10-11  1046  	case V4L2_CID_HDR_SENSOR_MODE:		return "HDR Sensor Mode";
c1630c0aaed9c3 Michael Riesch        2023-04-06  1047  	case V4L2_CID_FOCUS_STATUS:		return "Focus, Status";
c1630c0aaed9c3 Michael Riesch        2023-04-06  1048  	case V4L2_CID_ZOOM_STATUS:		return "Zoom, Status";
c798a08f632e89 Michael Riesch        2023-04-06  1049  	case V4L2_CID_FOCUS_SPEED:		return "Focus, Speed";
c798a08f632e89 Michael Riesch        2023-04-06  1050  	case V4L2_CID_ZOOM_SPEED:		return "Zoom, Speed";
e510513e3bd8a1 Michael Riesch        2023-04-06  1051  	case V4L2_CID_LENS_CALIB_CONTROL:	return "Lens Calibration, Control";
e510513e3bd8a1 Michael Riesch        2023-04-06  1052  	case V4L2_CID_LENS_CALIB_STATUS:	return "Lens Calibration, Status";
f58b2d0399d9fc Michael Riesch        2023-04-06  1053  	case V4L2_CID_LENS_CALIB_ZOOM1_ABSOLUTE:	return "Zoom1, Absolute";
f58b2d0399d9fc Michael Riesch        2023-04-06  1054  	case V4L2_CID_LENS_CALIB_ZOOM2_ABSOLUTE:	return "Zoom2, Absolute";
f58b2d0399d9fc Michael Riesch        2023-04-06  1055  	case V4L2_CID_LENS_CALIB_ZOOM3_ABSOLUTE:	return "Zoom3, Absolute";
f58b2d0399d9fc Michael Riesch        2023-04-06  1056  	case V4L2_CID_LENS_CALIB_ZOOM4_ABSOLUTE:	return "Zoom4, Absolute";
f58b2d0399d9fc Michael Riesch        2023-04-06  1057  	case V4L2_CID_LENS_CALIB_ZOOM5_ABSOLUTE:	return "Zoom5, Absolute";
f58b2d0399d9fc Michael Riesch        2023-04-06  1058  	case V4L2_CID_LENS_CALIB_ZOOM1_STATUS:	return "Zoom1, Status";
f58b2d0399d9fc Michael Riesch        2023-04-06  1059  	case V4L2_CID_LENS_CALIB_ZOOM2_STATUS:	return "Zoom2, Status";
f58b2d0399d9fc Michael Riesch        2023-04-06  1060  	case V4L2_CID_LENS_CALIB_ZOOM3_STATUS:	return "Zoom3, Status";
f58b2d0399d9fc Michael Riesch        2023-04-06  1061  	case V4L2_CID_LENS_CALIB_ZOOM4_STATUS:	return "Zoom4, Status";
f58b2d0399d9fc Michael Riesch        2023-04-06  1062  	case V4L2_CID_LENS_CALIB_ZOOM5_STATUS:	return "Zoom5, Status";
71c689dc2e732d Hans Verkuil          2021-04-27  1063  
71c689dc2e732d Hans Verkuil          2021-04-27  1064  	/* FM Radio Modulator controls */
71c689dc2e732d Hans Verkuil          2021-04-27  1065  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
71c689dc2e732d Hans Verkuil          2021-04-27  1066  	case V4L2_CID_FM_TX_CLASS:		return "FM Radio Modulator Controls";
71c689dc2e732d Hans Verkuil          2021-04-27  1067  	case V4L2_CID_RDS_TX_DEVIATION:		return "RDS Signal Deviation";
71c689dc2e732d Hans Verkuil          2021-04-27  1068  	case V4L2_CID_RDS_TX_PI:		return "RDS Program ID";
71c689dc2e732d Hans Verkuil          2021-04-27  1069  	case V4L2_CID_RDS_TX_PTY:		return "RDS Program Type";
71c689dc2e732d Hans Verkuil          2021-04-27  1070  	case V4L2_CID_RDS_TX_PS_NAME:		return "RDS PS Name";
71c689dc2e732d Hans Verkuil          2021-04-27  1071  	case V4L2_CID_RDS_TX_RADIO_TEXT:	return "RDS Radio Text";
71c689dc2e732d Hans Verkuil          2021-04-27  1072  	case V4L2_CID_RDS_TX_MONO_STEREO:	return "RDS Stereo";
71c689dc2e732d Hans Verkuil          2021-04-27  1073  	case V4L2_CID_RDS_TX_ARTIFICIAL_HEAD:	return "RDS Artificial Head";
71c689dc2e732d Hans Verkuil          2021-04-27  1074  	case V4L2_CID_RDS_TX_COMPRESSED:	return "RDS Compressed";
71c689dc2e732d Hans Verkuil          2021-04-27  1075  	case V4L2_CID_RDS_TX_DYNAMIC_PTY:	return "RDS Dynamic PTY";
71c689dc2e732d Hans Verkuil          2021-04-27  1076  	case V4L2_CID_RDS_TX_TRAFFIC_ANNOUNCEMENT: return "RDS Traffic Announcement";
71c689dc2e732d Hans Verkuil          2021-04-27  1077  	case V4L2_CID_RDS_TX_TRAFFIC_PROGRAM:	return "RDS Traffic Program";
71c689dc2e732d Hans Verkuil          2021-04-27  1078  	case V4L2_CID_RDS_TX_MUSIC_SPEECH:	return "RDS Music";
71c689dc2e732d Hans Verkuil          2021-04-27  1079  	case V4L2_CID_RDS_TX_ALT_FREQS_ENABLE:	return "RDS Enable Alt Frequencies";
71c689dc2e732d Hans Verkuil          2021-04-27  1080  	case V4L2_CID_RDS_TX_ALT_FREQS:		return "RDS Alternate Frequencies";
71c689dc2e732d Hans Verkuil          2021-04-27  1081  	case V4L2_CID_AUDIO_LIMITER_ENABLED:	return "Audio Limiter Feature Enabled";
71c689dc2e732d Hans Verkuil          2021-04-27  1082  	case V4L2_CID_AUDIO_LIMITER_RELEASE_TIME: return "Audio Limiter Release Time";
71c689dc2e732d Hans Verkuil          2021-04-27  1083  	case V4L2_CID_AUDIO_LIMITER_DEVIATION:	return "Audio Limiter Deviation";
71c689dc2e732d Hans Verkuil          2021-04-27  1084  	case V4L2_CID_AUDIO_COMPRESSION_ENABLED: return "Audio Compression Enabled";
71c689dc2e732d Hans Verkuil          2021-04-27  1085  	case V4L2_CID_AUDIO_COMPRESSION_GAIN:	return "Audio Compression Gain";
71c689dc2e732d Hans Verkuil          2021-04-27  1086  	case V4L2_CID_AUDIO_COMPRESSION_THRESHOLD: return "Audio Compression Threshold";
71c689dc2e732d Hans Verkuil          2021-04-27  1087  	case V4L2_CID_AUDIO_COMPRESSION_ATTACK_TIME: return "Audio Compression Attack Time";
71c689dc2e732d Hans Verkuil          2021-04-27  1088  	case V4L2_CID_AUDIO_COMPRESSION_RELEASE_TIME: return "Audio Compression Release Time";
71c689dc2e732d Hans Verkuil          2021-04-27  1089  	case V4L2_CID_PILOT_TONE_ENABLED:	return "Pilot Tone Feature Enabled";
71c689dc2e732d Hans Verkuil          2021-04-27  1090  	case V4L2_CID_PILOT_TONE_DEVIATION:	return "Pilot Tone Deviation";
71c689dc2e732d Hans Verkuil          2021-04-27  1091  	case V4L2_CID_PILOT_TONE_FREQUENCY:	return "Pilot Tone Frequency";
71c689dc2e732d Hans Verkuil          2021-04-27  1092  	case V4L2_CID_TUNE_PREEMPHASIS:		return "Pre-Emphasis";
71c689dc2e732d Hans Verkuil          2021-04-27  1093  	case V4L2_CID_TUNE_POWER_LEVEL:		return "Tune Power Level";
71c689dc2e732d Hans Verkuil          2021-04-27  1094  	case V4L2_CID_TUNE_ANTENNA_CAPACITOR:	return "Tune Antenna Capacitor";
71c689dc2e732d Hans Verkuil          2021-04-27  1095  
71c689dc2e732d Hans Verkuil          2021-04-27  1096  	/* Flash controls */
71c689dc2e732d Hans Verkuil          2021-04-27  1097  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
71c689dc2e732d Hans Verkuil          2021-04-27  1098  	case V4L2_CID_FLASH_CLASS:		return "Flash Controls";
71c689dc2e732d Hans Verkuil          2021-04-27  1099  	case V4L2_CID_FLASH_LED_MODE:		return "LED Mode";
71c689dc2e732d Hans Verkuil          2021-04-27  1100  	case V4L2_CID_FLASH_STROBE_SOURCE:	return "Strobe Source";
71c689dc2e732d Hans Verkuil          2021-04-27  1101  	case V4L2_CID_FLASH_STROBE:		return "Strobe";
71c689dc2e732d Hans Verkuil          2021-04-27  1102  	case V4L2_CID_FLASH_STROBE_STOP:	return "Stop Strobe";
71c689dc2e732d Hans Verkuil          2021-04-27  1103  	case V4L2_CID_FLASH_STROBE_STATUS:	return "Strobe Status";
71c689dc2e732d Hans Verkuil          2021-04-27  1104  	case V4L2_CID_FLASH_TIMEOUT:		return "Strobe Timeout";
71c689dc2e732d Hans Verkuil          2021-04-27  1105  	case V4L2_CID_FLASH_INTENSITY:		return "Intensity, Flash Mode";
71c689dc2e732d Hans Verkuil          2021-04-27  1106  	case V4L2_CID_FLASH_TORCH_INTENSITY:	return "Intensity, Torch Mode";
71c689dc2e732d Hans Verkuil          2021-04-27  1107  	case V4L2_CID_FLASH_INDICATOR_INTENSITY: return "Intensity, Indicator";
71c689dc2e732d Hans Verkuil          2021-04-27  1108  	case V4L2_CID_FLASH_FAULT:		return "Faults";
71c689dc2e732d Hans Verkuil          2021-04-27  1109  	case V4L2_CID_FLASH_CHARGE:		return "Charge";
71c689dc2e732d Hans Verkuil          2021-04-27  1110  	case V4L2_CID_FLASH_READY:		return "Ready to Strobe";
71c689dc2e732d Hans Verkuil          2021-04-27  1111  
71c689dc2e732d Hans Verkuil          2021-04-27  1112  	/* JPEG encoder controls */
71c689dc2e732d Hans Verkuil          2021-04-27  1113  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
71c689dc2e732d Hans Verkuil          2021-04-27  1114  	case V4L2_CID_JPEG_CLASS:		return "JPEG Compression Controls";
71c689dc2e732d Hans Verkuil          2021-04-27  1115  	case V4L2_CID_JPEG_CHROMA_SUBSAMPLING:	return "Chroma Subsampling";
71c689dc2e732d Hans Verkuil          2021-04-27  1116  	case V4L2_CID_JPEG_RESTART_INTERVAL:	return "Restart Interval";
71c689dc2e732d Hans Verkuil          2021-04-27  1117  	case V4L2_CID_JPEG_COMPRESSION_QUALITY:	return "Compression Quality";
71c689dc2e732d Hans Verkuil          2021-04-27  1118  	case V4L2_CID_JPEG_ACTIVE_MARKER:	return "Active Markers";
71c689dc2e732d Hans Verkuil          2021-04-27  1119  
71c689dc2e732d Hans Verkuil          2021-04-27  1120  	/* Image source controls */
71c689dc2e732d Hans Verkuil          2021-04-27  1121  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
71c689dc2e732d Hans Verkuil          2021-04-27  1122  	case V4L2_CID_IMAGE_SOURCE_CLASS:	return "Image Source Controls";
71c689dc2e732d Hans Verkuil          2021-04-27  1123  	case V4L2_CID_VBLANK:			return "Vertical Blanking";
71c689dc2e732d Hans Verkuil          2021-04-27  1124  	case V4L2_CID_HBLANK:			return "Horizontal Blanking";
71c689dc2e732d Hans Verkuil          2021-04-27  1125  	case V4L2_CID_ANALOGUE_GAIN:		return "Analogue Gain";
71c689dc2e732d Hans Verkuil          2021-04-27  1126  	case V4L2_CID_TEST_PATTERN_RED:		return "Red Pixel Value";
71c689dc2e732d Hans Verkuil          2021-04-27  1127  	case V4L2_CID_TEST_PATTERN_GREENR:	return "Green (Red) Pixel Value";
71c689dc2e732d Hans Verkuil          2021-04-27  1128  	case V4L2_CID_TEST_PATTERN_BLUE:	return "Blue Pixel Value";
71c689dc2e732d Hans Verkuil          2021-04-27  1129  	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
a9c80593ff80dd David Plowman         2021-08-16  1130  	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
71c689dc2e732d Hans Verkuil          2021-04-27  1131  
71c689dc2e732d Hans Verkuil          2021-04-27  1132  	/* Image processing controls */
71c689dc2e732d Hans Verkuil          2021-04-27  1133  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
71c689dc2e732d Hans Verkuil          2021-04-27  1134  	case V4L2_CID_IMAGE_PROC_CLASS:		return "Image Processing Controls";
71c689dc2e732d Hans Verkuil          2021-04-27  1135  	case V4L2_CID_LINK_FREQ:		return "Link Frequency";
71c689dc2e732d Hans Verkuil          2021-04-27  1136  	case V4L2_CID_PIXEL_RATE:		return "Pixel Rate";
71c689dc2e732d Hans Verkuil          2021-04-27  1137  	case V4L2_CID_TEST_PATTERN:		return "Test Pattern";
71c689dc2e732d Hans Verkuil          2021-04-27  1138  	case V4L2_CID_DEINTERLACING_MODE:	return "Deinterlacing Mode";
71c689dc2e732d Hans Verkuil          2021-04-27  1139  	case V4L2_CID_DIGITAL_GAIN:		return "Digital Gain";
71c689dc2e732d Hans Verkuil          2021-04-27  1140  
71c689dc2e732d Hans Verkuil          2021-04-27  1141  	/* DV controls */
71c689dc2e732d Hans Verkuil          2021-04-27  1142  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
71c689dc2e732d Hans Verkuil          2021-04-27  1143  	case V4L2_CID_DV_CLASS:			return "Digital Video Controls";
71c689dc2e732d Hans Verkuil          2021-04-27  1144  	case V4L2_CID_DV_TX_HOTPLUG:		return "Hotplug Present";
71c689dc2e732d Hans Verkuil          2021-04-27  1145  	case V4L2_CID_DV_TX_RXSENSE:		return "RxSense Present";
71c689dc2e732d Hans Verkuil          2021-04-27  1146  	case V4L2_CID_DV_TX_EDID_PRESENT:	return "EDID Present";
71c689dc2e732d Hans Verkuil          2021-04-27  1147  	case V4L2_CID_DV_TX_MODE:		return "Transmit Mode";
71c689dc2e732d Hans Verkuil          2021-04-27  1148  	case V4L2_CID_DV_TX_RGB_RANGE:		return "Tx RGB Quantization Range";
71c689dc2e732d Hans Verkuil          2021-04-27  1149  	case V4L2_CID_DV_TX_IT_CONTENT_TYPE:	return "Tx IT Content Type";
71c689dc2e732d Hans Verkuil          2021-04-27  1150  	case V4L2_CID_DV_RX_POWER_PRESENT:	return "Power Present";
71c689dc2e732d Hans Verkuil          2021-04-27  1151  	case V4L2_CID_DV_RX_RGB_RANGE:		return "Rx RGB Quantization Range";
71c689dc2e732d Hans Verkuil          2021-04-27  1152  	case V4L2_CID_DV_RX_IT_CONTENT_TYPE:	return "Rx IT Content Type";
71c689dc2e732d Hans Verkuil          2021-04-27  1153  
71c689dc2e732d Hans Verkuil          2021-04-27  1154  	case V4L2_CID_FM_RX_CLASS:		return "FM Radio Receiver Controls";
71c689dc2e732d Hans Verkuil          2021-04-27  1155  	case V4L2_CID_TUNE_DEEMPHASIS:		return "De-Emphasis";
71c689dc2e732d Hans Verkuil          2021-04-27  1156  	case V4L2_CID_RDS_RECEPTION:		return "RDS Reception";
71c689dc2e732d Hans Verkuil          2021-04-27  1157  	case V4L2_CID_RF_TUNER_CLASS:		return "RF Tuner Controls";
71c689dc2e732d Hans Verkuil          2021-04-27  1158  	case V4L2_CID_RF_TUNER_RF_GAIN:		return "RF Gain";
71c689dc2e732d Hans Verkuil          2021-04-27  1159  	case V4L2_CID_RF_TUNER_LNA_GAIN_AUTO:	return "LNA Gain, Auto";
71c689dc2e732d Hans Verkuil          2021-04-27  1160  	case V4L2_CID_RF_TUNER_LNA_GAIN:	return "LNA Gain";
71c689dc2e732d Hans Verkuil          2021-04-27  1161  	case V4L2_CID_RF_TUNER_MIXER_GAIN_AUTO:	return "Mixer Gain, Auto";
71c689dc2e732d Hans Verkuil          2021-04-27  1162  	case V4L2_CID_RF_TUNER_MIXER_GAIN:	return "Mixer Gain";
71c689dc2e732d Hans Verkuil          2021-04-27  1163  	case V4L2_CID_RF_TUNER_IF_GAIN_AUTO:	return "IF Gain, Auto";
71c689dc2e732d Hans Verkuil          2021-04-27  1164  	case V4L2_CID_RF_TUNER_IF_GAIN:		return "IF Gain";
71c689dc2e732d Hans Verkuil          2021-04-27  1165  	case V4L2_CID_RF_TUNER_BANDWIDTH_AUTO:	return "Bandwidth, Auto";
71c689dc2e732d Hans Verkuil          2021-04-27  1166  	case V4L2_CID_RF_TUNER_BANDWIDTH:	return "Bandwidth";
71c689dc2e732d Hans Verkuil          2021-04-27  1167  	case V4L2_CID_RF_TUNER_PLL_LOCK:	return "PLL Lock";
71c689dc2e732d Hans Verkuil          2021-04-27  1168  	case V4L2_CID_RDS_RX_PTY:		return "RDS Program Type";
71c689dc2e732d Hans Verkuil          2021-04-27  1169  	case V4L2_CID_RDS_RX_PS_NAME:		return "RDS PS Name";
71c689dc2e732d Hans Verkuil          2021-04-27  1170  	case V4L2_CID_RDS_RX_RADIO_TEXT:	return "RDS Radio Text";
71c689dc2e732d Hans Verkuil          2021-04-27  1171  	case V4L2_CID_RDS_RX_TRAFFIC_ANNOUNCEMENT: return "RDS Traffic Announcement";
71c689dc2e732d Hans Verkuil          2021-04-27  1172  	case V4L2_CID_RDS_RX_TRAFFIC_PROGRAM:	return "RDS Traffic Program";
71c689dc2e732d Hans Verkuil          2021-04-27  1173  	case V4L2_CID_RDS_RX_MUSIC_SPEECH:	return "RDS Music";
71c689dc2e732d Hans Verkuil          2021-04-27  1174  
71c689dc2e732d Hans Verkuil          2021-04-27  1175  	/* Detection controls */
71c689dc2e732d Hans Verkuil          2021-04-27  1176  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
71c689dc2e732d Hans Verkuil          2021-04-27  1177  	case V4L2_CID_DETECT_CLASS:		return "Detection Controls";
71c689dc2e732d Hans Verkuil          2021-04-27  1178  	case V4L2_CID_DETECT_MD_MODE:		return "Motion Detection Mode";
71c689dc2e732d Hans Verkuil          2021-04-27  1179  	case V4L2_CID_DETECT_MD_GLOBAL_THRESHOLD: return "MD Global Threshold";
71c689dc2e732d Hans Verkuil          2021-04-27  1180  	case V4L2_CID_DETECT_MD_THRESHOLD_GRID:	return "MD Threshold Grid";
71c689dc2e732d Hans Verkuil          2021-04-27  1181  	case V4L2_CID_DETECT_MD_REGION_GRID:	return "MD Region Grid";
71c689dc2e732d Hans Verkuil          2021-04-27  1182  
71c689dc2e732d Hans Verkuil          2021-04-27  1183  	/* Stateless Codec controls */
71c689dc2e732d Hans Verkuil          2021-04-27  1184  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
71c689dc2e732d Hans Verkuil          2021-04-27  1185  	case V4L2_CID_CODEC_STATELESS_CLASS:	return "Stateless Codec Controls";
71c689dc2e732d Hans Verkuil          2021-04-27  1186  	case V4L2_CID_STATELESS_H264_DECODE_MODE:		return "H264 Decode Mode";
71c689dc2e732d Hans Verkuil          2021-04-27  1187  	case V4L2_CID_STATELESS_H264_START_CODE:		return "H264 Start Code";
71c689dc2e732d Hans Verkuil          2021-04-27  1188  	case V4L2_CID_STATELESS_H264_SPS:			return "H264 Sequence Parameter Set";
71c689dc2e732d Hans Verkuil          2021-04-27  1189  	case V4L2_CID_STATELESS_H264_PPS:			return "H264 Picture Parameter Set";
71c689dc2e732d Hans Verkuil          2021-04-27  1190  	case V4L2_CID_STATELESS_H264_SCALING_MATRIX:		return "H264 Scaling Matrix";
71c689dc2e732d Hans Verkuil          2021-04-27  1191  	case V4L2_CID_STATELESS_H264_PRED_WEIGHTS:		return "H264 Prediction Weight Table";
71c689dc2e732d Hans Verkuil          2021-04-27  1192  	case V4L2_CID_STATELESS_H264_SLICE_PARAMS:		return "H264 Slice Parameters";
71c689dc2e732d Hans Verkuil          2021-04-27  1193  	case V4L2_CID_STATELESS_H264_DECODE_PARAMS:		return "H264 Decode Parameters";
71c689dc2e732d Hans Verkuil          2021-04-27  1194  	case V4L2_CID_STATELESS_FWHT_PARAMS:			return "FWHT Stateless Parameters";
71c689dc2e732d Hans Verkuil          2021-04-27  1195  	case V4L2_CID_STATELESS_VP8_FRAME:			return "VP8 Frame Parameters";
71c689dc2e732d Hans Verkuil          2021-04-27  1196  	case V4L2_CID_STATELESS_MPEG2_SEQUENCE:			return "MPEG-2 Sequence Header";
71c689dc2e732d Hans Verkuil          2021-04-27  1197  	case V4L2_CID_STATELESS_MPEG2_PICTURE:			return "MPEG-2 Picture Header";
71c689dc2e732d Hans Verkuil          2021-04-27  1198  	case V4L2_CID_STATELESS_MPEG2_QUANTISATION:		return "MPEG-2 Quantisation Matrices";
b88dbe38dca824 Andrzej Pietrasiewicz 2021-11-16  1199  	case V4L2_CID_STATELESS_VP9_COMPRESSED_HDR:	return "VP9 Probabilities Updates";
b88dbe38dca824 Andrzej Pietrasiewicz 2021-11-16  1200  	case V4L2_CID_STATELESS_VP9_FRAME:			return "VP9 Frame Decode Parameters";
b92de2f91821ce Benjamin Gaignard     2022-07-08  1201  	case V4L2_CID_STATELESS_HEVC_SPS:			return "HEVC Sequence Parameter Set";
b92de2f91821ce Benjamin Gaignard     2022-07-08  1202  	case V4L2_CID_STATELESS_HEVC_PPS:			return "HEVC Picture Parameter Set";
b92de2f91821ce Benjamin Gaignard     2022-07-08  1203  	case V4L2_CID_STATELESS_HEVC_SLICE_PARAMS:		return "HEVC Slice Parameters";
b92de2f91821ce Benjamin Gaignard     2022-07-08  1204  	case V4L2_CID_STATELESS_HEVC_SCALING_MATRIX:		return "HEVC Scaling Matrix";
b92de2f91821ce Benjamin Gaignard     2022-07-08  1205  	case V4L2_CID_STATELESS_HEVC_DECODE_PARAMS:		return "HEVC Decode Parameters";
b92de2f91821ce Benjamin Gaignard     2022-07-08  1206  	case V4L2_CID_STATELESS_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
b92de2f91821ce Benjamin Gaignard     2022-07-08  1207  	case V4L2_CID_STATELESS_HEVC_START_CODE:		return "HEVC Start Code";
311027bd13eb67 Benjamin Gaignard     2022-07-08  1208  	case V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS:	return "HEVC Entry Point Offsets";
71c689dc2e732d Hans Verkuil          2021-04-27  1209  
71c689dc2e732d Hans Verkuil          2021-04-27  1210  	/* Colorimetry controls */
71c689dc2e732d Hans Verkuil          2021-04-27  1211  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
71c689dc2e732d Hans Verkuil          2021-04-27  1212  	case V4L2_CID_COLORIMETRY_CLASS:	return "Colorimetry Controls";
71c689dc2e732d Hans Verkuil          2021-04-27  1213  	case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:		return "HDR10 Content Light Info";
71c689dc2e732d Hans Verkuil          2021-04-27 @1214  	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:	return "HDR10 Mastering Display";
71c689dc2e732d Hans Verkuil          2021-04-27  1215  	default:
71c689dc2e732d Hans Verkuil          2021-04-27  1216  		return NULL;
71c689dc2e732d Hans Verkuil          2021-04-27  1217  	}
71c689dc2e732d Hans Verkuil          2021-04-27  1218  }
71c689dc2e732d Hans Verkuil          2021-04-27  1219  EXPORT_SYMBOL(v4l2_ctrl_get_name);
71c689dc2e732d Hans Verkuil          2021-04-27  1220  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
