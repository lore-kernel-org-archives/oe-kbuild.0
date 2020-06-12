Content-Type: multipart/mixed; boundary="===============2462918546107919520=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-4.14 13/18] sound/soc/intel/boards/bdw-rt5677.c:155:23: warning: Local variable channels shadows outer variable
Date: Fri, 12 Jun 2020 09:13:15 +0800
Message-ID: <202006120958.RAGDYIQW%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2462918546107919520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-4.14
head:   ea6254296bd2050c3bed29cc96338cd03846675c
commit: f32c7f08a0f989caa0f178e64326e535fd5bf0f4 [13/18] BACKPORT: UPSTREAM=
: ASoC: bdw-rt5677: add channel constraint
:::::: branch date: 4 hours ago
:::::: commit date: 9 hours ago
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> sound/soc/intel/boards/bdw-rt5677.c:155:23: warning: Local variable chan=
nels shadows outer variable [shadowVar]
    struct snd_interval *channels =3D hw_param_interval(params,
                         ^
   sound/soc/intel/boards/bdw-rt5677.c:236:27: note: Shadowed declaration
   static const unsigned int channels[] =3D {
                             ^
   sound/soc/intel/boards/bdw-rt5677.c:155:23: note: Shadow variable
    struct snd_interval *channels =3D hw_param_interval(params,
                         ^

git remote add chrome-os https://chromium.googlesource.com/chromiumos/third=
_party/kernel
git remote update chrome-os
git checkout f32c7f08a0f989caa0f178e64326e535fd5bf0f4
vim +155 sound/soc/intel/boards/bdw-rt5677.c

55e59aa0525a46 Andy Shevchenko 2017-06-15  149  =

2d995e5dc283ad John Keeping    2016-08-24  150  static int broadwell_ssp0_f=
ixup(struct snd_soc_pcm_runtime *rtd,
2d995e5dc283ad John Keeping    2016-08-24  151  			struct snd_pcm_hw_params=
 *params)
2d995e5dc283ad John Keeping    2016-08-24  152  {
2d995e5dc283ad John Keeping    2016-08-24  153  	struct snd_interval *rate =
=3D hw_param_interval(params,
2d995e5dc283ad John Keeping    2016-08-24  154  			SNDRV_PCM_HW_PARAM_RATE);
2d995e5dc283ad John Keeping    2016-08-24 @155  	struct snd_interval *chann=
els =3D hw_param_interval(params,
2d995e5dc283ad John Keeping    2016-08-24  156  						SNDRV_PCM_HW_PARAM_CH=
ANNELS);
2d995e5dc283ad John Keeping    2016-08-24  157  =

2d995e5dc283ad John Keeping    2016-08-24  158  	/* The ADSP will covert th=
e FE rate to 48k, stereo */
2d995e5dc283ad John Keeping    2016-08-24  159  	rate->min =3D rate->max =
=3D 48000;
2d995e5dc283ad John Keeping    2016-08-24  160  	channels->min =3D channels=
->max =3D 2;
2d995e5dc283ad John Keeping    2016-08-24  161  =

2d995e5dc283ad John Keeping    2016-08-24  162  	/* set SSP0 to 16 bit */
952fafe1cc550b Takashi Iwai    2018-07-25  163  	params_set_format(params, =
SNDRV_PCM_FORMAT_S16_LE);
2d995e5dc283ad John Keeping    2016-08-24  164  	return 0;
2d995e5dc283ad John Keeping    2016-08-24  165  }
2d995e5dc283ad John Keeping    2016-08-24  166  =


:::::: The code at line 155 was first introduced by commit
:::::: 2d995e5dc283adbfbf9c1eb81bf35ca7af2d22a6 ASoC: Intel: boards: Add bd=
w-rt5677 machine driver

:::::: TO: John Keeping <john@metanate.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2462918546107919520==--

