Content-Type: multipart/mixed; boundary="===============2311156210104292809=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/pci/hda/hda_generic.c:198 parse_user_hints() warn: assigning (-2) to unsigned variable 'spec->mixer_nid'
Date: Fri, 02 Sep 2022 18:51:06 +0800
Message-ID: <202209021827.PAUqELiy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2311156210104292809==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Cezary Rojewski <cezary.rojewski@intel.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   42e66b1cc3a070671001f8a1e933a80818a192bf
commit: b5df2a7dca1cc6c66eee0005c92094855dc2028c ASoC: codecs: Add HD-Audio=
 codec driver
date:   3 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 3 months ago
config: microblaze-randconfig-m041-20220901 (https://download.01.org/0day-c=
i/archive/20220902/202209021827.PAUqELiy-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/pci/hda/hda_generic.c:198 parse_user_hints() warn: assigning (-2) to =
unsigned variable 'spec->mixer_nid'

vim +198 sound/pci/hda/hda_generic.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  101  =

1c70a583417e8d Takashi Iwai   2013-01-11  102  /*
1c70a583417e8d Takashi Iwai   2013-01-11  103   * store user hints
1c70a583417e8d Takashi Iwai   2013-01-11  104   */
1c70a583417e8d Takashi Iwai   2013-01-11  105  static void parse_user_hints=
(struct hda_codec *codec)
1c70a583417e8d Takashi Iwai   2013-01-11  106  {
1c70a583417e8d Takashi Iwai   2013-01-11  107  	struct hda_gen_spec *spec =
=3D codec->spec;
1c70a583417e8d Takashi Iwai   2013-01-11  108  	int val;
1c70a583417e8d Takashi Iwai   2013-01-11  109  =

1c70a583417e8d Takashi Iwai   2013-01-11  110  	val =3D snd_hda_get_bool_hi=
nt(codec, "jack_detect");
1c70a583417e8d Takashi Iwai   2013-01-11  111  	if (val >=3D 0)
1c70a583417e8d Takashi Iwai   2013-01-11  112  		codec->no_jack_detect =3D =
!val;
1c70a583417e8d Takashi Iwai   2013-01-11  113  	val =3D snd_hda_get_bool_hi=
nt(codec, "inv_jack_detect");
1c70a583417e8d Takashi Iwai   2013-01-11  114  	if (val >=3D 0)
1c70a583417e8d Takashi Iwai   2013-01-11  115  		codec->inv_jack_detect =3D=
 !!val;
1c70a583417e8d Takashi Iwai   2013-01-11  116  	val =3D snd_hda_get_bool_hi=
nt(codec, "trigger_sense");
1c70a583417e8d Takashi Iwai   2013-01-11  117  	if (val >=3D 0)
1c70a583417e8d Takashi Iwai   2013-01-11  118  		codec->no_trigger_sense =
=3D !val;
1c70a583417e8d Takashi Iwai   2013-01-11  119  	val =3D snd_hda_get_bool_hi=
nt(codec, "inv_eapd");
1c70a583417e8d Takashi Iwai   2013-01-11  120  	if (val >=3D 0)
1c70a583417e8d Takashi Iwai   2013-01-11  121  		codec->inv_eapd =3D !!val;
1c70a583417e8d Takashi Iwai   2013-01-11  122  	val =3D snd_hda_get_bool_hi=
nt(codec, "pcm_format_first");
1c70a583417e8d Takashi Iwai   2013-01-11  123  	if (val >=3D 0)
1c70a583417e8d Takashi Iwai   2013-01-11  124  		codec->pcm_format_first =
=3D !!val;
1c70a583417e8d Takashi Iwai   2013-01-11  125  	val =3D snd_hda_get_bool_hi=
nt(codec, "sticky_stream");
1c70a583417e8d Takashi Iwai   2013-01-11  126  	if (val >=3D 0)
1c70a583417e8d Takashi Iwai   2013-01-11  127  		codec->no_sticky_stream =
=3D !val;
1c70a583417e8d Takashi Iwai   2013-01-11  128  	val =3D snd_hda_get_bool_hi=
nt(codec, "spdif_status_reset");
1c70a583417e8d Takashi Iwai   2013-01-11  129  	if (val >=3D 0)
1c70a583417e8d Takashi Iwai   2013-01-11  130  		codec->spdif_status_reset =
=3D !!val;
1c70a583417e8d Takashi Iwai   2013-01-11  131  	val =3D snd_hda_get_bool_hi=
nt(codec, "pin_amp_workaround");
1c70a583417e8d Takashi Iwai   2013-01-11  132  	if (val >=3D 0)
1c70a583417e8d Takashi Iwai   2013-01-11  133  		codec->pin_amp_workaround =
=3D !!val;
1c70a583417e8d Takashi Iwai   2013-01-11  134  	val =3D snd_hda_get_bool_hi=
nt(codec, "single_adc_amp");
1c70a583417e8d Takashi Iwai   2013-01-11  135  	if (val >=3D 0)
1c70a583417e8d Takashi Iwai   2013-01-11  136  		codec->single_adc_amp =3D =
!!val;
967b1307b69b8a Takashi Iwai   2015-03-20  137  	val =3D snd_hda_get_bool_hi=
nt(codec, "power_save_node");
e6feb5d08509be Takashi Iwai   2015-03-16  138  	if (val >=3D 0)
967b1307b69b8a Takashi Iwai   2015-03-20  139  		codec->power_save_node =3D=
 !!val;
1c70a583417e8d Takashi Iwai   2013-01-11  140  =

f72706be354b35 Takashi Iwai   2013-01-16  141  	val =3D snd_hda_get_bool_hi=
nt(codec, "auto_mute");
f72706be354b35 Takashi Iwai   2013-01-16  142  	if (val >=3D 0)
f72706be354b35 Takashi Iwai   2013-01-16  143  		spec->suppress_auto_mute =
=3D !val;
1c70a583417e8d Takashi Iwai   2013-01-11  144  	val =3D snd_hda_get_bool_hi=
nt(codec, "auto_mic");
1c70a583417e8d Takashi Iwai   2013-01-11  145  	if (val >=3D 0)
1c70a583417e8d Takashi Iwai   2013-01-11  146  		spec->suppress_auto_mic =
=3D !val;
1c70a583417e8d Takashi Iwai   2013-01-11  147  	val =3D snd_hda_get_bool_hi=
nt(codec, "line_in_auto_switch");
1c70a583417e8d Takashi Iwai   2013-01-11  148  	if (val >=3D 0)
1c70a583417e8d Takashi Iwai   2013-01-11  149  		spec->line_in_auto_switch =
=3D !!val;
7eebffd3f4328c Takashi Iwai   2013-06-24  150  	val =3D snd_hda_get_bool_hi=
nt(codec, "auto_mute_via_amp");
7eebffd3f4328c Takashi Iwai   2013-06-24  151  	if (val >=3D 0)
7eebffd3f4328c Takashi Iwai   2013-06-24  152  		spec->auto_mute_via_amp =
=3D !!val;
1c70a583417e8d Takashi Iwai   2013-01-11  153  	val =3D snd_hda_get_bool_hi=
nt(codec, "need_dac_fix");
1c70a583417e8d Takashi Iwai   2013-01-11  154  	if (val >=3D 0)
1c70a583417e8d Takashi Iwai   2013-01-11  155  		spec->need_dac_fix =3D !!v=
al;
1c70a583417e8d Takashi Iwai   2013-01-11  156  	val =3D snd_hda_get_bool_hi=
nt(codec, "primary_hp");
1c70a583417e8d Takashi Iwai   2013-01-11  157  	if (val >=3D 0)
1c70a583417e8d Takashi Iwai   2013-01-11  158  		spec->no_primary_hp =3D !v=
al;
da96fb5b0185d2 Takashi Iwai   2013-07-29  159  	val =3D snd_hda_get_bool_hi=
nt(codec, "multi_io");
da96fb5b0185d2 Takashi Iwai   2013-07-29  160  	if (val >=3D 0)
da96fb5b0185d2 Takashi Iwai   2013-07-29  161  		spec->no_multi_io =3D !val;
1c70a583417e8d Takashi Iwai   2013-01-11  162  	val =3D snd_hda_get_bool_hi=
nt(codec, "multi_cap_vol");
1c70a583417e8d Takashi Iwai   2013-01-11  163  	if (val >=3D 0)
1c70a583417e8d Takashi Iwai   2013-01-11  164  		spec->multi_cap_vol =3D !!=
val;
1c70a583417e8d Takashi Iwai   2013-01-11  165  	val =3D snd_hda_get_bool_hi=
nt(codec, "inv_dmic_split");
1c70a583417e8d Takashi Iwai   2013-01-11  166  	if (val >=3D 0)
1c70a583417e8d Takashi Iwai   2013-01-11  167  		spec->inv_dmic_split =3D !=
!val;
1c70a583417e8d Takashi Iwai   2013-01-11  168  	val =3D snd_hda_get_bool_hi=
nt(codec, "indep_hp");
1c70a583417e8d Takashi Iwai   2013-01-11  169  	if (val >=3D 0)
1c70a583417e8d Takashi Iwai   2013-01-11  170  		spec->indep_hp =3D !!val;
1c70a583417e8d Takashi Iwai   2013-01-11  171  	val =3D snd_hda_get_bool_hi=
nt(codec, "add_stereo_mix_input");
1c70a583417e8d Takashi Iwai   2013-01-11  172  	if (val >=3D 0)
1c70a583417e8d Takashi Iwai   2013-01-11  173  		spec->add_stereo_mix_input=
 =3D !!val;
f811c3cf8fae63 Takashi Iwai   2013-03-07  174  	/* the following two are ju=
st for compatibility */
1c70a583417e8d Takashi Iwai   2013-01-11  175  	val =3D snd_hda_get_bool_hi=
nt(codec, "add_out_jack_modes");
1c70a583417e8d Takashi Iwai   2013-01-11  176  	if (val >=3D 0)
f811c3cf8fae63 Takashi Iwai   2013-03-07  177  		spec->add_jack_modes =3D !=
!val;
29476558deb301 Takashi Iwai   2013-01-17  178  	val =3D snd_hda_get_bool_hi=
nt(codec, "add_in_jack_modes");
29476558deb301 Takashi Iwai   2013-01-17  179  	if (val >=3D 0)
f811c3cf8fae63 Takashi Iwai   2013-03-07  180  		spec->add_jack_modes =3D !=
!val;
f811c3cf8fae63 Takashi Iwai   2013-03-07  181  	val =3D snd_hda_get_bool_hi=
nt(codec, "add_jack_modes");
f811c3cf8fae63 Takashi Iwai   2013-03-07  182  	if (val >=3D 0)
f811c3cf8fae63 Takashi Iwai   2013-03-07  183  		spec->add_jack_modes =3D !=
!val;
55196fffc95105 Takashi Iwai   2013-01-24  184  	val =3D snd_hda_get_bool_hi=
nt(codec, "power_down_unused");
55196fffc95105 Takashi Iwai   2013-01-24  185  	if (val >=3D 0)
55196fffc95105 Takashi Iwai   2013-01-24  186  		spec->power_down_unused =
=3D !!val;
967303dabc2233 Takashi Iwai   2013-02-19  187  	val =3D snd_hda_get_bool_hi=
nt(codec, "add_hp_mic");
967303dabc2233 Takashi Iwai   2013-02-19  188  	if (val >=3D 0)
967303dabc2233 Takashi Iwai   2013-02-19  189  		spec->hp_mic =3D !!val;
967303dabc2233 Takashi Iwai   2013-02-19  190  	val =3D snd_hda_get_bool_hi=
nt(codec, "hp_mic_detect");
967303dabc2233 Takashi Iwai   2013-02-19  191  	if (val >=3D 0)
967303dabc2233 Takashi Iwai   2013-02-19  192  		spec->suppress_hp_mic_dete=
ct =3D !val;
7480316c265c9f Takashi Iwai   2017-04-10  193  	val =3D snd_hda_get_bool_hi=
nt(codec, "vmaster");
7480316c265c9f Takashi Iwai   2017-04-10  194  	if (val >=3D 0)
7480316c265c9f Takashi Iwai   2017-04-10  195  		spec->suppress_vmaster =3D=
 !val;
1c70a583417e8d Takashi Iwai   2013-01-11  196  =

1c70a583417e8d Takashi Iwai   2013-01-11  197  	if (!snd_hda_get_int_hint(c=
odec, "mixer_nid", &val))
1c70a583417e8d Takashi Iwai   2013-01-11 @198  		spec->mixer_nid =3D val;
1c70a583417e8d Takashi Iwai   2013-01-11  199  }
1c70a583417e8d Takashi Iwai   2013-01-11  200  =


:::::: The code at line 198 was first introduced by commit
:::::: 1c70a583417e8db1e1d5069d7651ba294e9499de ALSA: hda - Allow user to g=
ive hints for codec parser behavior

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2311156210104292809==--

