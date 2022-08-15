Content-Type: multipart/mixed; boundary="===============7115487733418157547=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/soc-utils-test.c:125:34: warning: use of uninitialized value '((int *)_13 = PHI <&MEM <struct snd_pcm_hw_params> [(void *)&params + 4B](2), _48(3)>)[2]' [CWE-457]
Date: Mon, 15 Aug 2022 09:32:26 +0800
Message-ID: <202208150941.ST9tLAb3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7115487733418157547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: sound/soc=
/soc-utils-test.c:125:34: warning: use of uninitialized value '((int *)_13 =
=3D PHI <&MEM <struct snd_pcm_hw_params> [(void *)&params + 4B](2), _48(3)>=
)[2]' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Richard Fitzgerald <rf@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   568035b01cfb107af8d2e4bd2fb9aea22cf5b868
commit: 89342fa38bbaade51584f255eee5cd43621f4e10 ASoC: soc-utils: Add kunit=
 test for snd_soc_tdm_params_to_bclk()
date:   4 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20220810 (https://download.01.org/0day-ci/archi=
ve/20220815/202208150941.ST9tLAb3-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D89342fa38bbaade51584f255eee5cd43621f4e10
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 89342fa38bbaade51584f255eee5cd43621f4e10
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   sound/soc/soc-utils-test.c: In function 'test_tdm_params_to_bclk_one':
>> sound/soc/soc-utils-test.c:125:34: warning: use of uninitialized value '=
((int *)_13 =3D PHI <&MEM <struct snd_pcm_hw_params> [(void *)&params + 4B]=
(2), _48(3)>)[2]' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     125 |         struct snd_pcm_hw_params params;
         |                                  ^~~~~~
     'test_tdm_params_to_bclk_one': events 1-4
       |
       |  125 |         struct snd_pcm_hw_params params;
       |      |                                  ^~~~~~
       |      |                                  |
       |      |                                  (1) region created on stac=
k here
       |      |                                  (2) following 'true' branc=
h...
       |      |                                  (3) ...to here
       |      |                                  (4) use of uninitialized v=
alue '((int *)_13 =3D PHI <&MEM <struct snd_pcm_hw_params> [(void *)&params=
 + 4B](2), _48(3)>)[2]' here
       |
>> sound/soc/soc-utils-test.c:125:34: warning: use of uninitialized value '=
((int *)_13 =3D PHI <&MEM <struct snd_pcm_hw_params> [(void *)&params + 4B]=
(2), _48(3)>)[2]' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     125 |         struct snd_pcm_hw_params params;
         |                                  ^~~~~~
     'test_tdm_params_to_bclk': event 1
       |
       |  144 | static void test_tdm_params_to_bclk(struct kunit *test)
       |      |             ^~~~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'test_tdm_params_to_bclk'
       |
     'test_tdm_params_to_bclk': events 2-4
       |
       |  148 |         for (i =3D 0; i < ARRAY_SIZE(tdm_params_to_bclk_cas=
es); ++i) {
       |  149 |                 test_tdm_params_to_bclk_one(test,
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (4) calling 'test_tdm_params_to_bclk_one' f=
rom 'test_tdm_params_to_bclk'
       |  150 |                                             tdm_params_to_b=
clk_cases[i].rate,
       |      |                                             ~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
       |      |                                                            =
            |
       |      |                                                            =
            (3) ...to here
       |  151 |                                             tdm_params_to_b=
clk_cases[i].fmt,
       |      |                                             ~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
       |  152 |                                             tdm_params_to_b=
clk_cases[i].channels,
       |      |                                             ~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~
       |  153 |                                             tdm_params_to_b=
clk_cases[i].tdm_width,
       |      |                                             ~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~
       |  154 |                                             tdm_params_to_b=
clk_cases[i].tdm_slots,
       |      |                                             ~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~
       |  155 |                                             tdm_params_to_b=
clk_cases[i].slot_multiple,
       |      |                                             ~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |  156 |                                             tdm_params_to_b=
clk_cases[i].bclk);
       |      |                                             ~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
       |
       +--> 'test_tdm_params_to_bclk_one': events 5-9
              |
              |  118 | static void test_tdm_params_to_bclk_one(struct kunit=
 *test,
              |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (5) entry to 'test_tdm_params_to_bclk_on=
e'
              |......
              |  125 |         struct snd_pcm_hw_params params;
              |      |                                  ~~~~~~
              |      |                                  |
              |      |                                  (6) region created =
on stack here
              |      |                                  (7) following 'true=
' branch...
              |      |                                  (8) ...to here
              |      |                                  (9) use of uninitia=
lized value '((int *)_13 =3D PHI <&MEM <struct snd_pcm_hw_params> [(void *)=
&params + 4B](2), _48(3)>)[2]' here
              |

