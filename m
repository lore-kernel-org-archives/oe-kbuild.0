Content-Type: multipart/mixed; boundary="===============8796997425589077707=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/sof/ipc4-topology.c:1143 sof_ipc4_prepare_copier_module() error: Calling ida_alloc_max() with a 'max' argument which is a power of 2. -1 missing?
Date: Thu, 11 Aug 2022 06:44:41 +0800
Message-ID: <202208110633.vYSBRTKf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8796997425589077707==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Bard Liao <yung-chuan.liao@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
CC: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f41445645ab5d172e6090d00c332c335d8dba337
commit: a150345aa758492e05d2934f318ce7c2566b1cfe ASoC: SOF: ipc4-topology: =
add SoundWire/ALH aggregation support
date:   8 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 weeks ago
config: i386-randconfig-m021-20220808 (https://download.01.org/0day-ci/arch=
ive/20220811/202208110633.vYSBRTKf-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/soc/sof/ipc4-topology.c:1143 sof_ipc4_prepare_copier_module() error: =
Calling ida_alloc_max() with a 'max' argument which is a power of 2. -1 mis=
sing?

vim +/max +1143 sound/soc/sof/ipc4-topology.c

aa84ffb721587d Ranjani Sridharan 2022-06-08   986  =

904c48c40c66c5 Ranjani Sridharan 2022-06-08   987  static int
904c48c40c66c5 Ranjani Sridharan 2022-06-08   988  sof_ipc4_prepare_copier_=
module(struct snd_sof_widget *swidget,
904c48c40c66c5 Ranjani Sridharan 2022-06-08   989  			       struct snd_pcm=
_hw_params *fe_params,
904c48c40c66c5 Ranjani Sridharan 2022-06-08   990  			       struct snd_sof=
_platform_stream_params *platform_params,
904c48c40c66c5 Ranjani Sridharan 2022-06-08   991  			       struct snd_pcm=
_hw_params *pipeline_params, int dir)
904c48c40c66c5 Ranjani Sridharan 2022-06-08   992  {
904c48c40c66c5 Ranjani Sridharan 2022-06-08   993  	struct sof_ipc4_availab=
le_audio_format *available_fmt;
904c48c40c66c5 Ranjani Sridharan 2022-06-08   994  	struct snd_soc_componen=
t *scomp =3D swidget->scomp;
904c48c40c66c5 Ranjani Sridharan 2022-06-08   995  	struct snd_sof_dev *sde=
v =3D snd_soc_component_get_drvdata(scomp);
904c48c40c66c5 Ranjani Sridharan 2022-06-08   996  	struct sof_ipc4_copier_=
data *copier_data;
904c48c40c66c5 Ranjani Sridharan 2022-06-08   997  	struct snd_pcm_hw_param=
s *ref_params;
904c48c40c66c5 Ranjani Sridharan 2022-06-08   998  	struct sof_ipc4_copier =
*ipc4_copier;
a150345aa75849 Bard Liao         2022-06-14   999  	struct snd_sof_dai *dai;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1000  	struct snd_mask *fmt;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1001  	int out_sample_valid_bi=
ts;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1002  	size_t ref_audio_fmt_si=
ze;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1003  	void **ipc_config_data;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1004  	int *ipc_config_size;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1005  	u32 **data;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1006  	int ipc_size, ret;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1007  =

904c48c40c66c5 Ranjani Sridharan 2022-06-08  1008  	dev_dbg(sdev->dev, "%s:=
 copier %s, type %d", __func__, swidget->widget->name, swidget->id);
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1009  =

904c48c40c66c5 Ranjani Sridharan 2022-06-08  1010  	switch (swidget->id) {
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1011  	case snd_soc_dapm_aif_i=
n:
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1012  	case snd_soc_dapm_aif_o=
ut:
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1013  	{
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1014  		struct sof_ipc4_gtw_at=
tributes *gtw_attr;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1015  		struct snd_sof_widget =
*pipe_widget;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1016  		struct sof_ipc4_pipeli=
ne *pipeline;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1017  =

904c48c40c66c5 Ranjani Sridharan 2022-06-08  1018  		pipe_widget =3D swidge=
t->pipe_widget;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1019  		pipeline =3D pipe_widg=
et->private;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1020  		ipc4_copier =3D (struc=
t sof_ipc4_copier *)swidget->private;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1021  		gtw_attr =3D ipc4_copi=
er->gtw_attr;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1022  		copier_data =3D &ipc4_=
copier->data;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1023  		available_fmt =3D &ipc=
4_copier->available_fmt;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1024  =

904c48c40c66c5 Ranjani Sridharan 2022-06-08  1025  		/*
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1026  		 * base_config->audio_=
fmt and out_audio_fmt represent the input and output audio
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1027  		 * formats. Use the in=
put format as the reference to match pcm params for playback
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1028  		 * and the output form=
at as reference for capture.
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1029  		 */
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1030  		if (dir =3D=3D SNDRV_P=
CM_STREAM_PLAYBACK) {
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1031  			available_fmt->ref_au=
dio_fmt =3D &available_fmt->base_config->audio_fmt;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1032  			ref_audio_fmt_size =
=3D sizeof(struct sof_ipc4_base_module_cfg);
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1033  		} else {
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1034  			available_fmt->ref_au=
dio_fmt =3D available_fmt->out_audio_fmt;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1035  			ref_audio_fmt_size =
=3D sizeof(struct sof_ipc4_audio_format);
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1036  		}
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1037  		copier_data->gtw_cfg.n=
ode_id &=3D ~SOF_IPC4_NODE_INDEX_MASK;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1038  		copier_data->gtw_cfg.n=
ode_id |=3D
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1039  			SOF_IPC4_NODE_INDEX(p=
latform_params->stream_tag - 1);
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1040  =

904c48c40c66c5 Ranjani Sridharan 2022-06-08  1041  		/* set gateway attribu=
tes */
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1042  		gtw_attr->lp_buffer_al=
loc =3D pipeline->lp_mode;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1043  		ref_params =3D fe_para=
ms;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1044  		break;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1045  	}
acf52594207721 Ranjani Sridharan 2022-06-08  1046  	case snd_soc_dapm_dai_i=
n:
acf52594207721 Ranjani Sridharan 2022-06-08  1047  	case snd_soc_dapm_dai_o=
ut:
acf52594207721 Ranjani Sridharan 2022-06-08  1048  	{
a150345aa75849 Bard Liao         2022-06-14  1049  		dai =3D swidget->priva=
te;
acf52594207721 Ranjani Sridharan 2022-06-08  1050  =

acf52594207721 Ranjani Sridharan 2022-06-08  1051  		ipc4_copier =3D (struc=
t sof_ipc4_copier *)dai->private;
acf52594207721 Ranjani Sridharan 2022-06-08  1052  		copier_data =3D &ipc4_=
copier->data;
acf52594207721 Ranjani Sridharan 2022-06-08  1053  		available_fmt =3D &ipc=
4_copier->available_fmt;
acf52594207721 Ranjani Sridharan 2022-06-08  1054  		if (dir =3D=3D SNDRV_P=
CM_STREAM_CAPTURE) {
acf52594207721 Ranjani Sridharan 2022-06-08  1055  			available_fmt->ref_au=
dio_fmt =3D available_fmt->out_audio_fmt;
acf52594207721 Ranjani Sridharan 2022-06-08  1056  			ref_audio_fmt_size =
=3D sizeof(struct sof_ipc4_audio_format);
acf52594207721 Ranjani Sridharan 2022-06-08  1057  =

acf52594207721 Ranjani Sridharan 2022-06-08  1058  			/*
acf52594207721 Ranjani Sridharan 2022-06-08  1059  			 * modify the input p=
arams for the dai copier as it only supports
acf52594207721 Ranjani Sridharan 2022-06-08  1060  			 * 32-bit always
acf52594207721 Ranjani Sridharan 2022-06-08  1061  			 */
acf52594207721 Ranjani Sridharan 2022-06-08  1062  			fmt =3D hw_param_mask=
(pipeline_params, SNDRV_PCM_HW_PARAM_FORMAT);
acf52594207721 Ranjani Sridharan 2022-06-08  1063  			snd_mask_none(fmt);
acf52594207721 Ranjani Sridharan 2022-06-08  1064  			snd_mask_set_format(f=
mt, SNDRV_PCM_FORMAT_S32_LE);
acf52594207721 Ranjani Sridharan 2022-06-08  1065  		} else {
acf52594207721 Ranjani Sridharan 2022-06-08  1066  			available_fmt->ref_au=
dio_fmt =3D &available_fmt->base_config->audio_fmt;
acf52594207721 Ranjani Sridharan 2022-06-08  1067  			ref_audio_fmt_size =
=3D sizeof(struct sof_ipc4_base_module_cfg);
acf52594207721 Ranjani Sridharan 2022-06-08  1068  		}
acf52594207721 Ranjani Sridharan 2022-06-08  1069  =

acf52594207721 Ranjani Sridharan 2022-06-08  1070  		ref_params =3D pipelin=
e_params;
acf52594207721 Ranjani Sridharan 2022-06-08  1071  =

aa84ffb721587d Ranjani Sridharan 2022-06-08  1072  		ret =3D snd_sof_get_nh=
lt_endpoint_data(sdev, dai, fe_params, ipc4_copier->dai_index,
aa84ffb721587d Ranjani Sridharan 2022-06-08  1073  						     ipc4_copier->=
dai_type, dir,
aa84ffb721587d Ranjani Sridharan 2022-06-08  1074  						     &ipc4_copier-=
>copier_config,
aa84ffb721587d Ranjani Sridharan 2022-06-08  1075  						     &copier_data-=
>gtw_cfg.config_length);
aa84ffb721587d Ranjani Sridharan 2022-06-08  1076  		if (ret < 0)
aa84ffb721587d Ranjani Sridharan 2022-06-08  1077  			return ret;
aa84ffb721587d Ranjani Sridharan 2022-06-08  1078  =

acf52594207721 Ranjani Sridharan 2022-06-08  1079  		break;
acf52594207721 Ranjani Sridharan 2022-06-08  1080  	}
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1081  	default:
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1082  		dev_err(sdev->dev, "un=
supported type %d for copier %s",
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1083  			swidget->id, swidget-=
>widget->name);
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1084  		return -EINVAL;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1085  	}
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1086  =

904c48c40c66c5 Ranjani Sridharan 2022-06-08  1087  	/* set input and output=
 audio formats */
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1088  	ret =3D sof_ipc4_init_a=
udio_fmt(sdev, swidget, &copier_data->base_config,
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1089  				      &copier_data->=
out_format, ref_params,
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1090  				      available_fmt,=
 ref_audio_fmt_size);
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1091  	if (ret < 0)
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1092  		return ret;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1093  =

a45a4d4390b7a5 Bard Liao         2022-06-08  1094  	switch (swidget->id) {
a45a4d4390b7a5 Bard Liao         2022-06-08  1095  	case snd_soc_dapm_dai_i=
n:
a45a4d4390b7a5 Bard Liao         2022-06-08  1096  	case snd_soc_dapm_dai_o=
ut:
a45a4d4390b7a5 Bard Liao         2022-06-08  1097  	{
a45a4d4390b7a5 Bard Liao         2022-06-08  1098  		/*
a45a4d4390b7a5 Bard Liao         2022-06-08  1099  		 * Only SOF_DAI_INTEL_=
ALH needs copier_data to set blob.
a45a4d4390b7a5 Bard Liao         2022-06-08  1100  		 * That's why only ALH=
 dai's blob is set after sof_ipc4_init_audio_fmt
a45a4d4390b7a5 Bard Liao         2022-06-08  1101  		 */
a45a4d4390b7a5 Bard Liao         2022-06-08  1102  		if (ipc4_copier->dai_t=
ype =3D=3D SOF_DAI_INTEL_ALH) {
a45a4d4390b7a5 Bard Liao         2022-06-08  1103  			struct sof_ipc4_alh_c=
onfiguration_blob *blob;
a150345aa75849 Bard Liao         2022-06-14  1104  			struct sof_ipc4_copie=
r_data *alh_data;
a150345aa75849 Bard Liao         2022-06-14  1105  			struct sof_ipc4_copie=
r *alh_copier;
a150345aa75849 Bard Liao         2022-06-14  1106  			struct snd_sof_widget=
 *w;
a150345aa75849 Bard Liao         2022-06-14  1107  			u32 ch_mask =3D 0;
a45a4d4390b7a5 Bard Liao         2022-06-08  1108  			u32 ch_map;
a45a4d4390b7a5 Bard Liao         2022-06-08  1109  			int i;
a45a4d4390b7a5 Bard Liao         2022-06-08  1110  =

a45a4d4390b7a5 Bard Liao         2022-06-08  1111  			blob =3D (struct sof_=
ipc4_alh_configuration_blob *)ipc4_copier->copier_config;
a150345aa75849 Bard Liao         2022-06-14  1112  =

a45a4d4390b7a5 Bard Liao         2022-06-08  1113  			blob->gw_attr.lp_buff=
er_alloc =3D 0;
a45a4d4390b7a5 Bard Liao         2022-06-08  1114  =

a45a4d4390b7a5 Bard Liao         2022-06-08  1115  			/* Get channel_mask f=
rom ch_map */
a45a4d4390b7a5 Bard Liao         2022-06-08  1116  			ch_map =3D copier_dat=
a->base_config.audio_fmt.ch_map;
a45a4d4390b7a5 Bard Liao         2022-06-08  1117  			for (i =3D 0; ch_map;=
 i++) {
a45a4d4390b7a5 Bard Liao         2022-06-08  1118  				if ((ch_map & 0xf) !=
=3D 0xf)
a150345aa75849 Bard Liao         2022-06-14  1119  					ch_mask |=3D BIT(i);
a45a4d4390b7a5 Bard Liao         2022-06-08  1120  				ch_map >>=3D 4;
a45a4d4390b7a5 Bard Liao         2022-06-08  1121  			}
a150345aa75849 Bard Liao         2022-06-14  1122  =

a150345aa75849 Bard Liao         2022-06-14  1123  			/*
a150345aa75849 Bard Liao         2022-06-14  1124  			 * Set each gtw_cfg.n=
ode_id to blob->alh_cfg.mapping[]
a150345aa75849 Bard Liao         2022-06-14  1125  			 * for all widgets wi=
th the same stream name
a150345aa75849 Bard Liao         2022-06-14  1126  			 */
a150345aa75849 Bard Liao         2022-06-14  1127  			i =3D 0;
a150345aa75849 Bard Liao         2022-06-14  1128  			list_for_each_entry(w=
, &sdev->widget_list, list) {
a150345aa75849 Bard Liao         2022-06-14  1129  				if (w->widget->sname=
 &&
a150345aa75849 Bard Liao         2022-06-14  1130  				    strcmp(w->widget=
->sname, swidget->widget->sname))
a150345aa75849 Bard Liao         2022-06-14  1131  					continue;
a150345aa75849 Bard Liao         2022-06-14  1132  =

a150345aa75849 Bard Liao         2022-06-14  1133  				dai =3D w->private;
a150345aa75849 Bard Liao         2022-06-14  1134  				alh_copier =3D (stru=
ct sof_ipc4_copier *)dai->private;
a150345aa75849 Bard Liao         2022-06-14  1135  				alh_data =3D &alh_co=
pier->data;
a150345aa75849 Bard Liao         2022-06-14  1136  				blob->alh_cfg.mappin=
g[i].alh_id =3D alh_data->gtw_cfg.node_id;
a150345aa75849 Bard Liao         2022-06-14  1137  				blob->alh_cfg.mappin=
g[i].channel_mask =3D ch_mask;
a150345aa75849 Bard Liao         2022-06-14  1138  				i++;
a150345aa75849 Bard Liao         2022-06-14  1139  			}
a150345aa75849 Bard Liao         2022-06-14  1140  			if (blob->alh_cfg.cou=
nt > 1) {
a150345aa75849 Bard Liao         2022-06-14  1141  				int group_id;
a150345aa75849 Bard Liao         2022-06-14  1142  =

a150345aa75849 Bard Liao         2022-06-14 @1143  				group_id =3D ida_all=
oc_max(&alh_group_ida, ALH_MULTI_GTW_COUNT,
a150345aa75849 Bard Liao         2022-06-14  1144  							 GFP_KERNEL);
a150345aa75849 Bard Liao         2022-06-14  1145  =

a150345aa75849 Bard Liao         2022-06-14  1146  				if (group_id < 0)
a150345aa75849 Bard Liao         2022-06-14  1147  					return group_id;
a150345aa75849 Bard Liao         2022-06-14  1148  =

a150345aa75849 Bard Liao         2022-06-14  1149  				/* add multi-gateway=
 base */
a150345aa75849 Bard Liao         2022-06-14  1150  				group_id +=3D ALH_MU=
LTI_GTW_BASE;
a150345aa75849 Bard Liao         2022-06-14  1151  				copier_data->gtw_cfg=
.node_id &=3D ~SOF_IPC4_NODE_INDEX_MASK;
a150345aa75849 Bard Liao         2022-06-14  1152  				copier_data->gtw_cfg=
.node_id |=3D SOF_IPC4_NODE_INDEX(group_id);
a150345aa75849 Bard Liao         2022-06-14  1153  			}
a45a4d4390b7a5 Bard Liao         2022-06-08  1154  		}
a45a4d4390b7a5 Bard Liao         2022-06-08  1155  	}
a45a4d4390b7a5 Bard Liao         2022-06-08  1156  	}
a45a4d4390b7a5 Bard Liao         2022-06-08  1157  =

904c48c40c66c5 Ranjani Sridharan 2022-06-08  1158  	/* modify the input par=
ams for the next widget */
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1159  	fmt =3D hw_param_mask(p=
ipeline_params, SNDRV_PCM_HW_PARAM_FORMAT);
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1160  	out_sample_valid_bits =
=3D
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1161  		SOF_IPC4_AUDIO_FORMAT_=
CFG_V_BIT_DEPTH(copier_data->out_format.fmt_cfg);
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1162  	snd_mask_none(fmt);
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1163  	switch (out_sample_vali=
d_bits) {
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1164  	case 16:
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1165  		snd_mask_set_format(fm=
t, SNDRV_PCM_FORMAT_S16_LE);
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1166  		break;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1167  	case 24:
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1168  		snd_mask_set_format(fm=
t, SNDRV_PCM_FORMAT_S24_LE);
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1169  		break;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1170  	case 32:
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1171  		snd_mask_set_format(fm=
t, SNDRV_PCM_FORMAT_S32_LE);
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1172  		break;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1173  	default:
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1174  		dev_err(sdev->dev, "in=
valid sample frame format %d\n",
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1175  			params_format(pipelin=
e_params));
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1176  		return -EINVAL;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1177  	}
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1178  =

904c48c40c66c5 Ranjani Sridharan 2022-06-08  1179  	/* set the gateway dma_=
buffer_size using the matched ID returned above */
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1180  	copier_data->gtw_cfg.dm=
a_buffer_size =3D available_fmt->dma_buffer_size[ret];
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1181  =

904c48c40c66c5 Ranjani Sridharan 2022-06-08  1182  	data =3D &ipc4_copier->=
copier_config;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1183  	ipc_config_size =3D &ip=
c4_copier->ipc_config_size;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1184  	ipc_config_data =3D &ip=
c4_copier->ipc_config_data;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1185  =

904c48c40c66c5 Ranjani Sridharan 2022-06-08  1186  	/* config_length is DWO=
RD based */
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1187  	ipc_size =3D sizeof(*co=
pier_data) + copier_data->gtw_cfg.config_length * 4;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1188  =

904c48c40c66c5 Ranjani Sridharan 2022-06-08  1189  	dev_dbg(sdev->dev, "cop=
ier %s, IPC size is %d", swidget->widget->name, ipc_size);
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1190  =

904c48c40c66c5 Ranjani Sridharan 2022-06-08  1191  	*ipc_config_data =3D kz=
alloc(ipc_size, GFP_KERNEL);
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1192  	if (!*ipc_config_data)
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1193  		return -ENOMEM;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1194  =

904c48c40c66c5 Ranjani Sridharan 2022-06-08  1195  	*ipc_config_size =3D ip=
c_size;
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1196  =

904c48c40c66c5 Ranjani Sridharan 2022-06-08  1197  	/* copy IPC data */
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1198  	memcpy(*ipc_config_data=
, (void *)copier_data, sizeof(*copier_data));
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1199  	if (copier_data->gtw_cf=
g.config_length)
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1200  		memcpy(*ipc_config_dat=
a + sizeof(*copier_data),
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1201  		       *data, copier_d=
ata->gtw_cfg.config_length * 4);
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1202  =

904c48c40c66c5 Ranjani Sridharan 2022-06-08  1203  	/* update pipeline memo=
ry usage */
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1204  	sof_ipc4_update_pipelin=
e_mem_usage(sdev, swidget, &copier_data->base_config);
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1205  =

904c48c40c66c5 Ranjani Sridharan 2022-06-08  1206  	/* assign instance ID */
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1207  	return sof_ipc4_widget_=
assign_instance_id(sdev, swidget);
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1208  }
904c48c40c66c5 Ranjani Sridharan 2022-06-08  1209  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8796997425589077707==--

