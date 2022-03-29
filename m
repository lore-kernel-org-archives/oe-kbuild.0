Content-Type: multipart/mixed; boundary="===============2613052047714483474=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Fix audio regression on Mi Notebook Pro 2020
Date: Tue, 29 Mar 2022 18:18:13 +0800
Message-ID: <202203291807.UCLuP6Fi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2613052047714483474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220329001845.776776-1-kai.heng.feng@canonical.com>
References: <20220329001845.776776-1-kai.heng.feng@canonical.com>
TO: "Kai-Heng Feng" <kai.heng.feng@canonical.com>
TO: tiwai(a)suse.com
CC: "Kai-Heng Feng" <kai.heng.feng@canonical.com>
CC: Jaroslav Kysela <perex@perex.cz>
CC: Jeremy Szu <jeremy.szu@canonical.com>
CC: Werner Sembach <wse@tuxedocomputers.com>
CC: Hui Wang <hui.wang@canonical.com>
CC: Lucas Tanure <tanureal@opensource.cirrus.com>
CC: Cameron Berkenpas <cam@neo-zeon.de>
CC: Kailang Yang <kailang@realtek.com>
CC: Sami Loone <sami@loone.fi>
CC: alsa-devel(a)alsa-project.org
CC: linux-kernel(a)vger.kernel.org

Hi Kai-Heng,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on v5.17 next-20220329]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Kai-Heng-Feng/ALSA-h=
da-realtek-Fix-audio-regression-on-Mi-Notebook-Pro-2020/20220329-082021
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for=
-next
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: xtensa-randconfig-m031-20220327 (https://download.01.org/0day-ci/ar=
chive/20220329/202203291807.UCLuP6Fi-lkp(a)intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/pci/hda/patch_realtek.c:3620 alc256_shutup() warn: was && intended he=
re instead of ||?

vim +3620 sound/pci/hda/patch_realtek.c

4a219ef8f37071 Kailang Yang  2017-06-16  3594  =

4a219ef8f37071 Kailang Yang  2017-06-16  3595  static void alc256_shutup(st=
ruct hda_codec *codec)
4a219ef8f37071 Kailang Yang  2017-06-16  3596  {
4a219ef8f37071 Kailang Yang  2017-06-16  3597  	struct alc_spec *spec =3D c=
odec->spec;
35a39f98567d8d Takashi Iwai  2019-02-01  3598  	hda_nid_t hp_pin =3D alc_ge=
t_hp_pin(spec);
4a219ef8f37071 Kailang Yang  2017-06-16  3599  	bool hp_pin_sense;
4a219ef8f37071 Kailang Yang  2017-06-16  3600  =

6447c962bc47a5 Kailang Yang  2019-05-08  3601  	if (!hp_pin)
6447c962bc47a5 Kailang Yang  2019-05-08  3602  		hp_pin =3D 0x21;
4a219ef8f37071 Kailang Yang  2017-06-16  3603  =

4a219ef8f37071 Kailang Yang  2017-06-16  3604  	hp_pin_sense =3D snd_hda_ja=
ck_detect(codec, hp_pin);
4a219ef8f37071 Kailang Yang  2017-06-16  3605  =

4a219ef8f37071 Kailang Yang  2017-06-16  3606  	if (hp_pin_sense)
4a219ef8f37071 Kailang Yang  2017-06-16  3607  		msleep(2);
4a219ef8f37071 Kailang Yang  2017-06-16  3608  =

4a219ef8f37071 Kailang Yang  2017-06-16  3609  	snd_hda_codec_write(codec, =
hp_pin, 0,
4a219ef8f37071 Kailang Yang  2017-06-16  3610  			    AC_VERB_SET_AMP_GAIN_=
MUTE, AMP_OUT_MUTE);
4a219ef8f37071 Kailang Yang  2017-06-16  3611  =

6447c962bc47a5 Kailang Yang  2019-05-08  3612  	if (hp_pin_sense || spec->u=
ltra_low_power)
4a219ef8f37071 Kailang Yang  2017-06-16  3613  		msleep(85);
4a219ef8f37071 Kailang Yang  2017-06-16  3614  =

1c9609e3a8cf59 Takashi Iwai  2018-01-19  3615  	/* 3k pull low control for =
Headset jack. */
1c9609e3a8cf59 Takashi Iwai  2018-01-19  3616  	/* NOTE: call this before c=
learing the pin, otherwise codec stalls */
3f74249057827c Hui Wang      2020-09-14  3617  	/* If disable 3k pulldown c=
ontrol for alc257, the Mic detection will not work correctly
3f74249057827c Hui Wang      2020-09-14  3618  	 * when booting with headse=
t plugged. So skip setting it for the codec alc257
3f74249057827c Hui Wang      2020-09-14  3619  	 */
b86b7ea348ec9b Kai-Heng Feng 2022-03-29 @3620  	if (codec->core.vendor_id !=
=3D 0x10ec0236 ||
b86b7ea348ec9b Kai-Heng Feng 2022-03-29  3621  	    codec->core.vendor_id !=
=3D 0x10ec0257)
1c9609e3a8cf59 Takashi Iwai  2018-01-19  3622  		alc_update_coef_idx(codec,=
 0x46, 0, 3 << 12);
1c9609e3a8cf59 Takashi Iwai  2018-01-19  3623  =

c0ca5eced22215 Takashi Iwai  2019-02-20  3624  	if (!spec->no_shutup_pins)
4a219ef8f37071 Kailang Yang  2017-06-16  3625  		snd_hda_codec_write(codec,=
 hp_pin, 0,
4a219ef8f37071 Kailang Yang  2017-06-16  3626  				    AC_VERB_SET_PIN_WIDG=
ET_CONTROL, 0x0);
4a219ef8f37071 Kailang Yang  2017-06-16  3627  =

6447c962bc47a5 Kailang Yang  2019-05-08  3628  	if (hp_pin_sense || spec->u=
ltra_low_power)
4a219ef8f37071 Kailang Yang  2017-06-16  3629  		msleep(100);
4a219ef8f37071 Kailang Yang  2017-06-16  3630  =

4a219ef8f37071 Kailang Yang  2017-06-16  3631  	alc_auto_setup_eapd(codec, =
false);
c0ca5eced22215 Takashi Iwai  2019-02-20  3632  	alc_shutup_pins(codec);
6447c962bc47a5 Kailang Yang  2019-05-08  3633  	if (spec->ultra_low_power) {
6447c962bc47a5 Kailang Yang  2019-05-08  3634  		msleep(50);
6447c962bc47a5 Kailang Yang  2019-05-08  3635  		alc_update_coef_idx(codec,=
 0x03, 1<<1, 0);
6447c962bc47a5 Kailang Yang  2019-05-08  3636  		alc_update_coef_idx(codec,=
 0x08, 7<<4, 7<<4);
6447c962bc47a5 Kailang Yang  2019-05-08  3637  		alc_update_coef_idx(codec,=
 0x08, 3<<2, 0);
6447c962bc47a5 Kailang Yang  2019-05-08  3638  		alc_update_coef_idx(codec,=
 0x3b, 1<<15, 1<<15);
6447c962bc47a5 Kailang Yang  2019-05-08  3639  		alc_update_coef_idx(codec,=
 0x0e, 7<<6, 0);
6447c962bc47a5 Kailang Yang  2019-05-08  3640  		msleep(30);
6447c962bc47a5 Kailang Yang  2019-05-08  3641  	}
4a219ef8f37071 Kailang Yang  2017-06-16  3642  }
4a219ef8f37071 Kailang Yang  2017-06-16  3643  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2613052047714483474==--