vim +125 sound/soc/soc-utils-test.c

89342fa38bbaad Richard Fitzgerald 2022-04-05  117  =

89342fa38bbaad Richard Fitzgerald 2022-04-05  118  static void test_tdm_par=
ams_to_bclk_one(struct kunit *test,
89342fa38bbaad Richard Fitzgerald 2022-04-05  119  					unsigned int rate, =
snd_pcm_format_t fmt,
89342fa38bbaad Richard Fitzgerald 2022-04-05  120  					unsigned int channe=
ls,
89342fa38bbaad Richard Fitzgerald 2022-04-05  121  					unsigned int tdm_wi=
dth, unsigned int tdm_slots,
89342fa38bbaad Richard Fitzgerald 2022-04-05  122  					unsigned int slot_m=
ultiple,
89342fa38bbaad Richard Fitzgerald 2022-04-05  123  					unsigned int expect=
ed_bclk)
89342fa38bbaad Richard Fitzgerald 2022-04-05  124  {
89342fa38bbaad Richard Fitzgerald 2022-04-05 @125  	struct snd_pcm_hw_param=
s params;
89342fa38bbaad Richard Fitzgerald 2022-04-05  126  	int got_bclk;
89342fa38bbaad Richard Fitzgerald 2022-04-05  127  =

89342fa38bbaad Richard Fitzgerald 2022-04-05  128  	_snd_pcm_hw_params_any(=
&params);
89342fa38bbaad Richard Fitzgerald 2022-04-05  129  	snd_mask_none(hw_param_=
mask(&params, SNDRV_PCM_HW_PARAM_FORMAT));
89342fa38bbaad Richard Fitzgerald 2022-04-05  130  	hw_param_interval(&para=
ms, SNDRV_PCM_HW_PARAM_RATE)->min =3D rate;
89342fa38bbaad Richard Fitzgerald 2022-04-05  131  	hw_param_interval(&para=
ms, SNDRV_PCM_HW_PARAM_RATE)->max =3D rate;
89342fa38bbaad Richard Fitzgerald 2022-04-05  132  	hw_param_interval(&para=
ms, SNDRV_PCM_HW_PARAM_CHANNELS)->min =3D channels;
89342fa38bbaad Richard Fitzgerald 2022-04-05  133  	hw_param_interval(&para=
ms, SNDRV_PCM_HW_PARAM_CHANNELS)->max =3D channels;
89342fa38bbaad Richard Fitzgerald 2022-04-05  134  	params_set_format(&para=
ms, fmt);
89342fa38bbaad Richard Fitzgerald 2022-04-05  135  =

89342fa38bbaad Richard Fitzgerald 2022-04-05  136  	got_bclk =3D snd_soc_td=
m_params_to_bclk(&params, tdm_width, tdm_slots, slot_multiple);
89342fa38bbaad Richard Fitzgerald 2022-04-05  137  	pr_debug("%s: r=3D%u sb=
=3D%u ch=3D%u tw=3D%u ts=3D%u sm=3D%u expected=3D%u got=3D%d\n",
89342fa38bbaad Richard Fitzgerald 2022-04-05  138  		 __func__,
89342fa38bbaad Richard Fitzgerald 2022-04-05  139  		 rate, params_width(&p=
arams), channels, tdm_width, tdm_slots, slot_multiple,
89342fa38bbaad Richard Fitzgerald 2022-04-05  140  		 expected_bclk, got_bc=
lk);
89342fa38bbaad Richard Fitzgerald 2022-04-05  141  	KUNIT_ASSERT_EQ(test, e=
xpected_bclk, (unsigned int)got_bclk);
89342fa38bbaad Richard Fitzgerald 2022-04-05  142  }
89342fa38bbaad Richard Fitzgerald 2022-04-05  143  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7115487733418157547==--

