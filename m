Content-Type: multipart/mixed; boundary="===============2916515233722039086=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/char/hw_random/hisi-rng.c:38:13: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sun, 04 Sep 2022 12:12:49 +0800
Message-ID: <202209041202.OjGSQTT3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2916515233722039086==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/char/hw_random/hisi-rng.c:38:13: warning: use of uninitialized val=
ue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   65eea2c060aee3bf6d27ea365360059fbd4eeff4
commit: 09f6b27d5ddd9ad0ec096d1b0f8decdacc70f0f8 ARM: dove: multiplatform s=
upport
date:   5 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-c002-20220831
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D09f6b27d5ddd9ad0ec096d1b0f8decdacc70f0f8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 09f6b27d5ddd9ad0ec096d1b0f8decdacc70f0f8
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/char/hw_random/hisi-rng.c: In function 'hisi_rng_init':
>> drivers/char/hw_random/hisi-rng.c:38:13: warning: use of uninitialized v=
alue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      38 |         u32 seed;
         |             ^~~~
     'hisi_rng_init': event 1
       |
       |   38 |         u32 seed;
       |      |             ^~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
--
   drivers/clk/spear/clk-aux-synth.c: In function 'clk_aux_round_rate':
>> drivers/clk/spear/clk-aux-synth.c:59:13: warning: use of uninitialized v=
alue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      59 |         int unused;
         |             ^~~~~~
     'clk_aux_round_rate': event 1
       |
       |   59 |         int unused;
       |      |             ^~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/clk/spear/clk-aux-synth.c: In function 'clk_aux_set_rate':
   drivers/clk/spear/clk-aux-synth.c:105:13: warning: use of uninitialized =
value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     105 |         int i;
         |             ^
     'clk_aux_set_rate': event 1
       |
       |  105 |         int i;
       |      |             ^
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
--
   drivers/clk/spear/clk-frac-synth.c: In function 'clk_frac_round_rate':
>> drivers/clk/spear/clk-frac-synth.c:62:13: warning: use of uninitialized =
value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      62 |         int unused;
         |             ^~~~~~
     'clk_frac_round_rate': event 1
       |
       |   62 |         int unused;
       |      |             ^~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/clk/spear/clk-frac-synth.c: In function 'clk_frac_set_rate':
   drivers/clk/spear/clk-frac-synth.c:101:13: warning: use of uninitialized=
 value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     101 |         int i;
         |             ^
     'clk_frac_set_rate': event 1
       |
       |  101 |         int i;
       |      |             ^
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
--
   drivers/clk/spear/clk-gpt-synth.c: In function 'clk_gpt_round_rate':
>> drivers/clk/spear/clk-gpt-synth.c:49:13: warning: use of uninitialized v=
alue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      49 |         int unused;
         |             ^~~~~~
     'clk_gpt_round_rate': event 1
       |
       |   49 |         int unused;
       |      |             ^~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/clk/spear/clk-gpt-synth.c: In function 'clk_gpt_set_rate':
   drivers/clk/spear/clk-gpt-synth.c:86:13: warning: use of uninitialized v=
alue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      86 |         int i;
         |             ^
     'clk_gpt_set_rate': event 1
       |
       |   86 |         int i;
       |      |             ^
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
--
   drivers/clk/spear/clk-vco-pll.c: In function 'clk_pll_round_rate':
>> drivers/clk/spear/clk-vco-pll.c:119:13: warning: use of uninitialized va=
lue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     119 |         int unused;
         |             ^~~~~~
     'clk_pll_round_rate': event 1
       |
       |  119 |         int unused;
       |      |             ^~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/clk/spear/clk-vco-pll.c: In function 'clk_vco_round_rate':
   drivers/clk/spear/clk-vco-pll.c:186:13: warning: use of uninitialized va=
lue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     186 |         int unused;
         |             ^~~~~~
     'clk_vco_round_rate': event 1
       |
       |  186 |         int unused;
       |      |             ^~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/clk/spear/clk-vco-pll.c: In function 'clk_vco_set_rate':
   drivers/clk/spear/clk-vco-pll.c:236:13: warning: use of uninitialized va=
lue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     236 |         int i;
         |             ^
     'clk_vco_set_rate': event 1
       |
       |  236 |         int i;
       |      |             ^
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
--
   drivers/clk/sunxi/clk-sunxi.c: In function 'sunxi_divs_clk_setup':
>> drivers/clk/sunxi/clk-sunxi.c:947:21: warning: use of uninitialized valu=
e '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     947 |         const char *parent;
         |                     ^~~~~~
     'sunxi_divs_clk_setup': event 1
       |
       |  947 |         const char *parent;
       |      |                     ^~~~~~
       |      |                     |
       |      |                     (1) use of uninitialized value '<unknow=
n>' here
       |
   drivers/clk/sunxi/clk-sunxi.c:948:21: warning: use of uninitialized valu=
e '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     948 |         const char *clk_name;
         |                     ^~~~~~~~
     'sunxi_divs_clk_setup': event 1
       |
       |  948 |         const char *clk_name;
       |      |                     ^~~~~~~~
       |      |                     |
       |      |                     (1) use of uninitialized value '<unknow=
n>' here
       |
--
   drivers/clk/sunxi/clk-a10-hosc.c: In function 'sun4i_osc_clk_setup':
>> drivers/clk/sunxi/clk-a10-hosc.c:23:13: warning: use of uninitialized va=
lue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      23 |         u32 rate;
         |             ^~~~
     'sun4i_osc_clk_setup': event 1
       |
       |   23 |         u32 rate;
       |      |             ^~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
--
   drivers/clk/sunxi/clk-a10-pll2.c: In function 'sun4i_pll2_setup':
>> drivers/clk/sunxi/clk-a10-pll2.c:41:45: warning: use of uninitialized va=
lue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      41 |         const char *clk_name =3D node->name, *parent;
         |                                             ^~~~~~
     'sun4i_pll2_setup': event 1
       |
       |   41 |         const char *clk_name =3D node->name, *parent;
       |      |                                             ^~~~~~
       |      |                                             |
       |      |                                             (1) use of unin=
itialized value '<unknown>' here
       |
--
   drivers/clk/sunxi/clk-a10-ve.c: In function 'sun4i_ve_clk_setup':
>> drivers/clk/sunxi/clk-a10-ve.c:91:21: warning: use of uninitialized valu=
e '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      91 |         const char *parent;
         |                     ^~~~~~
     'sun4i_ve_clk_setup': event 1
       |
       |   91 |         const char *parent;
       |      |                     ^~~~~~
       |      |                     |
       |      |                     (1) use of uninitialized value '<unknow=
n>' here
       |
--
   drivers/clk/sunxi/clk-mod0.c: In function 'sunxi_mmc_setup':
>> drivers/clk/sunxi/clk-mod0.c:293:21: warning: use of uninitialized value=
 '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     293 |         const char *parent;
         |                     ^~~~~~
     'sunxi_mmc_setup': event 1
       |
       |  293 |         const char *parent;
       |      |                     ^~~~~~
       |      |                     |
       |      |                     (1) use of uninitialized value '<unknow=
n>' here
       |
--
   drivers/clk/sunxi/clk-simple-gates.c: In function 'sunxi_simple_gates_se=
tup':
>> drivers/clk/sunxi/clk-simple-gates.c:23:34: warning: use of uninitialize=
d value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      23 |         const char *clk_parent, *clk_name;
         |                                  ^~~~~~~~
     'sunxi_simple_gates_setup': event 1
       |
       |   23 |         const char *clk_parent, *clk_name;
       |      |                                  ^~~~~~~~
       |      |                                  |
       |      |                                  (1) use of uninitialized v=
alue '<unknown>' here
       |
   drivers/clk/sunxi/clk-simple-gates.c:29:13: warning: use of uninitialize=
d value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      29 |         int number, i =3D 0, j;
         |             ^~~~~~
     'sunxi_simple_gates_setup': event 1
       |
       |   29 |         int number, i =3D 0, j;
       |      |             ^~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/clk/sunxi/clk-simple-gates.c:31:13: warning: use of uninitialize=
d value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      31 |         u32 index;
         |             ^~~~~
     'sunxi_simple_gates_setup': event 1
       |
       |   31 |         u32 index;
       |      |             ^~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
--
   drivers/clk/sunxi/clk-sun4i-pll3.c: In function 'sun4i_a10_pll3_setup':
>> drivers/clk/sunxi/clk-sun4i-pll3.c:23:45: warning: use of uninitialized =
value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      23 |         const char *clk_name =3D node->name, *parent;
         |                                             ^~~~~~
     'sun4i_a10_pll3_setup': event 1
       |
       |   23 |         const char *clk_name =3D node->name, *parent;
       |      |                                             ^~~~~~
       |      |                                             |
       |      |                                             (1) use of unin=
itialized value '<unknown>' here
       |
--
   drivers/clk/sunxi/clk-sun4i-tcon-ch1.c: In function 'tcon_ch1_calc_divid=
er':
>> drivers/clk/sunxi/clk-sun4i-tcon-ch1.c:129:23: warning: use of uninitial=
ized value 'is_double' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     129 |                 *half =3D is_double;
         |                 ~~~~~~^~~~~~~~~~~
     'tcon_ch1_calc_divider': events 1-2
       |
       |  105 |         bool is_double;
       |      |              ^~~~~~~~~
       |      |              |
       |      |              (1) region created on stack here
       |  106 | =

       |  107 |         for (m =3D 1; m < 16; m++) {
       |      |                     ~~~~~~
       |      |                       |
       |      |                       (2) following 'true' branch (when 'm =
!=3D 16')...
       |
     'tcon_ch1_calc_divider': event 3
       |
       |cc1:
       | (3): ...to here
       |
     'tcon_ch1_calc_divider': events 4-10
       |
       |  110 |                 for (d =3D 1; d < 3; d++) {
       |      |                             ~~^~~
       |      |                               |
       |      |                               (4) following 'true' branch (=
when 'd !=3D 3')...
       |  111 |                         unsigned long tmp_rate;
       |      |                         ~~~~~~~~
       |      |                         |
       |      |                         (5) ...to here
       |......
       |  115 |                         if (tmp_rate > rate)
       |      |                            ~   =

       |      |                            |
       |      |                            (6) following 'true' branch (whe=
n 'tmp_rate > rate')...
       |  116 |                                 continue;
       |      |                                 ~~~~~~~~
       |      |                                 |
       |      |                                 (7) ...to here
       |......
       |  127 |         if (div && half) {
       |      |            ~                   =

       |      |            |
       |      |            (8) following 'true' branch...
       |  128 |                 *div =3D best_m;
       |      |                 ~              =

       |      |                 |
       |      |                 (9) ...to here
       |  129 |                 *half =3D is_double;
       |      |                 ~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (10) use of uninitialized value 'is_d=
ouble' here
       |
>> drivers/clk/sunxi/clk-sun4i-tcon-ch1.c:129:23: warning: use of uninitial=
ized value 'is_double' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     129 |                 *half =3D is_double;
         |                 ~~~~~~^~~~~~~~~~~
     'tcon_ch1_set_rate': events 1-2
       |
       |  186 | static int tcon_ch1_set_rate(struct clk_hw *hw, unsigned lo=
ng rate,
       |      |            ^~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'tcon_ch1_set_rate'
       |......
       |  195 |         tcon_ch1_calc_divider(rate, parent_rate, &div_m, &h=
alf);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
       |      |         |
       |      |         (2) calling 'tcon_ch1_calc_divider' from 'tcon_ch1_=
set_rate'
       |
       +--> 'tcon_ch1_calc_divider': events 3-5
              |
              |   98 | static unsigned long tcon_ch1_calc_divider(unsigned =
long rate,
              |      |                      ^~~~~~~~~~~~~~~~~~~~~
              |      |                      |
              |      |                      (3) entry to 'tcon_ch1_calc_div=
ider'
              |......
              |  105 |         bool is_double;
              |      |              ~~~~~~~~~
              |      |              |
              |      |              (4) region created on stack here
              |  106 | =

              |  107 |         for (m =3D 1; m < 16; m++) {
              |      |                     ~~~~~~
              |      |                       |
              |      |                       (5) following 'true' branch (w=
hen 'm !=3D 16')...
              |
            'tcon_ch1_calc_divider': event 6
              |
              |cc1:
              | (6): ...to here
              |
            'tcon_ch1_calc_divider': events 7-13
              |
              |  110 |                 for (d =3D 1; d < 3; d++) {
              |      |                             ~~^~~
              |      |                               |
              |      |                               (7) following 'true' b=
ranch (when 'd !=3D 3')...
              |  111 |                         unsigned long tmp_rate;
              |      |                         ~~~~~~~~
              |      |                         |
              |      |                         (8) ...to here
              |......
              |  115 |                         if (tmp_rate > rate)
              |      |                            ~   =

              |      |                            |
              |      |                            (9) following 'true' bran=
ch (when 'tmp_rate > rate')...
              |  116 |                                 continue;
              |      |                                 ~~~~~~~~
              |      |                                 |
              |      |                                 (10) ...to here
              |......
              |  127 |         if (div && half) {
              |      |            ~                   =

              |      |            |
              |      |            (11) following 'true' branch...
              |  128 |                 *div =3D best_m;
              |      |                 ~              =

              |      |                 |
              |      |                 (12) ...to here
              |  129 |                 *half =3D is_double;
              |      |                 ~~~~~~~~~~~~~~~~~
              |      |                       |
              |      |                       (13) use of uninitialized valu=
e 'is_double' here
              |
   drivers/clk/sunxi/clk-sun4i-tcon-ch1.c: In function 'tcon_ch1_set_rate':
>> drivers/clk/sunxi/clk-sun4i-tcon-ch1.c:191:14: warning: use of uninitial=
ized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     191 |         bool half;
         |              ^~~~
     'tcon_ch1_set_rate': event 1
       |
       |  191 |         bool half;
       |      |              ^~~~
       |      |              |
       |      |              (1) use of uninitialized value '<unknown>' here
       |
   drivers/clk/sunxi/clk-sun4i-tcon-ch1.c:192:12: warning: use of uninitial=
ized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     192 |         u8 div_m;
         |            ^~~~~
     'tcon_ch1_set_rate': event 1
       |
       |  192 |         u8 div_m;
       |      |            ^~~~~
       |      |            |
       |      |            (1) use of uninitialized value '<unknown>' here
       |
--
   drivers/clk/sunxi/clk-sun8i-bus-gates.c: In function 'sun8i_h3_bus_gates=
_init':
>> drivers/clk/sunxi/clk-sun8i-bus-gates.c:26:21: warning: use of uninitial=
ized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      26 |         const char *clk_name;
         |                     ^~~~~~~~
     'sun8i_h3_bus_gates_init': event 1
       |
       |   26 |         const char *clk_name;
       |      |                     ^~~~~~~~
       |      |                     |
       |      |                     (1) use of uninitialized value '<unknow=
n>' here
       |
   drivers/clk/sunxi/clk-sun8i-bus-gates.c:32:13: warning: use of uninitial=
ized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      32 |         int number, i;
         |             ^~~~~~
     'sun8i_h3_bus_gates_init': event 1
       |
       |   32 |         int number, i;
       |      |             ^~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/clk/sunxi/clk-sun8i-bus-gates.c:34:13: warning: use of uninitial=
ized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      34 |         int index;
         |             ^~~~~
     'sun8i_h3_bus_gates_init': event 1
       |
       |   34 |         int index;
       |      |             ^~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
--
   drivers/clk/sunxi/clk-usb.c: In function 'sunxi_usb_clk_setup':
>> drivers/clk/sunxi/clk-usb.c:95:21: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      95 |         const char *clk_name;
         |                     ^~~~~~~~
     'sunxi_usb_clk_setup': event 1
       |
       |   95 |         const char *clk_name;
       |      |                     ^~~~~~~~
       |      |                     |
       |      |                     (1) use of uninitialized value '<unknow=
n>' here
       |
--
   drivers/clk/sunxi/clk-sun9i-cpus.c: In function 'sun9i_a80_cpus_clk_set_=
rate':
>> drivers/clk/sunxi/clk-sun9i-cpus.c:157:12: warning: use of uninitialized=
 value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     157 |         u8 div, pre_div, parent;
         |            ^~~
     'sun9i_a80_cpus_clk_set_rate': event 1
       |
       |  157 |         u8 div, pre_div, parent;
       |      |            ^~~
       |      |            |
       |      |            (1) use of uninitialized value '<unknown>' here
       |
   drivers/clk/sunxi/clk-sun9i-cpus.c:157:17: warning: use of uninitialized=
 value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     157 |         u8 div, pre_div, parent;
         |                 ^~~~~~~
     'sun9i_a80_cpus_clk_set_rate': event 1
       |
       |  157 |         u8 div, pre_div, parent;
       |      |                 ^~~~~~~
       |      |                 |
       |      |                 (1) use of uninitialized value '<unknown>' =
here
       |
--
   drivers/clk/clk-highbank.c: In function 'clk_pll_round_rate':
>> drivers/clk/clk-highbank.c:137:13: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     137 |         u32 divq, divf;
         |             ^~~~
     'clk_pll_round_rate': event 1
       |
       |  137 |         u32 divq, divf;
       |      |             ^~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/clk/clk-highbank.c:137:19: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     137 |         u32 divq, divf;
         |                   ^~~~
     'clk_pll_round_rate': event 1
       |
       |  137 |         u32 divq, divf;
       |      |                   ^~~~
       |      |                   |
       |      |                   (1) use of uninitialized value '<unknown>=
' here
       |
   drivers/clk/clk-highbank.c: In function 'clk_pll_set_rate':
   drivers/clk/clk-highbank.c:149:13: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     149 |         u32 divq, divf;
         |             ^~~~
     'clk_pll_set_rate': event 1
       |
       |  149 |         u32 divq, divf;
       |      |             ^~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/clk/clk-highbank.c:149:19: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     149 |         u32 divq, divf;
         |                   ^~~~
     'clk_pll_set_rate': event 1
       |
       |  149 |         u32 divq, divf;
       |      |                   ^~~~
       |      |                   |
       |      |                   (1) use of uninitialized value '<unknown>=
' here
       |
   drivers/clk/clk-highbank.c: In function 'hb_clk_init':
   drivers/clk/clk-highbank.c:265:13: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     265 |         u32 reg;
         |             ^~~
     'hb_clk_init': event 1
       |
       |  265 |         u32 reg;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/clk/clk-highbank.c:268:21: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     268 |         const char *parent_name;
         |                     ^~~~~~~~~~~
     'hb_clk_init': event 1
       |
       |  268 |         const char *parent_name;
       |      |                     ^~~~~~~~~~~
       |      |                     |
       |      |                     (1) use of uninitialized value '<unknow=
n>' here
       |
--
   drivers/clk/clk-npcm7xx.c: In function 'npcm7xx_clk_pll_recalc_rate':
>> drivers/clk/clk-npcm7xx.c:44:13: warning: use of uninitialized value '<u=
nknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      44 |         u64 ret;
         |             ^~~
     'npcm7xx_clk_pll_recalc_rate': event 1
       |
       |   44 |         u64 ret;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
--
   drivers/clk/clk-stm32mp1.c: In function 'pll_recalc_rate':
>> drivers/clk/clk-stm32mp1.c:843:13: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     843 |         u64 rate, rate_frac =3D 0;
         |             ^~~~
     'pll_recalc_rate': event 1
       |
       |  843 |         u64 rate, rate_frac =3D 0;
       |      |             ^~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
--
   drivers/input/keyboard/spear-keyboard.c: In function 'spear_kbd_parse_dt=
':
>> drivers/input/keyboard/spear-keyboard.c:153:13: warning: use of uninitia=
lized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     153 |         u32 val, suspended_rate;
         |             ^~~
     'spear_kbd_parse_dt': event 1
       |
       |  153 |         u32 val, suspended_rate;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/input/keyboard/spear-keyboard.c:153:18: warning: use of uninitia=
lized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     153 |         u32 val, suspended_rate;
         |                  ^~~~~~~~~~~~~~
     'spear_kbd_parse_dt': event 1
       |
       |  153 |         u32 val, suspended_rate;
       |      |                  ^~~~~~~~~~~~~~
       |      |                  |
       |      |                  (1) use of uninitialized value '<unknown>'=
 here
       |
--
   drivers/input/keyboard/sun4i-lradc-keys.c: In function 'sun4i_lradc_load=
_dt_keymap':
>> drivers/input/keyboard/sun4i-lradc-keys.c:196:21: warning: use of uninit=
ialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     196 |                 u32 channel;
         |                     ^~~~~~~
     'sun4i_lradc_load_dt_keymap': events 1-4
       |
       |  178 |         if (!np)
       |      |            ^
       |      |            |
       |      |            (1) following 'false' branch (when 'np' is non-N=
ULL)...
       |......
       |  181 |         lradc->chan0_map_count =3D of_get_child_count(np);
       |      |         ~~~~~
       |      |         |
       |      |         (2) ...to here
       |  182 |         if (lradc->chan0_map_count =3D=3D 0) {
       |      |            ~
       |      |            |
       |      |            (3) following 'false' branch...
       |......
       |  187 |         lradc->chan0_map =3D devm_kmalloc_array(dev, lradc-=
>chan0_map_count,
       |      |         ~~~~~
       |      |         |
       |      |         (4) ...to here
       |
     'sun4i_lradc_load_dt_keymap': events 5-6
       |
       |include/linux/device.h:216:12:
       |  216 |         if (unlikely(check_mul_overflow(n, size, &bytes)))
       |      |            ^
       |      |            |
       |      |            (5) following 'false' branch...
       |......
       |  219 |         return devm_kmalloc(dev, bytes, flags);
       |      |         ~~~~~~
       |      |         |
       |      |         (6) ...to here
       |
     'sun4i_lradc_load_dt_keymap': events 7-8
       |
       |drivers/input/keyboard/sun4i-lradc-keys.c:190:12:
       |  190 |         if (!lradc->chan0_map)
       |      |            ^
       |      |            |
       |      |            (7) following 'false' branch...
       |......
       |  193 |         i =3D 0;
       |      |         ~   =

       |      |         |
       |      |         (8) ...to here
       |
     'sun4i_lradc_load_dt_keymap': event 9
       |
       |include/linux/of.h:1358:61:
       | 1358 |         for (child =3D of_get_next_child(parent, NULL); chi=
ld !=3D NULL; \
   drivers/input/keyboard/sun4i-lradc-keys.c:194:9: note: in expansion of m=
acro 'for_each_child_of_node'
       |  194 |         for_each_child_of_node(np, pp) {
       |      |         ^~~~~~~~~~~~~~~~~~~~~~
       |
     'sun4i_lradc_load_dt_keymap': events 10-11
       |
       |  195 |                 struct sun4i_lradc_keymap *map =3D &lradc->=
chan0_map[i];
       |      |                 ^~~~~~
       |      |                 |
       |      |                 (10) ...to here
       |  196 |                 u32 channel;
       |      |                     ~~~~~~~
       |      |                     |
       |      |                     (11) use of uninitialized value '<unkno=
wn>' here
       |
--
   In file included from include/linux/bitops.h:7,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from arch/arm/include/asm/div64.h:107,
                    from include/linux/math.h:6,
                    from include/linux/delay.h:22,
                    from arch/arm/mach-meson/platsmp.c:7:
   arch/arm/mach-meson/platsmp.c: In function 'meson_smp_finalize_secondary=
_boot':
   include/linux/typecheck.h:11:19: warning: use of uninitialized value '<u=
nknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      11 |         typeof(x) __dummy2; \
         |                   ^~~~~~~~
   include/linux/jiffies.h:106:10: note: in expansion of macro 'typecheck'
     106 |          typecheck(unsigned long, b) && \
         |          ^~~~~~~~~
   include/linux/jiffies.h:108:33: note: in expansion of macro 'time_after'
     108 | #define time_before(a,b)        time_after(b,a)
         |                                 ^~~~~~~~~~
   arch/arm/mach-meson/platsmp.c:138:22: note: in expansion of macro 'time_=
before'
     138 |                 if (!time_before(jiffies, timeout)) {
         |                      ^~~~~~~~~~~
     'meson_smp_finalize_secondary_boot': event 1
       |
       |arch/arm/include/asm/io.h:307:33:
       |  307 | #define readl(c)                ({ u32 __v =3D readl_relaxe=
d(c); __iormb(); __v; })
       |      |                                 ^
       |      |                                 |
       |      |                                 (1) following 'true' branch=
 (when 'val !=3D 0')...
   arch/arm/mach-meson/platsmp.c:137:16: note: in expansion of macro 'readl'
       |  137 |         while (readl(sram_base + MESON_SMP_SRAM_CPU_CTRL_AD=
DR_REG(cpu))) {
       |      |                ^~~~~
       |
     'meson_smp_finalize_secondary_boot': event 2
       |
       |  138 |                 if (!time_before(jiffies, timeout)) {
       |      |                 ^~
       |      |                 |
       |      |                 (2) ...to here
       |
     'meson_smp_finalize_secondary_boot': event 3
       |
       |include/linux/typecheck.h:11:19:
       |   11 |         typeof(x) __dummy2; \
       |      |                   ^~~~~~~~
       |      |                   |
       |      |                   (3) use of uninitialized value '<unknown>=
' here
   include/linux/jiffies.h:106:10: note: in expansion of macro 'typecheck'
       |  106 |          typecheck(unsigned long, b) && \
       |      |          ^~~~~~~~~
   include/linux/jiffies.h:108:33: note: in expansion of macro 'time_after'
       |  108 | #define time_before(a,b)        time_after(b,a)
       |      |                                 ^~~~~~~~~~
   arch/arm/mach-meson/platsmp.c:138:22: note: in expansion of macro 'time_=
before'
       |  138 |                 if (!time_before(jiffies, timeout)) {
       |      |                      ^~~~~~~~~~~
       |
   arch/arm/mach-meson/platsmp.c: In function 'meson8b_smp_boot_secondary':
>> arch/arm/mach-meson/platsmp.c:214:13: warning: use of uninitialized valu=
e '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     214 |         u32 val;
         |             ^~~
     'meson8b_smp_boot_secondary': event 1
       |
       |  214 |         u32 val;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   arch/arm/mach-meson/platsmp.c: In function 'meson8_smp_cpu_kill':
   include/linux/typecheck.h:11:19: warning: use of uninitialized value '<u=
nknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      11 |         typeof(x) __dummy2; \
         |                   ^~~~~~~~
   include/linux/jiffies.h:106:10: note: in expansion of macro 'typecheck'
     106 |          typecheck(unsigned long, b) && \
         |          ^~~~~~~~~
   include/linux/jiffies.h:108:33: note: in expansion of macro 'time_after'
     108 | #define time_before(a,b)        time_after(b,a)
         |                                 ^~~~~~~~~~
   arch/arm/mach-meson/platsmp.c:321:18: note: in expansion of macro 'time_=
before'
     321 |         } while (time_before(jiffies, timeout));
         |                  ^~~~~~~~~~~
     'meson8_smp_cpu_kill': events 1-2
       |
       |  317 |                 if (power_mode =3D=3D SCU_PM_POWEROFF)
       |      |                    ^
       |      |                    |
       |      |                    (1) following 'false' branch (when 'powe=
r_mode !=3D 3')...
       |......
       |  320 |                 usleep_range(10000, 15000);
       |      |                 ~~~~~~~~~~~~
       |      |                 |
       |      |                 (2) ...to here
       |
     'meson8_smp_cpu_kill': event 3
       |
       |include/linux/typecheck.h:11:19:
       |   11 |         typeof(x) __dummy2; \
       |      |                   ^~~~~~~~
       |      |                   |
       |      |                   (3) use of uninitialized value '<unknown>=
' here
   include/linux/jiffies.h:106:10: note: in expansion of macro 'typecheck'
       |  106 |          typecheck(unsigned long, b) && \
       |      |          ^~~~~~~~~
   include/linux/jiffies.h:108:33: note: in expansion of macro 'time_after'
       |  108 | #define time_before(a,b)        time_after(b,a)
       |      |                                 ^~~~~~~~~~
   arch/arm/mach-meson/platsmp.c:321:18: note: in expansion of macro 'time_=
before'
       |  321 |         } while (time_before(jiffies, timeout));
       |      |                  ^~~~~~~~~~~
       |
--
   arch/arm/mach-shmobile/platsmp-apmu.c: In function 'apmu_parse_dt':
>> arch/arm/mach-shmobile/platsmp-apmu.c:213:13: warning: use of uninitiali=
zed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     213 |         u32 id;
         |             ^~
     'apmu_parse_dt': event 1
       |
       |  213 |         u32 id;
       |      |             ^~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
--
   kernel/cpu.c: In function 'cpuhp_invoke_callback_range':
>> kernel/cpu.c:669:26: warning: use of uninitialized value '<unknown>' [CW=
E-457] [-Wanalyzer-use-of-uninitialized-value]
     669 |         enum cpuhp_state state;
         |                          ^~~~~
     'target_store': events 1-4
       |
       | 2286 | static ssize_t target_store(struct device *dev, struct devi=
ce_attribute *attr,
       |      |                ^~~~~~~~~~~~
       |      |                |
       |      |                (1) entry to 'target_store'
       |......
       | 2294 |         if (ret)
       |      |            ~    =

       |      |            |
       |      |            (2) following 'false' branch (when 'ret =3D=3D 0=
')...
       |......
       | 2301 |         if (target !=3D CPUHP_OFFLINE && target !=3D CPUHP_=
ONLINE)
       |      |         ~~      =

       |      |         |
       |      |         (3) ...to here
       |......
       | 2306 |         if (ret)
       |      |            ~    =

       |      |            |
       |      |            (4) following 'false' branch (when 'ret =3D=3D 0=
')...
       |
     'target_store': event 5
       |
       |include/linux/mutex.h:187:26:
       |  187 | #define mutex_lock(lock) mutex_lock_nested(lock, 0)
       |      |                          ^~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (5) ...to here
   kernel/cpu.c:2309:9: note: in expansion of macro 'mutex_lock'
       | 2309 |         mutex_lock(&cpuhp_state_mutex);
       |      |         ^~~~~~~~~~
       |
     'target_store': events 6-10
       |
       | 2313 |         if (ret)
       |      |            ^
       |      |            |
       |      |            (6) following 'false' branch...
       |......
       | 2316 |         if (st->state < target)
       |      |         ~~ ~
       |      |         |  |
       |      |         |  (8) following 'true' branch...
       |      |         (7) ...to here
       | 2317 |                 ret =3D cpu_up(dev->id, target);
       |      |                 ~~~   ~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |     |
       |      |                 |     (10) calling 'cpu_up' from 'target_st=
ore'
       |      |                 (9) ...to here
       |
       +--> 'cpu_up': events 11-16
              |
              | 1384 | static int cpu_up(unsigned int cpu, enum cpuhp_state=
 target)
              |      |            ^~~~~~
              |      |            |
              |      |            (11) entry to 'cpu_up'
              |......
              | 1388 |         if (!cpu_possible(cpu)) {
              |      |            ~
              |      |            |
              |      |            (12) following 'true' branch...
              |......
              | 1397 |         err =3D try_online_node(cpu_to_node(cpu));
              |      |         ~~~ =

              |      |         |
              |      |         (13) ...to here
              |......
              | 1403 |         if (cpu_hotplug_disabled) {
              |      |            ~
              |      |            |
              |      |            (14) following 'false' branch...
              |......
              | 1407 |         if (!cpu_smt_allowed(cpu)) {
              |      |         ~~  =

              |      |         |
              |      |         (15) ...to here
              |......
              | 1412 |         err =3D _cpu_up(cpu, 0, target);
              |      |               ~~~~~~~~~~~~~~~~~~~~~~~
              |      |               |
              |      |               (16) calling '_cpu_up' from 'cpu_up'
              |
              +--> '_cpu_up': events 17-22
                     |
                     | 1324 | static int _cpu_up(unsigned int cpu, int task=
s_frozen, enum cpuhp_state target)
                     |      |            ^~~~~~~
                     |      |            |
                     |      |            (17) entry to '_cpu_up'
                     |......
                     | 1332 |         if (!cpu_present(cpu)) {
                     |      |            ~
                     |      |            |
                     |      |            (18) following 'true' branch...
                     |......
                     | 1341 |         if (st->state >=3D target)
                     |      |         ~~ ~
                     |      |         |  |
--
              |      |                 |    (10) calling 'padata_validate_c=
pumask' from '__padata_remove_cpu'
              |      |                 (9) ...to here
              |
              +--> 'padata_validate_cpumask': events 11-14
                     |
                     |  666 | static bool padata_validate_cpumask(struct pa=
data_instance *pinst,
                     |      |             ^~~~~~~~~~~~~~~~~~~~~~~
                     |      |             |
                     |      |             (11) entry to 'padata_validate_cp=
umask'
                     |......
                     |  669 |         if (!cpumask_intersects(cpumask, cpu_=
online_mask)) {
                     |      |            ~ =

                     |      |            |
                     |      |            (12) following 'true' branch...
                     |  670 |                 pinst->flags |=3D PADATA_INVA=
LID;
                     |      |                 ~~~~~~~~~~~~
                     |      |                 |    |
                     |      |                 |    (14) dereference of NULL=
 'pinst'
                     |      |                 (13) ...to here
                     |
   kernel/padata.c:674:14: warning: dereference of NULL 'pinst' [CWE-476] [=
-Wanalyzer-null-dereference]
     674 |         pinst->flags &=3D ~PADATA_INVALID;
         |         ~~~~~^~~~~~~
     'padata_cpu_dead': event 1
       |
       |  802 | static int padata_cpu_dead(unsigned int cpu, struct hlist_n=
ode *node)
       |      |            ^~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'padata_cpu_dead'
       |
     'padata_cpu_dead': event 2
       |
       |include/linux/list.h:993:57:
       |  993 |            ____ptr ? hlist_entry(____ptr, type, member) : N=
ULL; \
   kernel/padata.c:807:17: note: in expansion of macro 'hlist_entry_safe'
       |  807 |         pinst =3D hlist_entry_safe(node, struct padata_inst=
ance, cpu_dead_node);
       |      |                 ^~~~~~~~~~~~~~~~
       |
     'padata_cpu_dead': events 3-4
       |
       |  807 |         pinst =3D hlist_entry_safe(node, struct padata_inst=
ance, cpu_dead_node);
       |  808 |         if (!pinst_has_cpu(pinst, cpu))
       |      |            ~   =

       |      |            |
       |      |            (4) following 'false' branch...
       |
     'padata_cpu_dead': event 5
       |
       |include/linux/mutex.h:187:26:
       |  187 | #define mutex_lock(lock) mutex_lock_nested(lock, 0)
       |      |                          ^~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (5) ...to here
   kernel/padata.c:811:9: note: in expansion of macro 'mutex_lock'
       |  811 |         mutex_lock(&pinst->lock);
       |      |         ^~~~~~~~~~
       |
     'padata_cpu_dead': event 6
       |
       |  812 |         ret =3D __padata_remove_cpu(pinst, cpu);
       |      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (6) calling '__padata_remove_cpu' from 'padat=
a_cpu_dead'
       |
       +--> '__padata_remove_cpu': events 7-10
              |
              |  766 | static int __padata_remove_cpu(struct padata_instanc=
e *pinst, int cpu)
              |      |            ^~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (7) entry to '__padata_remove_cpu'
              |......
              |  770 |         if (!cpumask_test_cpu(cpu, cpu_online_mask))=
 {
              |      |            ~
              |      |            |
              |      |            (8) following 'true' branch...
              |  771 |                 if (!padata_validate_cpumask(pinst, =
pinst->cpumask.pcpu) ||
              |      |                 ~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~
              |      |                 |    |
              |      |                 |    (10) calling 'padata_validate_c=
pumask' from '__padata_remove_cpu'
              |      |                 (9) ...to here
              |
              +--> 'padata_validate_cpumask': events 11-14
                     |
                     |  666 | static bool padata_validate_cpumask(struct pa=
data_instance *pinst,
                     |      |             ^~~~~~~~~~~~~~~~~~~~~~~
                     |      |             |
                     |      |             (11) entry to 'padata_validate_cp=
umask'
                     |......
                     |  669 |         if (!cpumask_intersects(cpumask, cpu_=
online_mask)) {
                     |      |            ~ =

                     |      |            |
                     |      |            (12) following 'false' branch...
                     |......
                     |  674 |         pinst->flags &=3D ~PADATA_INVALID;
                     |      |         ~~~~~~~~~~~~
                     |      |         |    |
                     |      |         |    (14) dereference of NULL 'pinst'
                     |      |         (13) ...to here
                     |
   kernel/padata.c: In function 'store_cpumask':
>> kernel/padata.c:877:23: warning: use of uninitialized value '<unknown>' =
[CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     877 |         cpumask_var_t new_cpumask;
         |                       ^~~~~~~~~~~
     'store_cpumask': event 1
       |
       |  877 |         cpumask_var_t new_cpumask;
       |      |                       ^~~~~~~~~~~
       |      |                       |
       |      |                       (1) use of uninitialized value '<unkn=
own>' here
       |
--
              |      |             (16) use of uninitialized value '<unknow=
n>' here
              |
   kernel/sched/psi.c:1089:13: warning: use of uninitialized value '<unknow=
n>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1089 |         u32 window_us;
         |             ^~~~~~~~~
     'psi_write': events 1-5
       |
       | 1281 | static ssize_t psi_write(struct file *file, const char __us=
er *user_buf,
       |      |                ^~~~~~~~~
       |      |                |
       |      |                (1) entry to 'psi_write'
       |......
       | 1289 |         if (static_branch_likely(&psi_disabled))
       |      |            ~    =

       |      |            |
       |      |            (2) following 'false' branch...
       |......
       | 1292 |         if (!nbytes)
       |      |         ~~ ~    =

       |      |         |  |
       |      |         |  (4) following 'false' branch (when 'nbytes !=3D =
0')...
       |      |         (3) ...to here
       |......
       | 1295 |         buf_size =3D min(nbytes, sizeof(buf));
       |      |         ~~~~~~~~
       |      |         |
       |      |         (5) ...to here
       |
     'psi_write': event 6
       |
       |include/linux/once_lite.h:17:20:
       |   17 |                 if (unlikely(__ret_do_once && !__already_do=
ne)) {       \
       |      |                    ^
       |      |                    |
       |      |                    (6) following 'false' branch...
   include/asm-generic/bug.h:146:9: note: in expansion of macro 'DO_ONCE_LI=
TE_IF'
       |  146 |         DO_ONCE_LITE_IF(condition, WARN_ON, 1)
       |      |         ^~~~~~~~~~~~~~~
   include/linux/thread_info.h:233:13: note: in expansion of macro 'WARN_ON=
_ONCE'
       |  233 |         if (WARN_ON_ONCE(bytes > INT_MAX))
       |      |             ^~~~~~~~~~~~
       |
     'psi_write': event 7
       |
       |include/linux/uaccess.h:151:20:
       |  151 |         if (likely(check_copy_size(to, n, false)))
   include/linux/compiler.h:77:45: note: in definition of macro 'likely'
       |   77 | # define likely(x)      __builtin_expect(!!(x), 1)
       |      |                                             ^
       |
     'psi_write': events 8-9
       |
       |include/linux/uaccess.h:151:12:
       |  151 |         if (likely(check_copy_size(to, n, false)))
       |      |            ^
       |      |            |
       |      |            (8) following 'true' branch...
       |  152 |                 n =3D _copy_from_user(to, from, n);
       |      |                 ~
       |      |                 |
       |      |                 (9) ...to here
       |
     'psi_write': events 10-14
       |
       |kernel/sched/psi.c:1296:12:
       | 1296 |         if (copy_from_user(buf, user_buf, buf_size))
       |      |            ^
       |      |            |
       |      |            (10) following 'false' branch (when 'n =3D=3D 0'=
)...
       |......
       | 1299 |         buf[buf_size - 1] =3D '\0';
       |      |         ~~~ =

       |      |         |
       |      |         (11) ...to here
       |......
       | 1307 |         if (seq->private) {
       |      |            ~
       |      |            |
       |      |            (12) following 'false' branch...
       |......
       | 1312 |         new =3D psi_trigger_create(&psi_system, buf, nbytes=
, res);
       |      |         ~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
       |      |         |     |
       |      |         |     (14) calling 'psi_trigger_create' from 'psi_w=
rite'
       |      |         (13) ...to here
       |
       +--> 'psi_trigger_create': events 15-16
              |
              | 1083 | struct psi_trigger *psi_trigger_create(struct psi_gr=
oup *group,
              |      |                     ^~~~~~~~~~~~~~~~~~
              |      |                     |
              |      |                     (15) entry to 'psi_trigger_creat=
e'
              |......
              | 1089 |         u32 window_us;
              |      |             ~~~~~~~~~
              |      |             |
              |      |             (16) use of uninitialized value '<unknow=
n>' here
              |
   In file included from kernel/sched/build_utility.c:100:
   kernel/sched/membarrier.c: In function 'membarrier_global_expedited':
>> kernel/sched/membarrier.c:247:23: warning: use of uninitialized value '<=
unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     247 |         cpumask_var_t tmpmask;
         |                       ^~~~~~~
     'membarrier_global_expedited': event 1
       |
       |  247 |         cpumask_var_t tmpmask;
       |      |                       ^~~~~~~
       |      |                       |
       |      |                       (1) use of uninitialized value '<unkn=
own>' here
       |
   kernel/sched/membarrier.c: In function 'membarrier_private_expedited':
   kernel/sched/membarrier.c:311:23: warning: use of uninitialized value '<=
unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     311 |         cpumask_var_t tmpmask;
         |                       ^~~~~~~
     'membarrier_private_expedited': event 1
       |
       |  311 |         cpumask_var_t tmpmask;
       |      |                       ^~~~~~~
       |      |                       |
       |      |                       (1) use of uninitialized value '<unkn=
own>' here
       |
   kernel/sched/membarrier.c: In function 'sync_runqueues_membarrier_state':
   kernel/sched/membarrier.c:428:23: warning: use of uninitialized value '<=
unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     428 |         cpumask_var_t tmpmask;
         |                       ^~~~~~~
     'sync_runqueues_membarrier_state': event 1
       |
       |  428 |         cpumask_var_t tmpmask;
       |      |                       ^~~~~~~
       |      |                       |
       |      |                       (1) use of uninitialized value '<unkn=
own>' here
       |
   In file included from kernel/sched/build_utility.c:104:
   kernel/sched/isolation.c: In function 'housekeeping_setup':
>> kernel/sched/isolation.c:111:23: warning: use of uninitialized value '<u=
nknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     111 |         cpumask_var_t non_housekeeping_mask, housekeeping_stagin=
g;
         |                       ^~~~~~~~~~~~~~~~~~~~~
     'housekeeping_setup': event 1
       |
       |  111 |         cpumask_var_t non_housekeeping_mask, housekeeping_s=
taging;
       |      |                       ^~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (1) use of uninitialized value '<unkn=
own>' here
       |
   kernel/sched/isolation.c:111:46: warning: use of uninitialized value '<u=
nknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     111 |         cpumask_var_t non_housekeeping_mask, housekeeping_stagin=
g;
         |                                              ^~~~~~~~~~~~~~~~~~~~
     'housekeeping_setup': event 1
       |
       |  111 |         cpumask_var_t non_housekeeping_mask, housekeeping_s=
taging;
       |      |                                              ^~~~~~~~~~~~~~=
~~~~~~
       |      |                                              |
       |      |                                              (1) use of uni=
nitialized value '<unknown>' here
       |
   In file included from kernel/sched/build_utility.c:108:
   kernel/sched/autogroup.c: In function 'autogroup_task_get':
   kernel/sched/autogroup.c:73:23: warning: use of uninitialized value '<un=
known>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      73 |         unsigned long flags;
         |                       ^~~~~
     'autogroup_task_get': event 1
       |
       |   73 |         unsigned long flags;
       |      |                       ^~~~~
       |      |                       |
       |      |                       (1) use of uninitialized value '<unkn=
own>' here
       |
   kernel/sched/autogroup.c: In function 'autogroup_move_group':
   kernel/sched/autogroup.c:161:23: warning: use of uninitialized value '<u=
nknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     161 |         unsigned long flags;
         |                       ^~~~~
     'autogroup_move_group': event 1
       |
       |  161 |         unsigned long flags;
       |      |                       ^~~~~
       |      |                       |
       |      |                       (1) use of uninitialized value '<unkn=
own>' here
       |
   In file included from include/linux/bitops.h:7,
                    from include/linux/kernel.h:22,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/build_utility.c:12:
   kernel/sched/autogroup.c: In function 'proc_sched_autogroup_set_nice':
   include/linux/typecheck.h:11:19: warning: use of uninitialized value '<u=
nknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      11 |         typeof(x) __dummy2; \
         |                   ^~~~~~~~
   include/linux/jiffies.h:106:10: note: in expansion of macro 'typecheck'
     106 |          typecheck(unsigned long, b) && \
         |          ^~~~~~~~~
   include/linux/jiffies.h:108:33: note: in expansion of macro 'time_after'
     108 | #define time_before(a,b)        time_after(b,a)
         |                                 ^~~~~~~~~~
   kernel/sched/autogroup.c:248:40: note: in expansion of macro 'time_befor=
e'
     248 |         if (!capable(CAP_SYS_ADMIN) && time_before(jiffies, next=
))
         |                                        ^~~~~~~~~~~
     'proc_sched_autogroup_set_nice': events 1-5
       |
       |  237 |         if (nice < MIN_NICE || nice > MAX_NICE)
       |      |            ^
       |      |            |
       |      |            (1) following 'false' branch...
       |......
       |  240 |         err =3D security_task_setnice(current, nice);
       |      |         ~~~ =

       |      |         |
       |      |         (2) ...to here
       |  241 |         if (err)
       |      |            ~
       |      |            |
       |      |            (3) following 'false' branch (when 'err =3D=3D 0=
')...
       |......
       |  244 |         if (nice < 0 && !can_nice(current, nice))
       |      |         ~~  =

       |      |         |
       |      |         (4) ...to here
       |......
       |  248 |         if (!capable(CAP_SYS_ADMIN) && time_before(jiffies,=
 next))
       |      |            ~
       |      |            |
       |      |            (5) following 'false' branch...
       |
     'proc_sched_autogroup_set_nice': event 6
       |
       |include/linux/jiffies.h:105:20:
       |  105 |         (typecheck(unsigned long, a) && \
       |      |                    ^~~~~~~~
       |      |                    |
       |      |                    (6) ...to here
   include/linux/typecheck.h:10:9: note: in definition of macro 'typecheck'
       |   10 | ({      type __dummy; \
       |      |         ^~~~
   include/linux/jiffies.h:108:33: note: in expansion of macro 'time_after'
       |  108 | #define time_before(a,b)        time_after(b,a)
       |      |                                 ^~~~~~~~~~
--
   kernel/power/energy_model.c: In function 'em_create_perf_table':
>> kernel/power/energy_model.c:126:23: warning: use of uninitialized value =
'<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     126 |         unsigned long power, freq, prev_freq =3D 0, prev_cost =
=3D ULONG_MAX;
         |                       ^~~~~
     'em_create_perf_table': event 1
       |
       |  126 |         unsigned long power, freq, prev_freq =3D 0, prev_co=
st =3D ULONG_MAX;
       |      |                       ^~~~~
       |      |                       |
       |      |                       (1) use of uninitialized value '<unkn=
own>' here
       |
   kernel/power/energy_model.c:126:30: warning: use of uninitialized value =
'<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     126 |         unsigned long power, freq, prev_freq =3D 0, prev_cost =
=3D ULONG_MAX;
         |                              ^~~~
     'em_create_perf_table': event 1
       |
       |  126 |         unsigned long power, freq, prev_freq =3D 0, prev_co=
st =3D ULONG_MAX;
       |      |                              ^~~~
       |      |                              |
       |      |                              (1) use of uninitialized value=
 '<unknown>' here
       |
--
   kernel/irq/proc.c: In function 'irq_affinity_hint_proc_show':
>> kernel/irq/proc.c:87:23: warning: use of uninitialized value '<unknown>'=
 [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      87 |         cpumask_var_t mask;
         |                       ^~~~
     'irq_affinity_hint_proc_show': event 1
       |
       |   87 |         cpumask_var_t mask;
       |      |                       ^~~~
       |      |                       |
       |      |                       (1) use of uninitialized value '<unkn=
own>' here
       |
   kernel/irq/proc.c: In function 'write_irq_affinity':
   kernel/irq/proc.c:141:23: warning: use of uninitialized value '<unknown>=
' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     141 |         cpumask_var_t new_value;
         |                       ^~~~~~~~~
     'write_irq_affinity': event 1
       |
       |  141 |         cpumask_var_t new_value;
       |      |                       ^~~~~~~~~
       |      |                       |
       |      |                       (1) use of uninitialized value '<unkn=
own>' here
       |
   kernel/irq/proc.c: In function 'default_affinity_write':
   kernel/irq/proc.c:238:23: warning: use of uninitialized value '<unknown>=
' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     238 |         cpumask_var_t new_value;
         |                       ^~~~~~~~~
     'default_affinity_write': event 1
       |
       |  238 |         cpumask_var_t new_value;
       |      |                       ^~~~~~~~~
       |      |                       |
       |      |                       (1) use of uninitialized value '<unkn=
own>' here
       |
--
   kernel/irq/affinity.c: In function 'irq_build_affinity_masks':
>> kernel/irq/affinity.c:344:23: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     344 |         cpumask_var_t nmsk, npresmsk;
         |                       ^~~~
     'irq_create_affinity_masks': events 1-5
       |
       |  416 | irq_create_affinity_masks(unsigned int nvecs, struct irq_af=
finity *affd)
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      | |
       |      | (1) entry to 'irq_create_affinity_masks'
       |......
       |  442 |         if (WARN_ON_ONCE(affd->nr_sets > IRQ_AFFINITY_MAX_S=
ETS))
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |......
       |  446 |         if (!affvecs)
       |      |         ~~ ~
       |      |         |  |
       |      |         |  (4) following 'false' branch (when 'affvecs !=3D=
 0')...
       |      |         (3) ...to here
       |......
       |  449 |         masks =3D kcalloc(nvecs, sizeof(*masks), GFP_KERNEL=
);
       |      |         ~~~~~
       |      |         |
       |      |         (5) ...to here
       |
     'irq_create_affinity_masks': event 6
       |
       |include/linux/slab.h:652:16:
       |  652 |         return kmalloc_array(n, size, flags | __GFP_ZERO);
       |      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (6) calling 'kmalloc_array' from 'irq_create=
_affinity_masks'
       |
       +--> 'kmalloc_array': events 7-9
              |
              |  613 | static inline __alloc_size(1, 2) void *kmalloc_array=
(size_t n, size_t size, gfp_t flags)
              |      |                                        ^~~~~~~~~~~~~
              |      |                                        |
              |      |                                        (7) entry to =
'kmalloc_array'
              |......
              |  617 |         if (unlikely(check_mul_overflow(n, size, &by=
tes)))
              |      |            ~                            =

              |      |            |
              |      |            (8) following 'false' branch...
              |  618 |                 return NULL;
              |  619 |         if (__builtin_constant_p(n) && __builtin_con=
stant_p(size))
              |      |         ~~                              =

              |      |         |
              |      |         (9) ...to here
              |
       <------+
       |
     'irq_create_affinity_masks': event 10
       |
       |  652 |         return kmalloc_array(n, size, flags | __GFP_ZERO);
       |      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (10) returning to 'irq_create_affinity_masks=
' from 'kmalloc_array'
       |
     'irq_create_affinity_masks': event 11
       |
       |kernel/irq/affinity.c:450:12:
       |  450 |         if (!masks)
       |      |            ^
       |      |            |
       |      |            (11) following 'false' branch...
       |
     'irq_create_affinity_masks': event 12
       |
       |cc1:
       | (12): ...to here
       |
     'irq_create_affinity_masks': events 13-15
       |
       |  461 |         for (i =3D 0, usedvecs =3D 0; i < affd->nr_sets; i+=
+) {
       |      |                                   ~~^~~~~~~~~~~~~~~
       |      |                                     |
       |      |                                     (13) following 'true' b=
ranch...
       |  462 |                 unsigned int this_vecs =3D affd->set_size[i=
];
       |      |                 ~~~~~~~~             =

       |      |                 |
       |      |                 (14) ...to here
       |......
       |  465 |                 ret =3D irq_build_affinity_masks(curvec, th=
is_vecs,
       |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
       |      |                       |
       |      |                       (15) calling 'irq_build_affinity_mask=
s' from 'irq_create_affinity_masks'
       |  466 |                                                curvec, mask=
s);
       |      |                                                ~~~~~~~~~~~~=
~~
       |
       +--> 'irq_build_affinity_masks': events 16-17
              |
              |  338 | static int irq_build_affinity_masks(unsigned int sta=
rtvec, unsigned int numvecs,
              |      |            ^~~~~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (16) entry to 'irq_build_affinity_masks'
              |......
              |  344 |         cpumask_var_t nmsk, npresmsk;
              |      |                       ~~~~
              |      |                       |
--
   In file included from include/linux/time64.h:5,
                    from include/linux/restart_block.h:10,
                    from include/linux/thread_info.h:14,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/smp.h:110,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/notifier.h:14,
                    from include/linux/clk.h:14,
                    from drivers/thermal/amlogic_thermal.c:20:
   In function 'div_s64',
       inlined from 'amlogic_thermal_code_to_millicelsius' at drivers/therm=
al/amlogic_thermal.c:125:11:
   include/linux/math64.h:140:13: warning: use of uninitialized value '<unk=
nown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     140 |         s32 remainder;
         |             ^~~~~~~~~
     'amlogic_thermal_code_to_millicelsius': event 1
       |
       |  140 |         s32 remainder;
       |      |             ^~~~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   In function 'div_s64',
       inlined from 'amlogic_thermal_code_to_millicelsius' at drivers/therm=
al/amlogic_thermal.c:128:10:
   include/linux/math64.h:140:13: warning: use of uninitialized value '<unk=
nown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     140 |         s32 remainder;
         |             ^~~~~~~~~
     'amlogic_thermal_code_to_millicelsius': event 1
       |
       |  140 |         s32 remainder;
       |      |             ^~~~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   In function 'div_s64',
       inlined from 'amlogic_thermal_code_to_millicelsius' at drivers/therm=
al/amlogic_thermal.c:130:10:
   include/linux/math64.h:140:13: warning: use of uninitialized value '<unk=
nown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     140 |         s32 remainder;
         |             ^~~~~~~~~
     'amlogic_thermal_code_to_millicelsius': event 1
       |
       |  140 |         s32 remainder;
       |      |             ^~~~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   In function 'div_s64',
       inlined from 'amlogic_thermal_code_to_millicelsius' at drivers/therm=
al/amlogic_thermal.c:133:9:
   include/linux/math64.h:140:13: warning: use of uninitialized value '<unk=
nown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     140 |         s32 remainder;
         |             ^~~~~~~~~
     'amlogic_thermal_code_to_millicelsius': event 1
       |
       |  140 |         s32 remainder;
       |      |             ^~~~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/thermal/amlogic_thermal.c: In function 'amlogic_thermal_get_temp=
':
>> drivers/thermal/amlogic_thermal.c:184:22: warning: use of uninitialized =
value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     184 |         unsigned int tval;
         |                      ^~~~
     'amlogic_thermal_get_temp': event 1
       |
       |  184 |         unsigned int tval;
       |      |                      ^~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
--
   drivers/clk/hisilicon/clk-hi3559a.c: In function 'clk_pll_recalc_rate':
>> drivers/clk/hisilicon/clk-hi3559a.c:413:18: warning: use of uninitialize=
d value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     413 |         u64 tmp, rate;
         |                  ^~~~
     'clk_pll_recalc_rate': event 1
       |
       |  413 |         u64 tmp, rate;
       |      |                  ^~~~
       |      |                  |
       |      |                  (1) use of uninitialized value '<unknown>'=
 here
       |
--
   drivers/regulator/qcom_rpm-regulator.c: In function 'rpm_reg_of_parse_fr=
eq':
>> drivers/regulator/qcom_rpm-regulator.c:654:13: warning: use of uninitial=
ized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     654 |         u32 freq;
         |             ^~~~
     'rpm_reg_of_parse_freq': event 1
       |
       |  654 |         u32 freq;
       |      |             ^~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/regulator/qcom_rpm-regulator.c: In function 'rpm_reg_of_parse':
   drivers/regulator/qcom_rpm-regulator.c:685:13: warning: use of uninitial=
ized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     685 |         u32 val;
         |             ^~~
     'rpm_reg_of_parse': event 1
       |
       |  685 |         u32 val;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
--
   drivers/edac/highbank_mc_edac.c: In function 'highbank_mc_inject_ctrl':
>> drivers/edac/highbank_mc_edac.c:103:12: warning: use of uninitialized va=
lue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     103 |         u8 synd;
         |            ^~~~
     'highbank_mc_inject_ctrl': event 1
       |
       |  103 |         u8 synd;
       |      |            ^~~~
       |      |            |
       |      |            (1) use of uninitialized value '<unknown>' here
       |
--
   drivers/irqchip/irq-gic-realview.c: In function 'realview_gic_of_init':
>> drivers/irqchip/irq-gic-realview.c:49:36: warning: use of uninitialized =
value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      49 |         const struct of_device_id *gic_id;
         |                                    ^~~~~~
     'realview_gic_of_init': event 1
       |
       |   49 |         const struct of_device_id *gic_id;
       |      |                                    ^~~~~~
       |      |                                    |
       |      |                                    (1) use of uninitialized=
 value '<unknown>' here
       |
--
   drivers/irqchip/irq-crossbar.c: In function 'crossbar_of_init':
>> drivers/irqchip/irq-crossbar.c:197:22: warning: use of uninitialized val=
ue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     197 |         u32 max =3D 0, entry, reg_size;
         |                      ^~~~~
     'crossbar_of_init': event 1
       |
       |  197 |         u32 max =3D 0, entry, reg_size;
       |      |                      ^~~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
   drivers/irqchip/irq-crossbar.c:197:29: warning: use of uninitialized val=
ue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     197 |         u32 max =3D 0, entry, reg_size;
         |                             ^~~~~~~~
     'crossbar_of_init': event 1
       |
       |  197 |         u32 max =3D 0, entry, reg_size;
       |      |                             ^~~~~~~~
       |      |                             |
       |      |                             (1) use of uninitialized value =
'<unknown>' here
       |
   drivers/irqchip/irq-crossbar.c:198:16: warning: use of uninitialized val=
ue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     198 |         int i, size, reserved =3D 0;
         |                ^~~~
     'crossbar_of_init': event 1
       |
       |  198 |         int i, size, reserved =3D 0;
       |      |                ^~~~
       |      |                |
       |      |                (1) use of uninitialized value '<unknown>' h=
ere
       |
--
   drivers/cpufreq/qcom-cpufreq-nvmem.c: In function 'qcom_cpufreq_get_msm_=
id':
>> drivers/cpufreq/qcom-cpufreq-nvmem.c:147:16: warning: use of uninitializ=
ed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     147 |         size_t len;
         |                ^~~
     'qcom_cpufreq_get_msm_id': event 1
       |
       |  147 |         size_t len;
       |      |                ^~~
       |      |                |
       |      |                (1) use of uninitialized value '<unknown>' h=
ere
       |
   drivers/cpufreq/qcom-cpufreq-nvmem.c: In function 'qcom_cpufreq_kryo_nam=
e_version':
   drivers/cpufreq/qcom-cpufreq-nvmem.c:179:16: warning: use of uninitializ=
ed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     179 |         size_t len;
         |                ^~~
     'qcom_cpufreq_kryo_name_version': event 1
       |
       |  179 |         size_t len;
       |      |                ^~~
       |      |                |
       |      |                (1) use of uninitialized value '<unknown>' h=
ere
       |
   drivers/cpufreq/qcom-cpufreq-nvmem.c: In function 'qcom_cpufreq_krait_na=
me_version':
   drivers/cpufreq/qcom-cpufreq-nvmem.c:217:16: warning: use of uninitializ=
ed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     217 |         size_t len;
         |                ^~~
     'qcom_cpufreq_krait_name_version': event 1
       |
       |  217 |         size_t len;
       |      |                ^~~
       |      |                |
       |      |                (1) use of uninitialized value '<unknown>' h=
ere
       |
--
   drivers/cpufreq/sun50i-cpufreq-nvmem.c: In function 'sun50i_cpufreq_get_=
efuse':
>> drivers/cpufreq/sun50i-cpufreq-nvmem.c:39:16: warning: use of uninitiali=
zed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      39 |         size_t len;
         |                ^~~
     'sun50i_cpufreq_get_efuse': event 1
       |
       |   39 |         size_t len;
       |      |                ^~~
       |      |                |
       |      |                (1) use of uninitialized value '<unknown>' h=
ere
       |
--
   drivers/cpufreq/ti-cpufreq.c: In function 'ti_cpufreq_get_efuse':
>> drivers/cpufreq/ti-cpufreq.c:214:13: warning: use of uninitialized value=
 '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     214 |         u32 efuse;
         |             ^~~~~
     'ti_cpufreq_get_efuse': event 1
       |
       |  214 |         u32 efuse;
       |      |             ^~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/cpufreq/ti-cpufreq.c: In function 'ti_cpufreq_get_rev':
   drivers/cpufreq/ti-cpufreq.c:255:13: warning: use of uninitialized value=
 '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     255 |         u32 revision;
         |             ^~~~~~~~
     'ti_cpufreq_get_rev': event 1
       |
       |  255 |         u32 revision;
       |      |             ^~~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
--
   drivers/bus/sunxi-rsb.c: In function 'of_rsb_register_devices':
>> drivers/bus/sunxi-rsb.c:568:13: warning: use of uninitialized value '<un=
known>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     568 |         u32 hwaddr;
         |             ^~~~~~
     'of_rsb_register_devices': event 1
       |
       |  568 |         u32 hwaddr;
       |      |             ^~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
--
   drivers/gpio/gpio-davinci.c: In function 'davinci_gpio_get_pdata':
>> drivers/gpio/gpio-davinci.c:162:13: warning: use of uninitialized value =
'<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     162 |         u32 val;
         |             ^~~
     'davinci_gpio_get_pdata': event 1
       |
       |  162 |         u32 val;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/gpio/gpio-davinci.c: In function 'keystone_gpio_get_irq_chip':
   drivers/gpio/gpio-davinci.c:465:23: warning: dereference of NULL '0' [CW=
E-476] [-Wanalyzer-null-dereference]
     465 |         gpio_unbanked =3D *irq_get_chip(irq);
         |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
     'keystone_gpio_get_irq_chip': event 1
       |
       |include/linux/irq.h:819:28:
       |  819 |         return d ? d->chip : NULL;
       |
     'keystone_gpio_get_irq_chip': events 2-3
       |
       |drivers/gpio/gpio-davinci.c:465:26:
       |  465 |         gpio_unbanked =3D *irq_get_chip(irq);
       |      |         ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
       |      |                       |  |
       |      |                       |  (2) ...to here
       |      |                       (3) dereference of NULL '<unknown>'
       |
--
   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c: In function 'pmic_gpio_read':
>> drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:221:22: warning: use of uniniti=
alized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     221 |         unsigned int val;
         |                      ^~~
     'pmic_gpio_read': event 1
       |
       |  221 |         unsigned int val;
       |      |                      ^~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c: In function 'pmic_gpio_probe':
   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:1003:13: warning: use of uninit=
ialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1003 |         u32 reg;
         |             ^~~
     'pmic_gpio_probe': event 1
       |
       | 1003 |         u32 reg;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
--
   drivers/pinctrl/qcom/pinctrl-spmi-mpp.c: In function 'pmic_mpp_read':
>> drivers/pinctrl/qcom/pinctrl-spmi-mpp.c:178:22: warning: use of uninitia=
lized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     178 |         unsigned int val;
         |                      ^~~
     'pmic_mpp_populate': events 1-2
       |
       |  646 | static int pmic_mpp_populate(struct pmic_mpp_state *state,
       |      |            ^~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'pmic_mpp_populate'
       |......
       |  652 |         type =3D pmic_mpp_read(state, pad, PMIC_MPP_REG_TYP=
E);
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (2) calling 'pmic_mpp_read' from 'pmic_mpp_p=
opulate'
       |
       +--> 'pmic_mpp_read': events 3-4
              |
              |  175 | static int pmic_mpp_read(struct pmic_mpp_state *stat=
e,
              |      |            ^~~~~~~~~~~~~
              |      |            |
              |      |            (3) entry to 'pmic_mpp_read'
              |......
              |  178 |         unsigned int val;
              |      |                      ~~~
              |      |                      |
              |      |                      (4) use of uninitialized value =
'<unknown>' here
              |
   drivers/pinctrl/qcom/pinctrl-spmi-mpp.c: In function 'pmic_mpp_probe':
   drivers/pinctrl/qcom/pinctrl-spmi-mpp.c:835:13: warning: use of uninitia=
lized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     835 |         u32 reg;
         |             ^~~
     'pmic_mpp_probe': event 1
       |
       |  835 |         u32 reg;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
--
   In file included from include/linux/gpio/driver.h:9,
                    from drivers/pinctrl/sunxi/pinctrl-sunxi.c:15:
   include/linux/irqdomain.h: In function 'irq_find_mapping':
   include/linux/irqdomain.h:437:22: warning: use of uninitialized value '<=
unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     437 |         unsigned int irq;
         |                      ^~~
     'irq_find_mapping': event 1
       |
       |  437 |         unsigned int irq;
       |      |                      ^~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
   drivers/pinctrl/sunxi/pinctrl-sunxi.c: In function 'sunxi_pctrl_parse_bi=
as_prop':
>> drivers/pinctrl/sunxi/pinctrl-sunxi.c:178:13: warning: use of uninitiali=
zed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     178 |         u32 val;
         |             ^~~
     'sunxi_pctrl_parse_bias_prop': event 1
       |
       |  178 |         u32 val;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/pinctrl/sunxi/pinctrl-sunxi.c: In function 'sunxi_pctrl_parse_dr=
ive_prop':
   drivers/pinctrl/sunxi/pinctrl-sunxi.c:208:13: warning: use of uninitiali=
zed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     208 |         u32 val;
         |             ^~~
     'sunxi_pctrl_parse_drive_prop': event 1
       |
       |  208 |         u32 val;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/pinctrl/sunxi/pinctrl-sunxi.c: In function 'sunxi_pctrl_parse_fu=
nction_prop':
   drivers/pinctrl/sunxi/pinctrl-sunxi.c:233:21: warning: use of uninitiali=
zed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     233 |         const char *function;
         |                     ^~~~~~~~
     'sunxi_pctrl_parse_function_prop': event 1
       |
       |  233 |         const char *function;
       |      |                     ^~~~~~~~
       |      |                     |
       |      |                     (1) use of uninitialized value '<unknow=
n>' here
       |
   drivers/pinctrl/sunxi/pinctrl-sunxi.c: In function 'sunxi_pctrl_dt_node_=
to_map':
   drivers/pinctrl/sunxi/pinctrl-sunxi.c:337:18: warning: use of uninitiali=
zed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     337 |         int ret, npins, nmaps, configlen =3D 0, i =3D 0;
         |                  ^~~~~
     'sunxi_pctrl_dt_node_to_map': event 1
       |
       |  337 |         int ret, npins, nmaps, configlen =3D 0, i =3D 0;
       |      |                  ^~~~~
       |      |                  |
       |      |                  (1) use of uninitialized value '<unknown>'=
 here
       |
   drivers/pinctrl/sunxi/pinctrl-sunxi.c: In function 'sunxi_pconf_get':
   drivers/pinctrl/sunxi/pinctrl-sunxi.c:484:13: warning: use of uninitiali=
zed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     484 |         u32 offset, shift, mask, val;
         |             ^~~~~~
     'sunxi_pconf_get': event 1
       |
       |  484 |         u32 offset, shift, mask, val;
       |      |             ^~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/pinctrl/sunxi/pinctrl-sunxi.c:484:21: warning: use of uninitiali=
zed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     484 |         u32 offset, shift, mask, val;
         |                     ^~~~~
     'sunxi_pconf_get': event 1
       |
       |  484 |         u32 offset, shift, mask, val;
       |      |                     ^~~~~
       |      |                     |
       |      |                     (1) use of uninitialized value '<unknow=
n>' here
       |
   drivers/pinctrl/sunxi/pinctrl-sunxi.c:484:28: warning: use of uninitiali=
zed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     484 |         u32 offset, shift, mask, val;
         |                            ^~~~
     'sunxi_pconf_get': event 1
       |
       |  484 |         u32 offset, shift, mask, val;
       |      |                            ^~~~
       |      |                            |
       |      |                            (1) use of uninitialized value '=
<unknown>' here
       |
   drivers/pinctrl/sunxi/pinctrl-sunxi.c: In function 'sunxi_pconf_set':
   drivers/pinctrl/sunxi/pinctrl-sunxi.c:550:21: warning: use of uninitiali=
zed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     550 |                 u32 offset, shift, mask, reg;
         |                     ^~~~~~
     'sunxi_pconf_set': events 1-3
       |
       |  547 |         for (i =3D 0; i < num_configs; i++) {
       |      |                     ~~^~~~~~~~~~~~~
       |      |                       |
       |      |                       (1) following 'true' branch...
       |  548 |                 enum pin_config_param param;
       |      |                 ~~~~   =

       |      |                 |
       |      |                 (2) ...to here
       |  549 |                 unsigned long flags;
       |  550 |                 u32 offset, shift, mask, reg;
       |      |                     ~~~~~~
       |      |                     |
       |      |                     (3) use of uninitialized value '<unknow=
n>' here
       |
   drivers/pinctrl/sunxi/pinctrl-sunxi.c:550:29: warning: use of uninitiali=
zed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     550 |                 u32 offset, shift, mask, reg;
         |                             ^~~~~
     'sunxi_pconf_set': events 1-3
       |
       |  547 |         for (i =3D 0; i < num_configs; i++) {
       |      |                     ~~^~~~~~~~~~~~~
--
   drivers/nvmem/sunxi_sid.c: In function 'sun8i_sid_read_by_reg':
>> drivers/nvmem/sunxi_sid.c:85:13: warning: use of uninitialized value '<u=
nknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      85 |         u32 word;
         |             ^~~~
     'sun8i_sid_read_by_reg': event 1
       |
       |   85 |         u32 word;
       |      |             ^~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
--
   drivers/soc/renesas/r9a06g032-smp.c: In function 'r9a06g032_smp_prepare_=
cpus':
>> drivers/soc/renesas/r9a06g032-smp.c:54:28: warning: use of uninitialized=
 value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      54 |         int ret =3D -EINVAL, dns;
         |                            ^~~
     'r9a06g032_smp_prepare_cpus': event 1
       |
       |   54 |         int ret =3D -EINVAL, dns;
       |      |                            ^~~
       |      |                            |
       |      |                            (1) use of uninitialized value '=
<unknown>' here
       |
   drivers/soc/renesas/r9a06g032-smp.c:55:13: warning: use of uninitialized=
 value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      55 |         u32 bootaddr;
         |             ^~~~~~~~
     'r9a06g032_smp_prepare_cpus': event 1
       |
       |   55 |         u32 bootaddr;
       |      |             ^~~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/soc/renesas/r9a06g032-smp.c:69:29: warning: use of uninitialized=
 value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      69 |                         u64 temp;
         |                             ^~~~
     'r9a06g032_smp_prepare_cpus': events 1-7
       |
       |   58 |         if (!dn) {
       |      |            ^
       |      |            |
       |      |            (1) following 'false' branch (when 'dn' is non-N=
ULL)...
       |......
       |   67 |         if (of_find_property(dn, "cpu-release-addr", &dns))=
 {
       |      |         ~~ ~
       |      |         |  |
       |      |         |  (3) following 'true' branch...
       |      |         (2) ...to here
       |   68 |                 if (dns =3D=3D sizeof(u64)) {
       |      |                 ~~ ~
       |      |                 |  |
       |      |                 |  (5) following 'true' branch...
       |      |                 (4) ...to here
       |   69 |                         u64 temp;
       |      |                         ~~~ ~~~~
       |      |                         |   |
       |      |                         |   (7) use of uninitialized value =
'<unknown>' here
       |      |                         (6) ...to here
       |
--
   drivers/soc/sunxi/sunxi_sram.c: In function 'sunxi_sram_claim':
>> drivers/soc/sunxi/sunxi_sram.c:225:22: warning: use of uninitialized val=
ue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     225 |         unsigned int device;
         |                      ^~~~~~
     'sunxi_sram_claim': event 1
       |
       |  225 |         unsigned int device;
       |      |                      ^~~~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |

vim +38 drivers/char/hw_random/hisi-rng.c

afc39d6e89b4f4 Kefeng Wang 2016-04-13  33  =

afc39d6e89b4f4 Kefeng Wang 2016-04-13  34  static int hisi_rng_init(struct =
hwrng *rng)
afc39d6e89b4f4 Kefeng Wang 2016-04-13  35  {
afc39d6e89b4f4 Kefeng Wang 2016-04-13  36  	struct hisi_rng *hrng =3D to_hi=
si_rng(rng);
afc39d6e89b4f4 Kefeng Wang 2016-04-13  37  	int val =3D RNG_EN;
afc39d6e89b4f4 Kefeng Wang 2016-04-13 @38  	u32 seed;
afc39d6e89b4f4 Kefeng Wang 2016-04-13  39  =

afc39d6e89b4f4 Kefeng Wang 2016-04-13  40  	/* get a random number as initi=
al seed */
afc39d6e89b4f4 Kefeng Wang 2016-04-13  41  	get_random_bytes(&seed, sizeof(=
seed));
afc39d6e89b4f4 Kefeng Wang 2016-04-13  42  =

afc39d6e89b4f4 Kefeng Wang 2016-04-13  43  	writel_relaxed(seed, hrng->base=
 + RNG_SEED);
afc39d6e89b4f4 Kefeng Wang 2016-04-13  44  =

afc39d6e89b4f4 Kefeng Wang 2016-04-13  45  	/**
afc39d6e89b4f4 Kefeng Wang 2016-04-13  46  	 * The seed is reload periodica=
lly, there are two choice
afc39d6e89b4f4 Kefeng Wang 2016-04-13  47  	 * of seeds, default seed using=
 the value from LFSR, or
afc39d6e89b4f4 Kefeng Wang 2016-04-13  48  	 * will use seed generated by r=
ing oscillator.
afc39d6e89b4f4 Kefeng Wang 2016-04-13  49  	 */
afc39d6e89b4f4 Kefeng Wang 2016-04-13  50  	if (seed_sel =3D=3D 1)
afc39d6e89b4f4 Kefeng Wang 2016-04-13  51  		val |=3D RNG_RING_EN | RNG_SEE=
D_SEL;
afc39d6e89b4f4 Kefeng Wang 2016-04-13  52  =

afc39d6e89b4f4 Kefeng Wang 2016-04-13  53  	writel_relaxed(val, hrng->base =
+ RNG_CTRL);
afc39d6e89b4f4 Kefeng Wang 2016-04-13  54  	return 0;
afc39d6e89b4f4 Kefeng Wang 2016-04-13  55  }
afc39d6e89b4f4 Kefeng Wang 2016-04-13  56  =


:::::: The code at line 38 was first introduced by commit
:::::: afc39d6e89b4f410f511f03dc6de8dc1d4952d42 hwrng: hisi - Add support f=
or Hisilicon SoC RNG

:::::: TO: Kefeng Wang <wangkefeng.wang@huawei.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp

--===============2916515233722039086==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.ksh"

IwojIEF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGZpbGU7IERPIE5PVCBFRElULgojIExpbnV4L2Fy
bSA1LjE4LjAtcmMxIEtlcm5lbCBDb25maWd1cmF0aW9uCiMKQ09ORklHX0NDX1ZFUlNJT05fVEVY
VD0iYXJtLWxpbnV4LWdudWVhYmktZ2NjIChHQ0MpIDEyLjEuMCIKQ09ORklHX0NDX0lTX0dDQz15
CkNPTkZJR19HQ0NfVkVSU0lPTj0xMjAxMDAKQ09ORklHX0NMQU5HX1ZFUlNJT049MApDT05GSUdf
QVNfSVNfR05VPXkKQ09ORklHX0FTX1ZFUlNJT049MjM4MDAKQ09ORklHX0xEX0lTX0JGRD15CkNP
TkZJR19MRF9WRVJTSU9OPTIzODAwCkNPTkZJR19MTERfVkVSU0lPTj0wCkNPTkZJR19DQ19IQVNf
QVNNX0dPVE89eQpDT05GSUdfQ0NfSEFTX0FTTV9HT1RPX09VVFBVVD15CkNPTkZJR19DQ19IQVNf
QVNNX0lOTElORT15CkNPTkZJR19DQ19IQVNfTk9fUFJPRklMRV9GTl9BVFRSPXkKQ09ORklHX1BB
SE9MRV9WRVJTSU9OPTEyMwpDT05GSUdfSVJRX1dPUks9eQpDT05GSUdfQlVJTERUSU1FX1RBQkxF
X1NPUlQ9eQpDT05GSUdfVEhSRUFEX0lORk9fSU5fVEFTSz15CgojCiMgR2VuZXJhbCBzZXR1cAoj
CkNPTkZJR19JTklUX0VOVl9BUkdfTElNSVQ9MzIKQ09ORklHX0NPTVBJTEVfVEVTVD15CiMgQ09O
RklHX1dFUlJPUiBpcyBub3Qgc2V0CkNPTkZJR19MT0NBTFZFUlNJT049IiIKQ09ORklHX0JVSUxE
X1NBTFQ9IiIKQ09ORklHX0hBVkVfS0VSTkVMX0daSVA9eQpDT05GSUdfSEFWRV9LRVJORUxfTFpN
QT15CkNPTkZJR19IQVZFX0tFUk5FTF9YWj15CkNPTkZJR19IQVZFX0tFUk5FTF9MWk89eQpDT05G
SUdfSEFWRV9LRVJORUxfTFo0PXkKQ09ORklHX0tFUk5FTF9HWklQPXkKIyBDT05GSUdfS0VSTkVM
X0xaTUEgaXMgbm90IHNldAojIENPTkZJR19LRVJORUxfWFogaXMgbm90IHNldAojIENPTkZJR19L
RVJORUxfTFpPIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VSTkVMX0xaNCBpcyBub3Qgc2V0CkNPTkZJ
R19ERUZBVUxUX0lOSVQ9IiIKQ09ORklHX0RFRkFVTFRfSE9TVE5BTUU9Iihub25lKSIKIyBDT05G
SUdfU1dBUCBpcyBub3Qgc2V0CkNPTkZJR19TWVNWSVBDPXkKQ09ORklHX1NZU1ZJUENfU1lTQ1RM
PXkKIyBDT05GSUdfV0FUQ0hfUVVFVUUgaXMgbm90IHNldAojIENPTkZJR19DUk9TU19NRU1PUllf
QVRUQUNIIGlzIG5vdCBzZXQKQ09ORklHX1VTRUxJQj15CgojCiMgSVJRIHN1YnN5c3RlbQojCkNP
TkZJR19HRU5FUklDX0lSUV9QUk9CRT15CkNPTkZJR19HRU5FUklDX0lSUV9TSE9XPXkKQ09ORklH
X0dFTkVSSUNfSVJRX1NIT1dfTEVWRUw9eQpDT05GSUdfR0VORVJJQ19JUlFfRUZGRUNUSVZFX0FG
Rl9NQVNLPXkKQ09ORklHX0dFTkVSSUNfSVJRX01JR1JBVElPTj15CkNPTkZJR19HRU5FUklDX0lS
UV9JTkpFQ1RJT049eQpDT05GSUdfSEFSRElSUVNfU1dfUkVTRU5EPXkKQ09ORklHX0dFTkVSSUNf
SVJRX0NISVA9eQpDT05GSUdfSVJRX0RPTUFJTj15CkNPTkZJR19JUlFfU0lNPXkKQ09ORklHX0lS
UV9ET01BSU5fSElFUkFSQ0hZPXkKQ09ORklHX0lSUV9GQVNURU9JX0hJRVJBUkNIWV9IQU5ETEVS
Uz15CkNPTkZJR19HRU5FUklDX0lSUV9JUEk9eQpDT05GSUdfR0VORVJJQ19NU0lfSVJRPXkKQ09O
RklHX0dFTkVSSUNfTVNJX0lSUV9ET01BSU49eQpDT05GSUdfSVJRX0ZPUkNFRF9USFJFQURJTkc9
eQpDT05GSUdfU1BBUlNFX0lSUT15CkNPTkZJR19HRU5FUklDX0lSUV9ERUJVR0ZTPXkKIyBlbmQg
b2YgSVJRIHN1YnN5c3RlbQoKQ09ORklHX0dFTkVSSUNfSVJRX01VTFRJX0hBTkRMRVI9eQpDT05G
SUdfR0VORVJJQ19USU1FX1ZTWVNDQUxMPXkKQ09ORklHX0dFTkVSSUNfQ0xPQ0tFVkVOVFM9eQpD
T05GSUdfQVJDSF9IQVNfVElDS19CUk9BRENBU1Q9eQpDT05GSUdfR0VORVJJQ19DTE9DS0VWRU5U
U19CUk9BRENBU1Q9eQoKIwojIFRpbWVycyBzdWJzeXN0ZW0KIwpDT05GSUdfVElDS19PTkVTSE9U
PXkKQ09ORklHX05PX0haX0NPTU1PTj15CiMgQ09ORklHX0haX1BFUklPRElDIGlzIG5vdCBzZXQK
IyBDT05GSUdfTk9fSFpfSURMRSBpcyBub3Qgc2V0CkNPTkZJR19OT19IWl9GVUxMPXkKQ09ORklH
X0NPTlRFWFRfVFJBQ0tJTkc9eQojIENPTkZJR19DT05URVhUX1RSQUNLSU5HX0ZPUkNFIGlzIG5v
dCBzZXQKIyBDT05GSUdfTk9fSFogaXMgbm90IHNldAojIENPTkZJR19ISUdIX1JFU19USU1FUlMg
aXMgbm90IHNldAojIGVuZCBvZiBUaW1lcnMgc3Vic3lzdGVtCgpDT05GSUdfSEFWRV9FQlBGX0pJ
VD15CgojCiMgQlBGIHN1YnN5c3RlbQojCiMgQ09ORklHX0JQRl9TWVNDQUxMIGlzIG5vdCBzZXQK
IyBlbmQgb2YgQlBGIHN1YnN5c3RlbQoKQ09ORklHX1BSRUVNUFRfTk9ORV9CVUlMRD15CkNPTkZJ
R19QUkVFTVBUX05PTkU9eQojIENPTkZJR19QUkVFTVBUX1ZPTFVOVEFSWSBpcyBub3Qgc2V0CiMg
Q09ORklHX1BSRUVNUFQgaXMgbm90IHNldApDT05GSUdfUFJFRU1QVF9DT1VOVD15CgojCiMgQ1BV
L1Rhc2sgdGltZSBhbmQgc3RhdHMgYWNjb3VudGluZwojCkNPTkZJR19WSVJUX0NQVV9BQ0NPVU5U
SU5HPXkKQ09ORklHX1ZJUlRfQ1BVX0FDQ09VTlRJTkdfR0VOPXkKIyBDT05GSUdfSVJRX1RJTUVf
QUNDT1VOVElORyBpcyBub3Qgc2V0CiMgQ09ORklHX0JTRF9QUk9DRVNTX0FDQ1QgaXMgbm90IHNl
dApDT05GSUdfUFNJPXkKQ09ORklHX1BTSV9ERUZBVUxUX0RJU0FCTEVEPXkKIyBlbmQgb2YgQ1BV
L1Rhc2sgdGltZSBhbmQgc3RhdHMgYWNjb3VudGluZwoKQ09ORklHX0NQVV9JU09MQVRJT049eQoK
IwojIFJDVSBTdWJzeXN0ZW0KIwpDT05GSUdfVFJFRV9SQ1U9eQojIENPTkZJR19SQ1VfRVhQRVJU
IGlzIG5vdCBzZXQKQ09ORklHX1NSQ1U9eQpDT05GSUdfVFJFRV9TUkNVPXkKQ09ORklHX1RBU0tT
X1JDVV9HRU5FUklDPXkKQ09ORklHX1RBU0tTX1JDVT15CkNPTkZJR19UQVNLU19SVURFX1JDVT15
CkNPTkZJR19UQVNLU19UUkFDRV9SQ1U9eQpDT05GSUdfUkNVX1NUQUxMX0NPTU1PTj15CkNPTkZJ
R19SQ1VfTkVFRF9TRUdDQkxJU1Q9eQpDT05GSUdfUkNVX05PQ0JfQ1BVPXkKIyBlbmQgb2YgUkNV
IFN1YnN5c3RlbQoKQ09ORklHX0lLQ09ORklHPXkKQ09ORklHX0lLQ09ORklHX1BST0M9eQojIENP
TkZJR19JS0hFQURFUlMgaXMgbm90IHNldApDT05GSUdfTE9HX0JVRl9TSElGVD0xNwpDT05GSUdf
TE9HX0NQVV9NQVhfQlVGX1NISUZUPTEyCkNPTkZJR19QUklOVEtfU0FGRV9MT0dfQlVGX1NISUZU
PTEzCiMgQ09ORklHX1BSSU5US19JTkRFWCBpcyBub3Qgc2V0CkNPTkZJR19HRU5FUklDX1NDSEVE
X0NMT0NLPXkKCiMKIyBTY2hlZHVsZXIgZmVhdHVyZXMKIwojIGVuZCBvZiBTY2hlZHVsZXIgZmVh
dHVyZXMKCkNPTkZJR19DQ19JTVBMSUNJVF9GQUxMVEhST1VHSD0iLVdpbXBsaWNpdC1mYWxsdGhy
b3VnaD01IgpDT05GSUdfQ0dST1VQUz15CkNPTkZJR19QQUdFX0NPVU5URVI9eQpDT05GSUdfTUVN
Q0c9eQpDT05GSUdfTUVNQ0dfS01FTT15CiMgQ09ORklHX0JMS19DR1JPVVAgaXMgbm90IHNldApD
T05GSUdfQ0dST1VQX1NDSEVEPXkKQ09ORklHX0ZBSVJfR1JPVVBfU0NIRUQ9eQpDT05GSUdfQ0ZT
X0JBTkRXSURUSD15CkNPTkZJR19SVF9HUk9VUF9TQ0hFRD15CiMgQ09ORklHX0NHUk9VUF9QSURT
IGlzIG5vdCBzZXQKQ09ORklHX0NHUk9VUF9SRE1BPXkKIyBDT05GSUdfQ0dST1VQX0ZSRUVaRVIg
aXMgbm90IHNldAojIENPTkZJR19DUFVTRVRTIGlzIG5vdCBzZXQKQ09ORklHX0NHUk9VUF9ERVZJ
Q0U9eQojIENPTkZJR19DR1JPVVBfQ1BVQUNDVCBpcyBub3Qgc2V0CiMgQ09ORklHX0NHUk9VUF9Q
RVJGIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0dST1VQX01JU0MgaXMgbm90IHNldApDT05GSUdfQ0dS
T1VQX0RFQlVHPXkKQ09ORklHX05BTUVTUEFDRVM9eQojIENPTkZJR19VVFNfTlMgaXMgbm90IHNl
dAojIENPTkZJR19JUENfTlMgaXMgbm90IHNldApDT05GSUdfVVNFUl9OUz15CiMgQ09ORklHX1BJ
RF9OUyBpcyBub3Qgc2V0CkNPTkZJR19DSEVDS1BPSU5UX1JFU1RPUkU9eQpDT05GSUdfU0NIRURf
QVVUT0dST1VQPXkKIyBDT05GSUdfU1lTRlNfREVQUkVDQVRFRCBpcyBub3Qgc2V0CiMgQ09ORklH
X1JFTEFZIGlzIG5vdCBzZXQKQ09ORklHX0JMS19ERVZfSU5JVFJEPXkKQ09ORklHX0lOSVRSQU1G
U19TT1VSQ0U9IiIKQ09ORklHX1JEX0daSVA9eQpDT05GSUdfUkRfQlpJUDI9eQojIENPTkZJR19S
RF9MWk1BIGlzIG5vdCBzZXQKQ09ORklHX1JEX1haPXkKQ09ORklHX1JEX0xaTz15CiMgQ09ORklH
X1JEX0xaNCBpcyBub3Qgc2V0CiMgQ09ORklHX1JEX1pTVEQgaXMgbm90IHNldApDT05GSUdfQk9P
VF9DT05GSUc9eQpDT05GSUdfQ0NfT1BUSU1JWkVfRk9SX1BFUkZPUk1BTkNFPXkKIyBDT05GSUdf
Q0NfT1BUSU1JWkVfRk9SX1NJWkUgaXMgbm90IHNldApDT05GSUdfTERfT1JQSEFOX1dBUk49eQpD
T05GSUdfU1lTQ1RMPXkKQ09ORklHX0hBVkVfVUlEMTY9eQojIENPTkZJR19FWFBFUlQgaXMgbm90
IHNldApDT05GSUdfVUlEMTY9eQpDT05GSUdfTVVMVElVU0VSPXkKQ09ORklHX1NZU0ZTX1NZU0NB
TEw9eQpDT05GSUdfRkhBTkRMRT15CkNPTkZJR19QT1NJWF9USU1FUlM9eQpDT05GSUdfUFJJTlRL
PXkKQ09ORklHX0JVRz15CkNPTkZJR19FTEZfQ09SRT15CkNPTkZJR19CQVNFX0ZVTEw9eQpDT05G
SUdfRlVURVg9eQpDT05GSUdfRlVURVhfUEk9eQpDT05GSUdfRVBPTEw9eQpDT05GSUdfU0lHTkFM
RkQ9eQpDT05GSUdfVElNRVJGRD15CkNPTkZJR19FVkVOVEZEPXkKQ09ORklHX1NITUVNPXkKQ09O
RklHX0FJTz15CkNPTkZJR19JT19VUklORz15CkNPTkZJR19BRFZJU0VfU1lTQ0FMTFM9eQpDT05G
SUdfTUVNQkFSUklFUj15CkNPTkZJR19LQUxMU1lNUz15CkNPTkZJR19LQUxMU1lNU19BTEw9eQpD
T05GSUdfS0FMTFNZTVNfQkFTRV9SRUxBVElWRT15CkNPTkZJR19VU0VSRkFVTFRGRD15CkNPTkZJ
R19BUkNIX0hBU19NRU1CQVJSSUVSX1NZTkNfQ09SRT15CkNPTkZJR19LQ01QPXkKQ09ORklHX1JT
RVE9eQojIENPTkZJR19FTUJFRERFRCBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX1BFUkZfRVZFTlRT
PXkKQ09ORklHX1BFUkZfVVNFX1ZNQUxMT0M9eQoKIwojIEtlcm5lbCBQZXJmb3JtYW5jZSBFdmVu
dHMgQW5kIENvdW50ZXJzCiMKQ09ORklHX1BFUkZfRVZFTlRTPXkKIyBDT05GSUdfREVCVUdfUEVS
Rl9VU0VfVk1BTExPQyBpcyBub3Qgc2V0CiMgZW5kIG9mIEtlcm5lbCBQZXJmb3JtYW5jZSBFdmVu
dHMgQW5kIENvdW50ZXJzCgpDT05GSUdfVk1fRVZFTlRfQ09VTlRFUlM9eQojIENPTkZJR19DT01Q
QVRfQlJLIGlzIG5vdCBzZXQKQ09ORklHX1NMQUI9eQojIENPTkZJR19TTFVCIGlzIG5vdCBzZXQK
Q09ORklHX1NMQUJfTUVSR0VfREVGQVVMVD15CkNPTkZJR19TTEFCX0ZSRUVMSVNUX1JBTkRPTT15
CiMgQ09ORklHX1NMQUJfRlJFRUxJU1RfSEFSREVORUQgaXMgbm90IHNldApDT05GSUdfU0hVRkZM
RV9QQUdFX0FMTE9DQVRPUj15CkNPTkZJR19QUk9GSUxJTkc9eQpDT05GSUdfVFJBQ0VQT0lOVFM9
eQojIGVuZCBvZiBHZW5lcmFsIHNldHVwCgpDT05GSUdfQVJNPXkKQ09ORklHX0FSTV9IQVNfU0df
Q0hBSU49eQpDT05GSUdfU1lTX1NVUFBPUlRTX0FQTV9FTVVMQVRJT049eQpDT05GSUdfSEFWRV9U
Q009eQpDT05GSUdfSEFWRV9QUk9DX0NQVT15CkNPTkZJR19OT19JT1BPUlRfTUFQPXkKQ09ORklH
X1NUQUNLVFJBQ0VfU1VQUE9SVD15CkNPTkZJR19MT0NLREVQX1NVUFBPUlQ9eQpDT05GSUdfQVJD
SF9IQVNfQkFOREdBUD15CkNPTkZJR19GSVhfRUFSTFlDT05fTUVNPXkKQ09ORklHX0dFTkVSSUNf
SFdFSUdIVD15CkNPTkZJR19HRU5FUklDX0NBTElCUkFURV9ERUxBWT15CkNPTkZJR19BUkNIX1NV
UFBPUlRTX1VQUk9CRVM9eQpDT05GSUdfQVJNX1BBVENIX1BIWVNfVklSVD15CkNPTkZJR19HRU5F
UklDX0JVRz15CkNPTkZJR19QR1RBQkxFX0xFVkVMUz0yCgojCiMgU3lzdGVtIFR5cGUKIwpDT05G
SUdfTU1VPXkKQ09ORklHX0FSQ0hfTU1BUF9STkRfQklUU19NSU49OApDT05GSUdfQVJDSF9NTUFQ
X1JORF9CSVRTX01BWD0xNgpDT05GSUdfQVJDSF9NVUxUSVBMQVRGT1JNPXkKIyBDT05GSUdfQVJD
SF9GT09UQlJJREdFIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJDSF9JT1AzMlggaXMgbm90IHNldAoj
IENPTkZJR19BUkNIX0lYUDRYWCBpcyBub3Qgc2V0CiMgQ09ORklHX0FSQ0hfUFhBIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQVJDSF9TQTExMDAgaXMgbm90IHNldAojIENPTkZJR19BUkNIX1MzQzI0WFgg
aXMgbm90IHNldAojIENPTkZJR19BUkNIX09NQVAxIGlzIG5vdCBzZXQKCiMKIyBNdWx0aXBsZSBw
bGF0Zm9ybSBzZWxlY3Rpb24KIwoKIwojIENQVSBDb3JlIGZhbWlseSBzZWxlY3Rpb24KIwpDT05G
SUdfQVJDSF9NVUxUSV9WNj15CkNPTkZJR19BUkNIX01VTFRJX1Y3PXkKQ09ORklHX0FSQ0hfTVVM
VElfVjZfVjc9eQojIGVuZCBvZiBNdWx0aXBsZSBwbGF0Zm9ybSBzZWxlY3Rpb24KCkNPTkZJR19B
UkNIX1ZJUlQ9eQojIENPTkZJR19BUkNIX0FJUk9IQSBpcyBub3Qgc2V0CiMgQ09ORklHX0FSQ0hf
QUNUSU9OUyBpcyBub3Qgc2V0CiMgQ09ORklHX0FSQ0hfQUxQSU5FIGlzIG5vdCBzZXQKIyBDT05G
SUdfQVJDSF9BUlRQRUMgaXMgbm90IHNldAojIENPTkZJR19BUkNIX0FTUEVFRCBpcyBub3Qgc2V0
CkNPTkZJR19BUkNIX0FUOTE9eQojIENPTkZJR19TT0NfU0FNQTVEMiBpcyBub3Qgc2V0CkNPTkZJ
R19TT0NfU0FNQTVEMz15CiMgQ09ORklHX1NPQ19TQU1BNUQ0IGlzIG5vdCBzZXQKIyBDT05GSUdf
U09DX1NBTUE3RzUgaXMgbm90IHNldApDT05GSUdfU09DX0xBTjk2Nj15CgojCiMgQ2xvY2tzb3Vy
Y2UgZHJpdmVyIHNlbGVjdGlvbgojCiMgQ09ORklHX0FUTUVMX0NMT0NLU09VUkNFX1BJVCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0FUTUVMX0NMT0NLU09VUkNFX1RDQiBpcyBub3Qgc2V0CkNPTkZJR19I
QVZFX0FUOTFfVVRNST15CkNPTkZJR19IQVZFX0FUOTFfVVNCX0NMSz15CkNPTkZJR19DT01NT05f
Q0xLX0FUOTE9eQpDT05GSUdfSEFWRV9BVDkxX1NNRD15CkNPTkZJR19TT0NfU0FNX1Y3PXkKQ09O
RklHX1NPQ19TQU1BNT15CkNPTkZJR19BVE1FTF9QTT15CiMgQ09ORklHX0FSQ0hfQkNNIGlzIG5v
dCBzZXQKQ09ORklHX0FSQ0hfQkVSTElOPXkKQ09ORklHX01BQ0hfQkVSTElOX0JHMj15CkNPTkZJ
R19NQUNIX0JFUkxJTl9CRzJDRD15CiMgQ09ORklHX01BQ0hfQkVSTElOX0JHMlEgaXMgbm90IHNl
dAojIENPTkZJR19BUkNIX0NOUzNYWFggaXMgbm90IHNldApDT05GSUdfQVJDSF9ESUdJQ09MT1I9
eQpDT05GSUdfQVJDSF9ET1ZFPXkKIyBDT05GSUdfTUFDSF9ET1ZFX0RCIGlzIG5vdCBzZXQKIyBD
T05GSUdfTUFDSF9DTV9BNTEwIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfRVhZTk9TPXkKQ09ORklH
X1M1UF9ERVZfTUZDPXkKQ09ORklHX0FSQ0hfRVhZTk9TMz15CiMgQ09ORklHX0FSQ0hfRVhZTk9T
NCBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0VYWU5PUzU9eQoKIwojIEV4eW5vcyBTb0NzCiMKQ09O
RklHX1NPQ19FWFlOT1MzMjUwPXkKQ09ORklHX1NPQ19FWFlOT1M1MjUwPXkKQ09ORklHX1NPQ19F
WFlOT1M1MjYwPXkKIyBDT05GSUdfU09DX0VYWU5PUzU0MTAgaXMgbm90IHNldAojIENPTkZJR19T
T0NfRVhZTk9TNTQyMCBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0hJR0hCQU5LPXkKQ09ORklHX0FS
Q0hfSElTST15CgojCiMgSGlzaWxpY29uIHBsYXRmb3JtIHR5cGUKIwpDT05GSUdfQVJDSF9ISTN4
eHg9eQojIENPTkZJR19BUkNIX0hJUDAxIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJDSF9ISVAwNCBp
cyBub3Qgc2V0CiMgQ09ORklHX0FSQ0hfSElYNUhEMiBpcyBub3Qgc2V0CiMgZW5kIG9mIEhpc2ls
aWNvbiBwbGF0Zm9ybSB0eXBlCgojIENPTkZJR19BUkNIX01YQyBpcyBub3Qgc2V0CkNPTkZJR19B
UkNIX0tFWVNUT05FPXkKIyBDT05GSUdfQVJDSF9NRURJQVRFSyBpcyBub3Qgc2V0CkNPTkZJR19B
UkNIX01FU09OPXkKIyBDT05GSUdfTUFDSF9NRVNPTjYgaXMgbm90IHNldAojIENPTkZJR19NQUNI
X01FU09OOCBpcyBub3Qgc2V0CiMgQ09ORklHX0FSQ0hfTUlMQkVBVVQgaXMgbm90IHNldAojIENP
TkZJR19BUkNIX01NUCBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX01TVEFSVjc9eQojIENPTkZJR19N
QUNIX0lORklOSVRZIGlzIG5vdCBzZXQKQ09ORklHX01BQ0hfTUVSQ1VSWT15CiMgQ09ORklHX0FS
Q0hfTVZFQlUgaXMgbm90IHNldApDT05GSUdfQVJDSF9OUENNPXkKQ09ORklHX0FSQ0hfTlBDTTdY
WD15CkNPTkZJR19BUkNIX09NQVA9eQoKIwojIFRJIE9NQVAgQ29tbW9uIEZlYXR1cmVzCiMKCiMK
IyBPTUFQIEZlYXR1cmUgU2VsZWN0aW9ucwojCiMgQ09ORklHX09NQVBfUkVTRVRfQ0xPQ0tTIGlz
IG5vdCBzZXQKQ09ORklHX09NQVBfMzJLX1RJTUVSPXkKIyBlbmQgb2YgVEkgT01BUCBDb21tb24g
RmVhdHVyZXMKCkNPTkZJR19NQUNIX09NQVBfR0VORVJJQz15CgojCiMgVEkgT01BUC9BTS9ETS9E
UkEgRmFtaWx5CiMKIyBDT05GSUdfQVJDSF9PTUFQMiBpcyBub3Qgc2V0CiMgQ09ORklHX0FSQ0hf
T01BUDMgaXMgbm90IHNldAojIENPTkZJR19BUkNIX09NQVA0IGlzIG5vdCBzZXQKIyBDT05GSUdf
U09DX09NQVA1IGlzIG5vdCBzZXQKIyBDT05GSUdfU09DX0FNMzNYWCBpcyBub3Qgc2V0CkNPTkZJ
R19TT0NfQU00M1hYPXkKQ09ORklHX1NPQ19EUkE3WFg9eQpDT05GSUdfQVJDSF9PTUFQMlBMVVM9
eQpDT05GSUdfT01BUF9JTlRFUkNPTk5FQ1RfQkFSUklFUj15CgojCiMgVEkgT01BUDIvMy80IFNw
ZWNpZmljIEZlYXR1cmVzCiMKQ09ORklHX0FSQ0hfT01BUDJQTFVTX1RZUElDQUw9eQpDT05GSUdf
U09DX0hBU19PTUFQMl9TRFJDPXkKIyBDT05GSUdfU09DX0hBU19SRUFMVElNRV9DT1VOVEVSIGlz
IG5vdCBzZXQKCiMKIyBPTUFQIExlZ2FjeSBQbGF0Zm9ybSBEYXRhIEJvYXJkIFR5cGUKIwojIGVu
ZCBvZiBUSSBPTUFQMi8zLzQgU3BlY2lmaWMgRmVhdHVyZXMKCkNPTkZJR19PTUFQNV9FUlJBVEFf
ODAxODE5PXkKIyBlbmQgb2YgVEkgT01BUC9BTS9ETS9EUkEgRmFtaWx5CgojIENPTkZJR19BUkNI
X09YTkFTIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfUUNPTT15CiMgQ09ORklHX0FSQ0hfSVBRNDBY
WCBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX01TTThYNjA9eQojIENPTkZJR19BUkNIX01TTTg5MTYg
aXMgbm90IHNldApDT05GSUdfQVJDSF9NU004OTYwPXkKQ09ORklHX0FSQ0hfTVNNODk3ND15CiMg
Q09ORklHX0FSQ0hfTURNOTYxNSBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX1JEQT15CiMgQ09ORklH
X0FSQ0hfUkVBTFRFSyBpcyBub3Qgc2V0CiMgQ09ORklHX0FSQ0hfUk9DS0NISVAgaXMgbm90IHNl
dAojIENPTkZJR19BUkNIX1MzQzY0WFggaXMgbm90IHNldAojIENPTkZJR19BUkNIX1M1UFYyMTAg
aXMgbm90IHNldApDT05GSUdfQVJDSF9SRU5FU0FTPXkKQ09ORklHX0FSQ0hfSU5URUxfU09DRlBH
QT15CiMgQ09ORklHX1NPQ0ZQR0FfU1VTUEVORCBpcyBub3Qgc2V0CkNPTkZJR19QTEFUX1NQRUFS
PXkKIyBDT05GSUdfQVJDSF9TUEVBUjEzWFggaXMgbm90IHNldAojIENPTkZJR19BUkNIX1NUSSBp
cyBub3Qgc2V0CkNPTkZJR19BUkNIX1NUTTMyPXkKQ09ORklHX01BQ0hfU1RNMzJNUDE1Nz15CkNP
TkZJR19NQUNIX1NUTTMyTVAxMz15CkNPTkZJR19BUkNIX1NVTlhJPXkKIyBDT05GSUdfTUFDSF9T
VU40SSBpcyBub3Qgc2V0CiMgQ09ORklHX01BQ0hfU1VONUkgaXMgbm90IHNldAojIENPTkZJR19N
QUNIX1NVTjZJIGlzIG5vdCBzZXQKIyBDT05GSUdfTUFDSF9TVU43SSBpcyBub3Qgc2V0CiMgQ09O
RklHX01BQ0hfU1VOOEkgaXMgbm90IHNldApDT05GSUdfTUFDSF9TVU45ST15CkNPTkZJR19BUkNI
X1NVTlhJX01DX1NNUD15CiMgQ09ORklHX0FSQ0hfVEVHUkEgaXMgbm90IHNldAojIENPTkZJR19B
UkNIX1VOSVBISUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJDSF9VODUwMCBpcyBub3Qgc2V0CiMg
Q09ORklHX0FSQ0hfSU5URUdSQVRPUiBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX1JFQUxWSUVXPXkK
IyBDT05GSUdfTUFDSF9SRUFMVklFV19FQiBpcyBub3Qgc2V0CiMgQ09ORklHX01BQ0hfUkVBTFZJ
RVdfUEIxMU1QIGlzIG5vdCBzZXQKIyBDT05GSUdfTUFDSF9SRUFMVklFV19QQjExNzYgaXMgbm90
IHNldApDT05GSUdfTUFDSF9SRUFMVklFV19QQkE4PXkKIyBDT05GSUdfTUFDSF9SRUFMVklFV19Q
QlggaXMgbm90IHNldAojIENPTkZJR19BUkNIX1ZFWFBSRVNTIGlzIG5vdCBzZXQKQ09ORklHX0FS
Q0hfVlQ4NTAwPXkKQ09ORklHX0FSQ0hfV004NzUwPXkKIyBDT05GSUdfQVJDSF9XTTg4NTAgaXMg
bm90IHNldAojIENPTkZJR19BUkNIX1pZTlEgaXMgbm90IHNldApDT05GSUdfUExBVF9PUklPTj15
CkNPTkZJR19QTEFUX09SSU9OX0xFR0FDWT15CkNPTkZJR19QTEFUX1ZFUlNBVElMRT15CgojCiMg
UHJvY2Vzc29yIFR5cGUKIwpDT05GSUdfQ1BVX1BKND15CkNPTkZJR19DUFVfUEo0Qj15CkNPTkZJ
R19DUFVfVjZLPXkKQ09ORklHX0NQVV9WNz15CkNPTkZJR19DUFVfVEhVTUJfQ0FQQUJMRT15CkNP
TkZJR19DUFVfMzJ2Nj15CkNPTkZJR19DUFVfMzJ2Nks9eQpDT05GSUdfQ1BVXzMydjc9eQpDT05G
SUdfQ1BVX0FCUlRfRVY2PXkKQ09ORklHX0NQVV9BQlJUX0VWNz15CkNPTkZJR19DUFVfUEFCUlRf
VjY9eQpDT05GSUdfQ1BVX1BBQlJUX1Y3PXkKQ09ORklHX0NQVV9DQUNIRV9WNj15CkNPTkZJR19D
UFVfQ0FDSEVfVjc9eQpDT05GSUdfQ1BVX0NBQ0hFX1ZJUFQ9eQpDT05GSUdfQ1BVX0NPUFlfVjY9
eQpDT05GSUdfQ1BVX1RMQl9WNj15CkNPTkZJR19DUFVfVExCX1Y3PXkKQ09ORklHX0NQVV9IQVNf
QVNJRD15CkNPTkZJR19DUFVfQ1AxNT15CkNPTkZJR19DUFVfQ1AxNV9NTVU9eQoKIwojIFByb2Nl
c3NvciBGZWF0dXJlcwojCkNPTkZJR19BUk1fVEhVTUI9eQpDT05GSUdfQVJNX1RIVU1CRUU9eQpD
T05GSUdfQVJNX1ZJUlRfRVhUPXkKQ09ORklHX1NXUF9FTVVMQVRFPXkKIyBDT05GSUdfQ1BVX0JJ
R19FTkRJQU4gaXMgbm90IHNldAojIENPTkZJR19DUFVfSUNBQ0hFX0RJU0FCTEUgaXMgbm90IHNl
dAojIENPTkZJR19DUFVfSUNBQ0hFX01JU01BVENIX1dPUktBUk9VTkQgaXMgbm90IHNldApDT05G
SUdfQ1BVX0JQUkVESUNUX0RJU0FCTEU9eQpDT05GSUdfQ1BVX1NQRUNUUkU9eQpDT05GSUdfSEFS
REVOX0JSQU5DSF9QUkVESUNUT1I9eQpDT05GSUdfSEFSREVOX0JSQU5DSF9ISVNUT1JZPXkKQ09O
RklHX0tVU0VSX0hFTFBFUlM9eQpDT05GSUdfVkRTTz15CkNPTkZJR19ETUFfQ0FDSEVfUldGTz15
CkNPTkZJR19PVVRFUl9DQUNIRT15CkNPTkZJR19PVVRFUl9DQUNIRV9TWU5DPXkKQ09ORklHX01J
R0hUX0hBVkVfQ0FDSEVfTDJYMD15CkNPTkZJR19DQUNIRV9MMlgwPXkKIyBDT05GSUdfQ0FDSEVf
TDJYMF9QTVUgaXMgbm90IHNldApDT05GSUdfUEwzMTBfRVJSQVRBXzU4ODM2OT15CkNPTkZJR19Q
TDMxMF9FUlJBVEFfNzI3OTE1PXkKIyBDT05GSUdfUEwzMTBfRVJSQVRBXzc1Mzk3MCBpcyBub3Qg
c2V0CkNPTkZJR19QTDMxMF9FUlJBVEFfNzY5NDE5PXkKQ09ORklHX0NBQ0hFX1RBVVJPUzI9eQpD
T05GSUdfQVJNX0wxX0NBQ0hFX1NISUZUXzY9eQpDT05GSUdfQVJNX0wxX0NBQ0hFX1NISUZUPTYK
Q09ORklHX0FSTV9ETUFfTUVNX0JVRkZFUkFCTEU9eQpDT05GSUdfQVJNX0hFQVZZX01CPXkKQ09O
RklHX0FSQ0hfU1VQUE9SVFNfQklHX0VORElBTj15CkNPTkZJR19ERUJVR19BTElHTl9ST0RBVEE9
eQpDT05GSUdfSVdNTVhUPXkKIyBDT05GSUdfQVJNX0VSUkFUQV80MTE5MjAgaXMgbm90IHNldAoj
IENPTkZJR19BUk1fRVJSQVRBXzQzMDk3MyBpcyBub3Qgc2V0CiMgQ09ORklHX0FSTV9FUlJBVEFf
NjQzNzE5IGlzIG5vdCBzZXQKQ09ORklHX0FSTV9FUlJBVEFfNzIwNzg5PXkKQ09ORklHX0FSTV9F
UlJBVEFfNzU0MzIyPXkKIyBDT05GSUdfQVJNX0VSUkFUQV83NTQzMjcgaXMgbm90IHNldApDT05G
SUdfQVJNX0VSUkFUQV83NjQzNjk9eQpDT05GSUdfQVJNX0VSUkFUQV83NzU0MjA9eQpDT05GSUdf
QVJNX0VSUkFUQV83OTgxODE9eQojIENPTkZJR19BUk1fRVJSQVRBXzc3MzAyMiBpcyBub3Qgc2V0
CkNPTkZJR19BUk1fRVJSQVRBXzgxODMyNV84NTI0MjI9eQojIENPTkZJR19BUk1fRVJSQVRBXzgy
MTQyMCBpcyBub3Qgc2V0CiMgQ09ORklHX0FSTV9FUlJBVEFfODI1NjE5IGlzIG5vdCBzZXQKIyBD
T05GSUdfQVJNX0VSUkFUQV84NTcyNzEgaXMgbm90IHNldApDT05GSUdfQVJNX0VSUkFUQV84NTI0
MjE9eQpDT05GSUdfQVJNX0VSUkFUQV84NTI0MjM9eQpDT05GSUdfQVJNX0VSUkFUQV84NTcyNzI9
eQojIGVuZCBvZiBTeXN0ZW0gVHlwZQoKIwojIEJ1cyBzdXBwb3J0CiMKQ09ORklHX0FSTV9FUlJB
VEFfODE0MjIwPXkKIyBlbmQgb2YgQnVzIHN1cHBvcnQKCiMKIyBLZXJuZWwgRmVhdHVyZXMKIwpD
T05GSUdfSEFWRV9TTVA9eQpDT05GSUdfU01QPXkKIyBDT05GSUdfU01QX09OX1VQIGlzIG5vdCBz
ZXQKQ09ORklHX0NVUlJFTlRfUE9JTlRFUl9JTl9UUElEUlVSTz15CkNPTkZJR19JUlFTVEFDS1M9
eQojIENPTkZJR19BUk1fQ1BVX1RPUE9MT0dZIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfQVJNX1ND
VT15CkNPTkZJR19IQVZFX0FSTV9BUkNIX1RJTUVSPXkKQ09ORklHX0hBVkVfQVJNX1RXRD15CkNP
TkZJR19NQ1BNPXkKQ09ORklHX0JJR19MSVRUTEU9eQojIENPTkZJR19CTF9TV0lUQ0hFUiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1ZNU1BMSVRfM0cgaXMgbm90IHNldApDT05GSUdfVk1TUExJVF8zR19P
UFQ9eQojIENPTkZJR19WTVNQTElUXzJHIGlzIG5vdCBzZXQKIyBDT05GSUdfVk1TUExJVF8xRyBp
cyBub3Qgc2V0CkNPTkZJR19QQUdFX09GRlNFVD0weEIwMDAwMDAwCkNPTkZJR19OUl9DUFVTPTQK
Q09ORklHX0hPVFBMVUdfQ1BVPXkKQ09ORklHX0FSTV9QU0NJPXkKQ09ORklHX0FSQ0hfTlJfR1BJ
Tz0yMDQ4CkNPTkZJR19IWl9GSVhFRD0wCiMgQ09ORklHX0haXzEwMCBpcyBub3Qgc2V0CkNPTkZJ
R19IWl8yMDA9eQojIENPTkZJR19IWl8yNTAgaXMgbm90IHNldAojIENPTkZJR19IWl8zMDAgaXMg
bm90IHNldAojIENPTkZJR19IWl81MDAgaXMgbm90IHNldAojIENPTkZJR19IWl8xMDAwIGlzIG5v
dCBzZXQKQ09ORklHX0haPTIwMApDT05GSUdfQVJNX1BBVENIX0lESVY9eQpDT05GSUdfQUVBQkk9
eQpDT05GSUdfT0FCSV9DT01QQVQ9eQpDT05GSUdfQVJDSF9TRUxFQ1RfTUVNT1JZX01PREVMPXkK
Q09ORklHX0FSQ0hfRkxBVE1FTV9FTkFCTEU9eQpDT05GSUdfQVJDSF9TUEFSU0VNRU1fRU5BQkxF
PXkKQ09ORklHX0hJR0hNRU09eQpDT05GSUdfSElHSFBURT15CkNPTkZJR19DUFVfU1dfRE9NQUlO
X1BBTj15CkNPTkZJR19IV19QRVJGX0VWRU5UUz15CkNPTkZJR19GT1JDRV9NQVhfWk9ORU9SREVS
PTExCkNPTkZJR19BTElHTk1FTlRfVFJBUD15CiMgQ09ORklHX1VBQ0NFU1NfV0lUSF9NRU1DUFkg
aXMgbm90IHNldAojIENPTkZJR19QQVJBVklSVCBpcyBub3Qgc2V0CiMgQ09ORklHX1BBUkFWSVJU
X1RJTUVfQUNDT1VOVElORyBpcyBub3Qgc2V0CiMgQ09ORklHX1hFTiBpcyBub3Qgc2V0CkNPTkZJ
R19DQ19IQVZFX1NUQUNLUFJPVEVDVE9SX1RMUz15CiMgZW5kIG9mIEtlcm5lbCBGZWF0dXJlcwoK
IwojIEJvb3Qgb3B0aW9ucwojCkNPTkZJR19VU0VfT0Y9eQpDT05GSUdfQVRBR1M9eQojIENPTkZJ
R19ERVBSRUNBVEVEX1BBUkFNX1NUUlVDVCBpcyBub3Qgc2V0CkNPTkZJR19aQk9PVF9ST01fVEVY
VD0weDAKQ09ORklHX1pCT09UX1JPTV9CU1M9MHgwCkNPTkZJR19BUk1fQVBQRU5ERURfRFRCPXkK
IyBDT05GSUdfQVJNX0FUQUdfRFRCX0NPTVBBVCBpcyBub3Qgc2V0CkNPTkZJR19DTURMSU5FPSIi
CiMgQ09ORklHX0NSQVNIX0RVTVAgaXMgbm90IHNldApDT05GSUdfQVVUT19aUkVMQUREUj15CiMg
Q09ORklHX0VGSSBpcyBub3Qgc2V0CiMgZW5kIG9mIEJvb3Qgb3B0aW9ucwoKIwojIENQVSBQb3dl
ciBNYW5hZ2VtZW50CiMKCiMKIyBDUFUgRnJlcXVlbmN5IHNjYWxpbmcKIwpDT05GSUdfQ1BVX0ZS
RVE9eQpDT05GSUdfQ1BVX0ZSRVFfR09WX0FUVFJfU0VUPXkKQ09ORklHX0NQVV9GUkVRX0dPVl9D
T01NT049eQojIENPTkZJR19DUFVfRlJFUV9TVEFUIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BVX0ZS
RVFfREVGQVVMVF9HT1ZfUEVSRk9STUFOQ0UgaXMgbm90IHNldAojIENPTkZJR19DUFVfRlJFUV9E
RUZBVUxUX0dPVl9QT1dFUlNBVkUgaXMgbm90IHNldApDT05GSUdfQ1BVX0ZSRVFfREVGQVVMVF9H
T1ZfVVNFUlNQQUNFPXkKIyBDT05GSUdfQ1BVX0ZSRVFfREVGQVVMVF9HT1ZfT05ERU1BTkQgaXMg
bm90IHNldAojIENPTkZJR19DUFVfRlJFUV9ERUZBVUxUX0dPVl9DT05TRVJWQVRJVkUgaXMgbm90
IHNldAojIENPTkZJR19DUFVfRlJFUV9ERUZBVUxUX0dPVl9TQ0hFRFVUSUwgaXMgbm90IHNldApD
T05GSUdfQ1BVX0ZSRVFfR09WX1BFUkZPUk1BTkNFPXkKIyBDT05GSUdfQ1BVX0ZSRVFfR09WX1BP
V0VSU0FWRSBpcyBub3Qgc2V0CkNPTkZJR19DUFVfRlJFUV9HT1ZfVVNFUlNQQUNFPXkKIyBDT05G
SUdfQ1BVX0ZSRVFfR09WX09OREVNQU5EIGlzIG5vdCBzZXQKQ09ORklHX0NQVV9GUkVRX0dPVl9D
T05TRVJWQVRJVkU9eQojIENPTkZJR19DUFVfRlJFUV9HT1ZfU0NIRURVVElMIGlzIG5vdCBzZXQK
CiMKIyBDUFUgZnJlcXVlbmN5IHNjYWxpbmcgZHJpdmVycwojCiMgQ09ORklHX0NQVUZSRVFfRFQg
aXMgbm90IHNldApDT05GSUdfQVJNX0FMTFdJTk5FUl9TVU41MElfQ1BVRlJFUV9OVk1FTT15CkNP
TkZJR19BUk1fU0NQSV9DUFVGUkVRPXkKQ09ORklHX0FSTV9CUkNNU1RCX0FWU19DUFVGUkVRPXkK
Q09ORklHX0FSTV9NRURJQVRFS19DUFVGUkVRX0hXPXkKIyBDT05GSUdfQVJNX09NQVAyUExVU19D
UFVGUkVRIGlzIG5vdCBzZXQKQ09ORklHX0FSTV9RQ09NX0NQVUZSRVFfTlZNRU09eQpDT05GSUdf
QVJNX1FDT01fQ1BVRlJFUV9IVz15CiMgQ09ORklHX0FSTV9SQVNQQkVSUllQSV9DUFVGUkVRIGlz
IG5vdCBzZXQKQ09ORklHX0FSTV9TQ01JX0NQVUZSRVE9eQpDT05GSUdfQVJNX1NQRUFSX0NQVUZS
RVE9eQpDT05GSUdfQVJNX1RJX0NQVUZSRVE9eQojIENPTkZJR19RT1JJUV9DUFVGUkVRIGlzIG5v
dCBzZXQKIyBlbmQgb2YgQ1BVIEZyZXF1ZW5jeSBzY2FsaW5nCgojCiMgQ1BVIElkbGUKIwpDT05G
SUdfQ1BVX0lETEU9eQpDT05GSUdfQ1BVX0lETEVfR09WX0xBRERFUj15CiMgQ09ORklHX0NQVV9J
RExFX0dPVl9NRU5VIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BVX0lETEVfR09WX1RFTyBpcyBub3Qg
c2V0CgojCiMgQVJNIENQVSBJZGxlIERyaXZlcnMKIwojIENPTkZJR19BUk1fQ1BVSURMRSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0FSTV9QU0NJX0NQVUlETEUgaXMgbm90IHNldAojIENPTkZJR19BUk1f
QklHX0xJVFRMRV9DUFVJRExFIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJNX0NMUFM3MTFYX0NQVUlE
TEUgaXMgbm90IHNldApDT05GSUdfQVJNX0hJR0hCQU5LX0NQVUlETEU9eQojIENPTkZJR19BUk1f
S0lSS1dPT0RfQ1BVSURMRSBpcyBub3Qgc2V0CiMgQ09ORklHX0FSTV9aWU5RX0NQVUlETEUgaXMg
bm90IHNldApDT05GSUdfQVJNX0FUOTFfQ1BVSURMRT15CiMgQ09ORklHX0FSTV9FWFlOT1NfQ1BV
SURMRSBpcyBub3Qgc2V0CiMgQ09ORklHX0FSTV9NVkVCVV9WN19DUFVJRExFIGlzIG5vdCBzZXQK
IyBDT05GSUdfQVJNX1RFR1JBX0NQVUlETEUgaXMgbm90IHNldAojIENPTkZJR19BUk1fUUNPTV9T
UE1fQ1BVSURMRSBpcyBub3Qgc2V0CiMgZW5kIG9mIEFSTSBDUFUgSWRsZSBEcml2ZXJzCiMgZW5k
IG9mIENQVSBJZGxlCiMgZW5kIG9mIENQVSBQb3dlciBNYW5hZ2VtZW50CgojCiMgRmxvYXRpbmcg
cG9pbnQgZW11bGF0aW9uCiMKCiMKIyBBdCBsZWFzdCBvbmUgZW11bGF0aW9uIG11c3QgYmUgc2Vs
ZWN0ZWQKIwpDT05GSUdfRlBFX05XRlBFPXkKQ09ORklHX0ZQRV9OV0ZQRV9YUD15CkNPTkZJR19G
UEVfRkFTVEZQRT15CkNPTkZJR19WRlA9eQpDT05GSUdfVkZQdjM9eQpDT05GSUdfTkVPTj15CkNP
TkZJR19LRVJORUxfTU9ERV9ORU9OPXkKIyBlbmQgb2YgRmxvYXRpbmcgcG9pbnQgZW11bGF0aW9u
CgojCiMgUG93ZXIgbWFuYWdlbWVudCBvcHRpb25zCiMKIyBDT05GSUdfU1VTUEVORCBpcyBub3Qg
c2V0CkNPTkZJR19QTT15CkNPTkZJR19QTV9ERUJVRz15CiMgQ09ORklHX1BNX0FEVkFOQ0VEX0RF
QlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfQVBNX0VNVUxBVElPTiBpcyBub3Qgc2V0CkNPTkZJR19Q
TV9DTEs9eQpDT05GSUdfUE1fR0VORVJJQ19ET01BSU5TPXkKQ09ORklHX1dRX1BPV0VSX0VGRklD
SUVOVF9ERUZBVUxUPXkKQ09ORklHX1BNX0dFTkVSSUNfRE9NQUlOU19PRj15CkNPTkZJR19DUFVf
UE09eQpDT05GSUdfRU5FUkdZX01PREVMPXkKQ09ORklHX0FSQ0hfU1VTUEVORF9QT1NTSUJMRT15
CkNPTkZJR19BUk1fQ1BVX1NVU1BFTkQ9eQpDT05GSUdfQVJDSF9ISUJFUk5BVElPTl9QT1NTSUJM
RT15CiMgZW5kIG9mIFBvd2VyIG1hbmFnZW1lbnQgb3B0aW9ucwoKIyBDT05GSUdfQVJNX0NSWVBU
TyBpcyBub3Qgc2V0CkNPTkZJR19BU19WRlBfVk1SU19GUElOU1Q9eQoKIwojIEdlbmVyYWwgYXJj
aGl0ZWN0dXJlLWRlcGVuZGVudCBvcHRpb25zCiMKIyBDT05GSUdfSlVNUF9MQUJFTCBpcyBub3Qg
c2V0CkNPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTPXkKQ09ORklHX0FSQ0hf
VVNFX0JVSUxUSU5fQlNXQVA9eQpDT05GSUdfSEFWRV9LUFJPQkVTPXkKQ09ORklHX0hBVkVfS1JF
VFBST0JFUz15CkNPTkZJR19IQVZFX09QVFBST0JFUz15CkNPTkZJR19IQVZFX05NST15CkNPTkZJ
R19UUkFDRV9JUlFGTEFHU19TVVBQT1JUPXkKQ09ORklHX0hBVkVfQVJDSF9UUkFDRUhPT0s9eQpD
T05GSUdfSEFWRV9ETUFfQ09OVElHVU9VUz15CkNPTkZJR19HRU5FUklDX1NNUF9JRExFX1RIUkVB
RD15CkNPTkZJR19HRU5FUklDX0lETEVfUE9MTF9TRVRVUD15CkNPTkZJR19BUkNIX0hBU19GT1JU
SUZZX1NPVVJDRT15CkNPTkZJR19BUkNIX0hBU19LRUVQSU5JVFJEPXkKQ09ORklHX0FSQ0hfSEFT
X1NFVF9NRU1PUlk9eQpDT05GSUdfSEFWRV9BUkNIX1RIUkVBRF9TVFJVQ1RfV0hJVEVMSVNUPXkK
Q09ORklHX0FSQ0hfMzJCSVRfT0ZGX1Q9eQpDT05GSUdfSEFWRV9SRUdTX0FORF9TVEFDS19BQ0NF
U1NfQVBJPXkKQ09ORklHX0hBVkVfUlNFUT15CkNPTkZJR19IQVZFX0hXX0JSRUFLUE9JTlQ9eQpD
T05GSUdfSEFWRV9QRVJGX1JFR1M9eQpDT05GSUdfSEFWRV9QRVJGX1VTRVJfU1RBQ0tfRFVNUD15
CkNPTkZJR19IQVZFX0FSQ0hfSlVNUF9MQUJFTD15CkNPTkZJR19BUkNIX0hBVkVfTk1JX1NBRkVf
Q01QWENIRz15CkNPTkZJR19BUkNIX1dBTlRfSVBDX1BBUlNFX1ZFUlNJT049eQpDT05GSUdfSEFW
RV9BUkNIX1NFQ0NPTVA9eQojIENPTkZJR19TRUNDT01QIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVf
U1RBQ0tQUk9URUNUT1I9eQojIENPTkZJR19TVEFDS1BST1RFQ1RPUiBpcyBub3Qgc2V0CkNPTkZJ
R19MVE9fTk9ORT15CkNPTkZJR19IQVZFX0NPTlRFWFRfVFJBQ0tJTkc9eQpDT05GSUdfSEFWRV9W
SVJUX0NQVV9BQ0NPVU5USU5HX0dFTj15CkNPTkZJR19IQVZFX0lSUV9USU1FX0FDQ09VTlRJTkc9
eQpDT05GSUdfSEFWRV9NT0RfQVJDSF9TUEVDSUZJQz15CkNPTkZJR19NT0RVTEVTX1VTRV9FTEZf
UkVMPXkKQ09ORklHX0hBVkVfSVJRX0VYSVRfT05fSVJRX1NUQUNLPXkKQ09ORklHX0hBVkVfU09G
VElSUV9PTl9PV05fU1RBQ0s9eQpDT05GSUdfQVJDSF9IQVNfRUxGX1JBTkRPTUlaRT15CkNPTkZJ
R19IQVZFX0FSQ0hfTU1BUF9STkRfQklUUz15CkNPTkZJR19IQVZFX0VYSVRfVEhSRUFEPXkKQ09O
RklHX0FSQ0hfTU1BUF9STkRfQklUUz04CkNPTkZJR19QQUdFX1NJWkVfTEVTU19USEFOXzY0S0I9
eQpDT05GSUdfUEFHRV9TSVpFX0xFU1NfVEhBTl8yNTZLQj15CkNPTkZJR19BUkNIX1dBTlRfREVG
QVVMVF9UT1BET1dOX01NQVBfTEFZT1VUPXkKQ09ORklHX0NMT05FX0JBQ0tXQVJEUz15CkNPTkZJ
R19PTERfU0lHU1VTUEVORDM9eQpDT05GSUdfT0xEX1NJR0FDVElPTj15CiMgQ09ORklHX0NPTVBB
VF8zMkJJVF9USU1FIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfT1BUSU9OQUxfS0VSTkVMX1JXWD15
CkNPTkZJR19BUkNIX09QVElPTkFMX0tFUk5FTF9SV1hfREVGQVVMVD15CkNPTkZJR19BUkNIX0hB
U19TVFJJQ1RfS0VSTkVMX1JXWD15CkNPTkZJR19TVFJJQ1RfS0VSTkVMX1JXWD15CkNPTkZJR19B
UkNIX0hBU19TVFJJQ1RfTU9EVUxFX1JXWD15CkNPTkZJR19BUkNIX0hBU19QSFlTX1RPX0RNQT15
CkNPTkZJR19MT0NLX0VWRU5UX0NPVU5UUz15CkNPTkZJR19BUkNIX1dBTlRfTERfT1JQSEFOX1dB
Uk49eQpDT05GSUdfSEFWRV9BUkNIX1BGTl9WQUxJRD15CgojCiMgR0NPVi1iYXNlZCBrZXJuZWwg
cHJvZmlsaW5nCiMKIyBDT05GSUdfR0NPVl9LRVJORUwgaXMgbm90IHNldApDT05GSUdfQVJDSF9I
QVNfR0NPVl9QUk9GSUxFX0FMTD15CiMgZW5kIG9mIEdDT1YtYmFzZWQga2VybmVsIHByb2ZpbGlu
ZwoKQ09ORklHX0hBVkVfR0NDX1BMVUdJTlM9eQpDT05GSUdfR0NDX1BMVUdJTlM9eQojIENPTkZJ
R19HQ0NfUExVR0lOX0xBVEVOVF9FTlRST1BZIGlzIG5vdCBzZXQKIyBDT05GSUdfR0NDX1BMVUdJ
Tl9SQU5EU1RSVUNUIGlzIG5vdCBzZXQKIyBlbmQgb2YgR2VuZXJhbCBhcmNoaXRlY3R1cmUtZGVw
ZW5kZW50IG9wdGlvbnMKCkNPTkZJR19SVF9NVVRFWEVTPXkKQ09ORklHX0JBU0VfU01BTEw9MAoj
IENPTkZJR19NT0RVTEVTIGlzIG5vdCBzZXQKQ09ORklHX01PRFVMRVNfVFJFRV9MT09LVVA9eQpD
T05GSUdfQkxPQ0s9eQojIENPTkZJR19CTE9DS19MRUdBQ1lfQVVUT0xPQUQgaXMgbm90IHNldApD
T05GSUdfQkxLX0RFVl9CU0dfQ09NTU9OPXkKQ09ORklHX0JMS19ERVZfQlNHTElCPXkKQ09ORklH
X0JMS19ERVZfSU5URUdSSVRZPXkKQ09ORklHX0JMS19ERVZfSU5URUdSSVRZX1QxMD15CkNPTkZJ
R19CTEtfREVWX1pPTkVEPXkKIyBDT05GSUdfQkxLX1dCVCBpcyBub3Qgc2V0CkNPTkZJR19CTEtf
REVCVUdfRlM9eQpDT05GSUdfQkxLX0RFQlVHX0ZTX1pPTkVEPXkKIyBDT05GSUdfQkxLX1NFRF9P
UEFMIGlzIG5vdCBzZXQKIyBDT05GSUdfQkxLX0lOTElORV9FTkNSWVBUSU9OIGlzIG5vdCBzZXQK
CiMKIyBQYXJ0aXRpb24gVHlwZXMKIwpDT05GSUdfUEFSVElUSU9OX0FEVkFOQ0VEPXkKQ09ORklH
X0FDT1JOX1BBUlRJVElPTj15CiMgQ09ORklHX0FDT1JOX1BBUlRJVElPTl9DVU1BTkEgaXMgbm90
IHNldApDT05GSUdfQUNPUk5fUEFSVElUSU9OX0VFU09YPXkKQ09ORklHX0FDT1JOX1BBUlRJVElP
Tl9JQ1M9eQojIENPTkZJR19BQ09STl9QQVJUSVRJT05fQURGUyBpcyBub3Qgc2V0CiMgQ09ORklH
X0FDT1JOX1BBUlRJVElPTl9QT1dFUlRFQyBpcyBub3Qgc2V0CiMgQ09ORklHX0FDT1JOX1BBUlRJ
VElPTl9SSVNDSVggaXMgbm90IHNldAojIENPTkZJR19BSVhfUEFSVElUSU9OIGlzIG5vdCBzZXQK
IyBDT05GSUdfT1NGX1BBUlRJVElPTiBpcyBub3Qgc2V0CkNPTkZJR19BTUlHQV9QQVJUSVRJT049
eQojIENPTkZJR19BVEFSSV9QQVJUSVRJT04gaXMgbm90IHNldApDT05GSUdfTUFDX1BBUlRJVElP
Tj15CkNPTkZJR19NU0RPU19QQVJUSVRJT049eQpDT05GSUdfQlNEX0RJU0tMQUJFTD15CiMgQ09O
RklHX01JTklYX1NVQlBBUlRJVElPTiBpcyBub3Qgc2V0CiMgQ09ORklHX1NPTEFSSVNfWDg2X1BB
UlRJVElPTiBpcyBub3Qgc2V0CiMgQ09ORklHX1VOSVhXQVJFX0RJU0tMQUJFTCBpcyBub3Qgc2V0
CkNPTkZJR19MRE1fUEFSVElUSU9OPXkKIyBDT05GSUdfTERNX0RFQlVHIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0dJX1BBUlRJVElPTiBpcyBub3Qgc2V0CkNPTkZJR19VTFRSSVhfUEFSVElUSU9OPXkK
Q09ORklHX1NVTl9QQVJUSVRJT049eQpDT05GSUdfS0FSTUFfUEFSVElUSU9OPXkKIyBDT05GSUdf
RUZJX1BBUlRJVElPTiBpcyBub3Qgc2V0CiMgQ09ORklHX1NZU1Y2OF9QQVJUSVRJT04gaXMgbm90
IHNldAojIENPTkZJR19DTURMSU5FX1BBUlRJVElPTiBpcyBub3Qgc2V0CiMgZW5kIG9mIFBhcnRp
dGlvbiBUeXBlcwoKQ09ORklHX0JMS19NUV9QQ0k9eQpDT05GSUdfQkxLX01RX1ZJUlRJTz15CkNP
TkZJR19CTEtfUE09eQpDT05GSUdfQkxPQ0tfSE9MREVSX0RFUFJFQ0FURUQ9eQpDT05GSUdfQkxL
X01RX1NUQUNLSU5HPXkKCiMKIyBJTyBTY2hlZHVsZXJzCiMKQ09ORklHX01RX0lPU0NIRURfREVB
RExJTkU9eQpDT05GSUdfTVFfSU9TQ0hFRF9LWUJFUj15CiMgQ09ORklHX0lPU0NIRURfQkZRIGlz
IG5vdCBzZXQKIyBlbmQgb2YgSU8gU2NoZWR1bGVycwoKQ09ORklHX1BBREFUQT15CkNPTkZJR19B
U04xPXkKQ09ORklHX1VOSU5MSU5FX1NQSU5fVU5MT0NLPXkKQ09ORklHX0FSQ0hfU1VQUE9SVFNf
QVRPTUlDX1JNVz15CkNPTkZJR19NVVRFWF9TUElOX09OX09XTkVSPXkKQ09ORklHX1JXU0VNX1NQ
SU5fT05fT1dORVI9eQpDT05GSUdfTE9DS19TUElOX09OX09XTkVSPXkKQ09ORklHX0FSQ0hfSEFT
X05PTl9PVkVSTEFQUElOR19BRERSRVNTX1NQQUNFPXkKCiMKIyBFeGVjdXRhYmxlIGZpbGUgZm9y
bWF0cwojCkNPTkZJR19CSU5GTVRfRUxGPXkKQ09ORklHX0JJTkZNVF9FTEZfRkRQSUM9eQpDT05G
SUdfRUxGQ09SRT15CiMgQ09ORklHX0NPUkVfRFVNUF9ERUZBVUxUX0VMRl9IRUFERVJTIGlzIG5v
dCBzZXQKQ09ORklHX0JJTkZNVF9TQ1JJUFQ9eQpDT05GSUdfQVJDSF9IQVNfQklORk1UX0ZMQVQ9
eQojIENPTkZJR19CSU5GTVRfRkxBVCBpcyBub3Qgc2V0CkNPTkZJR19CSU5GTVRfRkxBVF9BUkdW
UF9FTlZQX09OX1NUQUNLPXkKQ09ORklHX0JJTkZNVF9NSVNDPXkKQ09ORklHX0NPUkVEVU1QPXkK
IyBlbmQgb2YgRXhlY3V0YWJsZSBmaWxlIGZvcm1hdHMKCiMKIyBNZW1vcnkgTWFuYWdlbWVudCBv
cHRpb25zCiMKQ09ORklHX1NFTEVDVF9NRU1PUllfTU9ERUw9eQpDT05GSUdfRkxBVE1FTV9NQU5V
QUw9eQojIENPTkZJR19TUEFSU0VNRU1fTUFOVUFMIGlzIG5vdCBzZXQKQ09ORklHX0ZMQVRNRU09
eQpDT05GSUdfQVJDSF9LRUVQX01FTUJMT0NLPXkKQ09ORklHX01FTU9SWV9JU09MQVRJT049eQpD
T05GSUdfU1BMSVRfUFRMT0NLX0NQVVM9NApDT05GSUdfTUVNT1JZX0JBTExPT049eQpDT05GSUdf
QkFMTE9PTl9DT01QQUNUSU9OPXkKQ09ORklHX0NPTVBBQ1RJT049eQpDT05GSUdfUEFHRV9SRVBP
UlRJTkc9eQpDT05GSUdfTUlHUkFUSU9OPXkKQ09ORklHX0NPTlRJR19BTExPQz15CiMgQ09ORklH
X0JPVU5DRSBpcyBub3Qgc2V0CkNPTkZJR19LU009eQpDT05GSUdfREVGQVVMVF9NTUFQX01JTl9B
RERSPTQwOTYKQ09ORklHX0FSQ0hfV0FOVF9HRU5FUkFMX0hVR0VUTEI9eQpDT05GSUdfQ01BPXkK
Q09ORklHX0NNQV9ERUJVRz15CiMgQ09ORklHX0NNQV9ERUJVR0ZTIGlzIG5vdCBzZXQKIyBDT05G
SUdfQ01BX1NZU0ZTIGlzIG5vdCBzZXQKQ09ORklHX0NNQV9BUkVBUz03CiMgQ09ORklHX1pQT09M
IGlzIG5vdCBzZXQKIyBDT05GSUdfWlNNQUxMT0MgaXMgbm90IHNldApDT05GSUdfR0VORVJJQ19F
QVJMWV9JT1JFTUFQPXkKQ09ORklHX1BBR0VfSURMRV9GTEFHPXkKQ09ORklHX0lETEVfUEFHRV9U
UkFDS0lORz15CkNPTkZJR19BUkNIX0hBU19DVVJSRU5UX1NUQUNLX1BPSU5URVI9eQojIENPTkZJ
R19QRVJDUFVfU1RBVFMgaXMgbm90IHNldAojIENPTkZJR19HVVBfVEVTVCBpcyBub3Qgc2V0CkNP
TkZJR19LTUFQX0xPQ0FMPXkKQ09ORklHX0tNQVBfTE9DQUxfTk9OX0xJTkVBUl9QVEVfQVJSQVk9
eQpDT05GSUdfQU5PTl9WTUFfTkFNRT15CgojCiMgRGF0YSBBY2Nlc3MgTW9uaXRvcmluZwojCiMg
Q09ORklHX0RBTU9OIGlzIG5vdCBzZXQKIyBlbmQgb2YgRGF0YSBBY2Nlc3MgTW9uaXRvcmluZwoj
IGVuZCBvZiBNZW1vcnkgTWFuYWdlbWVudCBvcHRpb25zCgojIENPTkZJR19ORVQgaXMgbm90IHNl
dAoKIwojIERldmljZSBEcml2ZXJzCiMKQ09ORklHX0FSTV9BTUJBPXkKQ09ORklHX0hBVkVfUENJ
PXkKQ09ORklHX1BDST15CkNPTkZJR19QQ0lfRE9NQUlOUz15CkNPTkZJR19QQ0lfRE9NQUlOU19H
RU5FUklDPXkKQ09ORklHX1BDSV9TWVNDQUxMPXkKIyBDT05GSUdfUENJRVBPUlRCVVMgaXMgbm90
IHNldApDT05GSUdfUENJRUFTUE09eQojIENPTkZJR19QQ0lFQVNQTV9ERUZBVUxUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUENJRUFTUE1fUE9XRVJTQVZFIGlzIG5vdCBzZXQKQ09ORklHX1BDSUVBU1BN
X1BPV0VSX1NVUEVSU0FWRT15CiMgQ09ORklHX1BDSUVBU1BNX1BFUkZPUk1BTkNFIGlzIG5vdCBz
ZXQKQ09ORklHX1BDSUVfUFRNPXkKQ09ORklHX1BDSV9NU0k9eQpDT05GSUdfUENJX01TSV9JUlFf
RE9NQUlOPXkKQ09ORklHX1BDSV9RVUlSS1M9eQpDT05GSUdfUENJX0RFQlVHPXkKQ09ORklHX1BD
SV9SRUFMTE9DX0VOQUJMRV9BVVRPPXkKQ09ORklHX1BDSV9TVFVCPXkKQ09ORklHX1BDSV9QRl9T
VFVCPXkKQ09ORklHX1BDSV9BVFM9eQpDT05GSUdfUENJX0VDQU09eQpDT05GSUdfUENJX0lPVj15
CkNPTkZJR19QQ0lfUFJJPXkKIyBDT05GSUdfUENJX1BBU0lEIGlzIG5vdCBzZXQKQ09ORklHX1ZH
QV9BUkI9eQpDT05GSUdfVkdBX0FSQl9NQVhfR1BVUz0xNgojIENPTkZJR19IT1RQTFVHX1BDSSBp
cyBub3Qgc2V0CgojCiMgUENJIGNvbnRyb2xsZXIgZHJpdmVycwojCiMgQ09ORklHX1BDSV9NVkVC
VSBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSV9BQVJEVkFSSyBpcyBub3Qgc2V0CiMgQ09ORklHX1BD
SUVfWElMSU5YX05XTCBpcyBub3Qgc2V0CkNPTkZJR19QQ0lfRlRQQ0kxMDA9eQojIENPTkZJR19Q
Q0lfSVhQNFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJX1RFR1JBIGlzIG5vdCBzZXQKIyBDT05G
SUdfUENJX1JDQVJfR0VOMiBpcyBub3Qgc2V0CkNPTkZJR19QQ0lFX1JDQVJfSE9TVD15CkNPTkZJ
R19QQ0lfSE9TVF9DT01NT049eQpDT05GSUdfUENJX0hPU1RfR0VORVJJQz15CkNPTkZJR19QQ0lF
X1hJTElOWD15CiMgQ09ORklHX1BDSUVfWElMSU5YX0NQTSBpcyBub3Qgc2V0CiMgQ09ORklHX1BD
SV9YR0VORSBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSV9WM19TRU1JIGlzIG5vdCBzZXQKIyBDT05G
SUdfUENJX1ZFUlNBVElMRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSUVfSVBST0NfUExBVEZPUk0g
aXMgbm90IHNldAojIENPTkZJR19QQ0lFX0lQUk9DX0JDTUEgaXMgbm90IHNldAojIENPTkZJR19Q
Q0lFX0FMVEVSQSBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSV9IT1NUX1RIVU5ERVJfUEVNIGlzIG5v
dCBzZXQKIyBDT05GSUdfUENJX0hPU1RfVEhVTkRFUl9FQ0FNIGlzIG5vdCBzZXQKIyBDT05GSUdf
UENJRV9ST0NLQ0hJUF9IT1NUIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJRV9NRURJQVRFSyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1BDSUVfTUVESUFURUtfR0VOMyBpcyBub3Qgc2V0CiMgQ09ORklHX1BD
SUVfQlJDTVNUQiBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSV9MT09OR1NPTiBpcyBub3Qgc2V0CiMg
Q09ORklHX1BDSUVfTUlDUk9DSElQX0hPU1QgaXMgbm90IHNldAojIENPTkZJR19QQ0lFX0FQUExF
IGlzIG5vdCBzZXQKIyBDT05GSUdfUENJRV9NVDc2MjEgaXMgbm90IHNldAoKIwojIERlc2lnbldh
cmUgUENJIENvcmUgU3VwcG9ydAojCkNPTkZJR19QQ0lFX0RXPXkKQ09ORklHX1BDSUVfRFdfSE9T
VD15CiMgQ09ORklHX1BDSV9EUkE3WFhfSE9TVCBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSUVfRFdf
UExBVF9IT1NUIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJX0VYWU5PUyBpcyBub3Qgc2V0CiMgQ09O
RklHX1BDSV9JTVg2IGlzIG5vdCBzZXQKIyBDT05GSUdfUENJRV9TUEVBUjEzWFggaXMgbm90IHNl
dApDT05GSUdfUENJX0tFWVNUT05FPXkKQ09ORklHX1BDSV9LRVlTVE9ORV9IT1NUPXkKQ09ORklH
X1BDSV9MQVlFUlNDQVBFPXkKIyBDT05GSUdfUENJX0hJU0kgaXMgbm90IHNldApDT05GSUdfUENJ
RV9RQ09NPXkKIyBDT05GSUdfUENJRV9BUk1BREFfOEsgaXMgbm90IHNldAojIENPTkZJR19QQ0lF
X0FSVFBFQzZfSE9TVCBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSUVfUk9DS0NISVBfRFdfSE9TVCBp
cyBub3Qgc2V0CiMgQ09ORklHX1BDSUVfSU5URUxfR1cgaXMgbm90IHNldAojIENPTkZJR19QQ0lF
X0tFRU1CQVlfSE9TVCBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSUVfS0lSSU4gaXMgbm90IHNldApD
T05GSUdfUENJRV9ISVNJX1NUQj15CiMgQ09ORklHX1BDSV9NRVNPTiBpcyBub3Qgc2V0CiMgQ09O
RklHX1BDSUVfVEVHUkExOTRfSE9TVCBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSUVfVklTQ09OVElf
SE9TVCBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSUVfVU5JUEhJRVIgaXMgbm90IHNldAojIENPTkZJ
R19QQ0lFX0FMIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJRV9GVTc0MCBpcyBub3Qgc2V0CiMgZW5k
IG9mIERlc2lnbldhcmUgUENJIENvcmUgU3VwcG9ydAoKIwojIE1vYml2ZWlsIFBDSWUgQ29yZSBT
dXBwb3J0CiMKIyBDT05GSUdfUENJRV9NT0JJVkVJTF9QTEFUIGlzIG5vdCBzZXQKIyBDT05GSUdf
UENJRV9MQVlFUlNDQVBFX0dFTjQgaXMgbm90IHNldAojIGVuZCBvZiBNb2JpdmVpbCBQQ0llIENv
cmUgU3VwcG9ydAoKIwojIENhZGVuY2UgUENJZSBjb250cm9sbGVycyBzdXBwb3J0CiMKQ09ORklH
X1BDSUVfQ0FERU5DRT15CkNPTkZJR19QQ0lFX0NBREVOQ0VfSE9TVD15CkNPTkZJR19QQ0lFX0NB
REVOQ0VfUExBVD15CkNPTkZJR19QQ0lFX0NBREVOQ0VfUExBVF9IT1NUPXkKQ09ORklHX1BDSV9K
NzIxRT15CkNPTkZJR19QQ0lfSjcyMUVfSE9TVD15CiMgZW5kIG9mIENhZGVuY2UgUENJZSBjb250
cm9sbGVycyBzdXBwb3J0CiMgZW5kIG9mIFBDSSBjb250cm9sbGVyIGRyaXZlcnMKCiMKIyBQQ0kg
RW5kcG9pbnQKIwojIENPTkZJR19QQ0lfRU5EUE9JTlQgaXMgbm90IHNldAojIGVuZCBvZiBQQ0kg
RW5kcG9pbnQKCiMKIyBQQ0kgc3dpdGNoIGNvbnRyb2xsZXIgZHJpdmVycwojCkNPTkZJR19QQ0lf
U1dfU1dJVENIVEVDPXkKIyBlbmQgb2YgUENJIHN3aXRjaCBjb250cm9sbGVyIGRyaXZlcnMKCkNP
TkZJR19DWExfQlVTPXkKQ09ORklHX0NYTF9QQ0k9eQpDT05GSUdfQ1hMX01FTV9SQVdfQ09NTUFO
RFM9eQojIENPTkZJR19DWExfTUVNIGlzIG5vdCBzZXQKQ09ORklHX0NYTF9QT1JUPXkKIyBDT05G
SUdfUENDQVJEIGlzIG5vdCBzZXQKQ09ORklHX1JBUElESU89eQpDT05GSUdfUkFQSURJT19ESVND
X1RJTUVPVVQ9MzAKIyBDT05GSUdfUkFQSURJT19FTkFCTEVfUlhfVFhfUE9SVFMgaXMgbm90IHNl
dAojIENPTkZJR19SQVBJRElPX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX1JBUElESU9fRU5VTV9C
QVNJQz15CkNPTkZJR19SQVBJRElPX0NITUFOPXkKIyBDT05GSUdfUkFQSURJT19NUE9SVF9DREVW
IGlzIG5vdCBzZXQKCiMKIyBSYXBpZElPIFN3aXRjaCBkcml2ZXJzCiMKQ09ORklHX1JBUElESU9f
Q1BTX1hYPXkKQ09ORklHX1JBUElESU9fQ1BTX0dFTjI9eQojIENPTkZJR19SQVBJRElPX1JYU19H
RU4zIGlzIG5vdCBzZXQKIyBlbmQgb2YgUmFwaWRJTyBTd2l0Y2ggZHJpdmVycwoKIwojIEdlbmVy
aWMgRHJpdmVyIE9wdGlvbnMKIwpDT05GSUdfQVVYSUxJQVJZX0JVUz15CkNPTkZJR19VRVZFTlRf
SEVMUEVSPXkKQ09ORklHX1VFVkVOVF9IRUxQRVJfUEFUSD0iIgojIENPTkZJR19ERVZUTVBGUyBp
cyBub3Qgc2V0CiMgQ09ORklHX1NUQU5EQUxPTkUgaXMgbm90IHNldApDT05GSUdfUFJFVkVOVF9G
SVJNV0FSRV9CVUlMRD15CgojCiMgRmlybXdhcmUgbG9hZGVyCiMKQ09ORklHX0ZXX0xPQURFUj15
CkNPTkZJR19GV19MT0FERVJfUEFHRURfQlVGPXkKQ09ORklHX0VYVFJBX0ZJUk1XQVJFPSIiCkNP
TkZJR19GV19MT0FERVJfVVNFUl9IRUxQRVI9eQojIENPTkZJR19GV19MT0FERVJfVVNFUl9IRUxQ
RVJfRkFMTEJBQ0sgaXMgbm90IHNldApDT05GSUdfRldfTE9BREVSX0NPTVBSRVNTPXkKIyBlbmQg
b2YgRmlybXdhcmUgbG9hZGVyCgpDT05GSUdfQUxMT1dfREVWX0NPUkVEVU1QPXkKQ09ORklHX0RF
QlVHX0RSSVZFUj15CiMgQ09ORklHX0RFQlVHX0RFVlJFUyBpcyBub3Qgc2V0CiMgQ09ORklHX0RF
QlVHX1RFU1RfRFJJVkVSX1JFTU9WRSBpcyBub3Qgc2V0CkNPTkZJR19HRU5FUklDX0NQVV9BVVRP
UFJPQkU9eQpDT05GSUdfR0VORVJJQ19DUFVfVlVMTkVSQUJJTElUSUVTPXkKQ09ORklHX1NPQ19C
VVM9eQpDT05GSUdfUkVHTUFQPXkKQ09ORklHX1JFR01BUF9JMkM9eQpDT05GSUdfUkVHTUFQX1NQ
TUk9eQpDT05GSUdfUkVHTUFQX1cxPXkKQ09ORklHX1JFR01BUF9NTUlPPXkKQ09ORklHX1JFR01B
UF9JUlE9eQpDT05GSUdfRE1BX1NIQVJFRF9CVUZGRVI9eQpDT05GSUdfRE1BX0ZFTkNFX1RSQUNF
PXkKIyBlbmQgb2YgR2VuZXJpYyBEcml2ZXIgT3B0aW9ucwoKIwojIEJ1cyBkZXZpY2VzCiMKQ09O
RklHX0FSTV9DQ0k9eQpDT05GSUdfQVJNX0NDSTQwMF9DT01NT049eQpDT05GSUdfQVJNX0NDSTQw
MF9QT1JUX0NUUkw9eQojIENPTkZJR19BUk1fSU5URUdSQVRPUl9MTSBpcyBub3Qgc2V0CkNPTkZJ
R19CUkNNU1RCX0dJU0JfQVJCPXkKIyBDT05GSUdfQlQxX0FQQiBpcyBub3Qgc2V0CiMgQ09ORklH
X0JUMV9BWEkgaXMgbm90IHNldAojIENPTkZJR19ISVNJTElDT05fTFBDIGlzIG5vdCBzZXQKIyBD
T05GSUdfSU5URUxfSVhQNFhYX0VCIGlzIG5vdCBzZXQKQ09ORklHX01WRUJVX01CVVM9eQpDT05G
SUdfT01BUF9JTlRFUkNPTk5FQ1Q9eQpDT05GSUdfT01BUF9PQ1AyU0NQPXkKIyBDT05GSUdfUUNP
TV9FQkkyIGlzIG5vdCBzZXQKIyBDT05GSUdfU1VONTBJX0RFMl9CVVMgaXMgbm90IHNldApDT05G
SUdfU1VOWElfUlNCPXkKQ09ORklHX1RJX1NZU0M9eQojIENPTkZJR19WRVhQUkVTU19DT05GSUcg
aXMgbm90IHNldAojIENPTkZJR19GU0xfTUNfQlVTIGlzIG5vdCBzZXQKIyBDT05GSUdfTUhJX0JV
UyBpcyBub3Qgc2V0CiMgZW5kIG9mIEJ1cyBkZXZpY2VzCgojCiMgRmlybXdhcmUgRHJpdmVycwoj
CgojCiMgQVJNIFN5c3RlbSBDb250cm9sIGFuZCBNYW5hZ2VtZW50IEludGVyZmFjZSBQcm90b2Nv
bAojCkNPTkZJR19BUk1fU0NNSV9QUk9UT0NPTD15CkNPTkZJR19BUk1fU0NNSV9IQVZFX1RSQU5T
UE9SVD15CkNPTkZJR19BUk1fU0NNSV9IQVZFX1NITUVNPXkKQ09ORklHX0FSTV9TQ01JX1RSQU5T
UE9SVF9NQUlMQk9YPXkKIyBDT05GSUdfQVJNX1NDTUlfVFJBTlNQT1JUX09QVEVFIGlzIG5vdCBz
ZXQKQ09ORklHX0FSTV9TQ01JX1RSQU5TUE9SVF9TTUM9eQojIENPTkZJR19BUk1fU0NNSV9UUkFO
U1BPUlRfU01DX0FUT01JQ19FTkFCTEUgaXMgbm90IHNldAojIENPTkZJR19BUk1fU0NNSV9UUkFO
U1BPUlRfVklSVElPIGlzIG5vdCBzZXQKQ09ORklHX0FSTV9TQ01JX1BPV0VSX0RPTUFJTj15CiMg
ZW5kIG9mIEFSTSBTeXN0ZW0gQ29udHJvbCBhbmQgTWFuYWdlbWVudCBJbnRlcmZhY2UgUHJvdG9j
b2wKCkNPTkZJR19BUk1fU0NQSV9QUk9UT0NPTD15CkNPTkZJR19BUk1fU0NQSV9QT1dFUl9ET01B
SU49eQpDT05GSUdfUUNPTV9TQ009eQojIENPTkZJR19RQ09NX1NDTV9ET1dOTE9BRF9NT0RFX0RF
RkFVTFQgaXMgbm90IHNldAojIENPTkZJR19USV9TQ0lfUFJPVE9DT0wgaXMgbm90IHNldAojIENP
TkZJR19UUlVTVEVEX0ZPVU5EQVRJT05TIGlzIG5vdCBzZXQKIyBDT05GSUdfVFVSUklTX01PWF9S
V1RNIGlzIG5vdCBzZXQKIyBDT05GSUdfQkNNNDdYWF9OVlJBTSBpcyBub3Qgc2V0CiMgQ09ORklH
X1RFRV9CTlhUX0ZXIGlzIG5vdCBzZXQKIyBDT05GSUdfR09PR0xFX0ZJUk1XQVJFIGlzIG5vdCBz
ZXQKQ09ORklHX0FSTV9QU0NJX0ZXPXkKQ09ORklHX0hBVkVfQVJNX1NNQ0NDPXkKQ09ORklHX0hB
VkVfQVJNX1NNQ0NDX0RJU0NPVkVSWT15CkNPTkZJR19BUk1fU01DQ0NfU09DX0lEPXkKCiMKIyBU
ZWdyYSBmaXJtd2FyZSBkcml2ZXIKIwojIGVuZCBvZiBUZWdyYSBmaXJtd2FyZSBkcml2ZXIKIyBl
bmQgb2YgRmlybXdhcmUgRHJpdmVycwoKIyBDT05GSUdfR05TUyBpcyBub3Qgc2V0CkNPTkZJR19N
VEQ9eQoKIwojIFBhcnRpdGlvbiBwYXJzZXJzCiMKIyBDT05GSUdfTVREX0FSN19QQVJUUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX01URF9CQ002M1hYX1BBUlRTIGlzIG5vdCBzZXQKQ09ORklHX01URF9D
TURMSU5FX1BBUlRTPXkKQ09ORklHX01URF9PRl9QQVJUUz15CiMgQ09ORklHX01URF9PRl9QQVJU
U19CQ000OTA4IGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX09GX1BBUlRTX0xJTktTWVNfTlMgaXMg
bm90IHNldAojIENPTkZJR19NVERfUEFSU0VSX0lNQUdFVEFHIGlzIG5vdCBzZXQKQ09ORklHX01U
RF9BRlNfUEFSVFM9eQojIENPTkZJR19NVERfUEFSU0VSX1RSWCBpcyBub3Qgc2V0CiMgQ09ORklH
X01URF9TSEFSUFNMX1BBUlRTIGlzIG5vdCBzZXQKQ09ORklHX01URF9SRURCT09UX1BBUlRTPXkK
Q09ORklHX01URF9SRURCT09UX0RJUkVDVE9SWV9CTE9DSz0tMQojIENPTkZJR19NVERfUkVEQk9P
VF9QQVJUU19VTkFMTE9DQVRFRCBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9SRURCT09UX1BBUlRT
X1JFQURPTkxZIGlzIG5vdCBzZXQKQ09ORklHX01URF9RQ09NU01FTV9QQVJUUz15CiMgZW5kIG9m
IFBhcnRpdGlvbiBwYXJzZXJzCgojCiMgVXNlciBNb2R1bGVzIEFuZCBUcmFuc2xhdGlvbiBMYXll
cnMKIwpDT05GSUdfTVREX0JMS0RFVlM9eQpDT05GSUdfTVREX0JMT0NLPXkKCiMKIyBOb3RlIHRo
YXQgaW4gc29tZSBjYXNlcyBVQkkgYmxvY2sgaXMgcHJlZmVycmVkLiBTZWUgTVREX1VCSV9CTE9D
Sy4KIwpDT05GSUdfRlRMPXkKIyBDT05GSUdfTkZUTCBpcyBub3Qgc2V0CkNPTkZJR19JTkZUTD15
CkNPTkZJR19SRkRfRlRMPXkKQ09ORklHX1NTRkRDPXkKQ09ORklHX1NNX0ZUTD15CkNPTkZJR19N
VERfT09QUz15CkNPTkZJR19NVERfUEFSVElUSU9ORURfTUFTVEVSPXkKCiMKIyBSQU0vUk9NL0Zs
YXNoIGNoaXAgZHJpdmVycwojCkNPTkZJR19NVERfQ0ZJPXkKQ09ORklHX01URF9KRURFQ1BST0JF
PXkKQ09ORklHX01URF9HRU5fUFJPQkU9eQpDT05GSUdfTVREX0NGSV9BRFZfT1BUSU9OUz15CkNP
TkZJR19NVERfQ0ZJX05PU1dBUD15CiMgQ09ORklHX01URF9DRklfQkVfQllURV9TV0FQIGlzIG5v
dCBzZXQKIyBDT05GSUdfTVREX0NGSV9MRV9CWVRFX1NXQVAgaXMgbm90IHNldApDT05GSUdfTVRE
X0NGSV9HRU9NRVRSWT15CkNPTkZJR19NVERfTUFQX0JBTktfV0lEVEhfMT15CkNPTkZJR19NVERf
TUFQX0JBTktfV0lEVEhfMj15CiMgQ09ORklHX01URF9NQVBfQkFOS19XSURUSF80IGlzIG5vdCBz
ZXQKIyBDT05GSUdfTVREX01BUF9CQU5LX1dJRFRIXzggaXMgbm90IHNldAojIENPTkZJR19NVERf
TUFQX0JBTktfV0lEVEhfMTYgaXMgbm90IHNldApDT05GSUdfTVREX01BUF9CQU5LX1dJRFRIXzMy
PXkKIyBDT05GSUdfTVREX0NGSV9JMSBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9DRklfSTIgaXMg
bm90IHNldApDT05GSUdfTVREX0NGSV9JND15CkNPTkZJR19NVERfQ0ZJX0k4PXkKQ09ORklHX01U
RF9PVFA9eQpDT05GSUdfTVREX0NGSV9JTlRFTEVYVD15CkNPTkZJR19NVERfQ0ZJX0FNRFNURD15
CiMgQ09ORklHX01URF9DRklfU1RBQSBpcyBub3Qgc2V0CkNPTkZJR19NVERfQ0ZJX1VUSUw9eQpD
T05GSUdfTVREX1JBTT15CkNPTkZJR19NVERfUk9NPXkKIyBDT05GSUdfTVREX0FCU0VOVCBpcyBu
b3Qgc2V0CiMgZW5kIG9mIFJBTS9ST00vRmxhc2ggY2hpcCBkcml2ZXJzCgojCiMgTWFwcGluZyBk
cml2ZXJzIGZvciBjaGlwIGFjY2VzcwojCkNPTkZJR19NVERfQ09NUExFWF9NQVBQSU5HUz15CkNP
TkZJR19NVERfUEhZU01BUD15CkNPTkZJR19NVERfUEhZU01BUF9DT01QQVQ9eQpDT05GSUdfTVRE
X1BIWVNNQVBfU1RBUlQ9MHg4MDAwMDAwCkNPTkZJR19NVERfUEhZU01BUF9MRU49MApDT05GSUdf
TVREX1BIWVNNQVBfQkFOS1dJRFRIPTIKIyBDT05GSUdfTVREX1BIWVNNQVBfT0YgaXMgbm90IHNl
dApDT05GSUdfTVREX1BIWVNNQVBfR1BJT19BRERSPXkKIyBDT05GSUdfTVREX1NDNTIwQ0RQIGlz
IG5vdCBzZXQKIyBDT05GSUdfTVREX05FVFNDNTIwIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX1RT
NTUwMCBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9JTVBBNyBpcyBub3Qgc2V0CkNPTkZJR19NVERf
UENJPXkKQ09ORklHX01URF9JTlRFTF9WUl9OT1I9eQpDT05GSUdfTVREX1BMQVRSQU09eQojIGVu
ZCBvZiBNYXBwaW5nIGRyaXZlcnMgZm9yIGNoaXAgYWNjZXNzCgojCiMgU2VsZi1jb250YWluZWQg
TVREIGRldmljZSBkcml2ZXJzCiMKIyBDT05GSUdfTVREX1BNQzU1MSBpcyBub3Qgc2V0CkNPTkZJ
R19NVERfU1BFQVJfU01JPXkKQ09ORklHX01URF9TTFJBTT15CkNPTkZJR19NVERfUEhSQU09eQoj
IENPTkZJR19NVERfTVREUkFNIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX0JMT0NLMk1URCBpcyBu
b3Qgc2V0CgojCiMgRGlzay1Pbi1DaGlwIERldmljZSBEcml2ZXJzCiMKIyBDT05GSUdfTVREX0RP
Q0czIGlzIG5vdCBzZXQKIyBlbmQgb2YgU2VsZi1jb250YWluZWQgTVREIGRldmljZSBkcml2ZXJz
CgojCiMgTkFORAojCkNPTkZJR19NVERfTkFORF9DT1JFPXkKQ09ORklHX01URF9PTkVOQU5EPXkK
IyBDT05GSUdfTVREX09ORU5BTkRfVkVSSUZZX1dSSVRFIGlzIG5vdCBzZXQKIyBDT05GSUdfTVRE
X09ORU5BTkRfR0VORVJJQyBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9PTkVOQU5EX09NQVAyIGlz
IG5vdCBzZXQKIyBDT05GSUdfTVREX09ORU5BTkRfU0FNU1VORyBpcyBub3Qgc2V0CiMgQ09ORklH
X01URF9PTkVOQU5EX09UUCBpcyBub3Qgc2V0CkNPTkZJR19NVERfT05FTkFORF8yWF9QUk9HUkFN
PXkKIyBDT05GSUdfTVREX1JBV19OQU5EIGlzIG5vdCBzZXQKCiMKIyBFQ0MgZW5naW5lIHN1cHBv
cnQKIwpDT05GSUdfTVREX05BTkRfRUNDPXkKQ09ORklHX01URF9OQU5EX0VDQ19TV19IQU1NSU5H
PXkKQ09ORklHX01URF9OQU5EX0VDQ19TV19IQU1NSU5HX1NNQz15CkNPTkZJR19NVERfTkFORF9F
Q0NfU1dfQkNIPXkKIyBDT05GSUdfTVREX05BTkRfRUNDX01YSUMgaXMgbm90IHNldAojIGVuZCBv
ZiBFQ0MgZW5naW5lIHN1cHBvcnQKIyBlbmQgb2YgTkFORAoKIwojIExQRERSICYgTFBERFIyIFBD
TSBtZW1vcnkgZHJpdmVycwojCkNPTkZJR19NVERfTFBERFI9eQpDT05GSUdfTVREX1FJTkZPX1BS
T0JFPXkKQ09ORklHX01URF9MUEREUjJfTlZNPXkKIyBlbmQgb2YgTFBERFIgJiBMUEREUjIgUENN
IG1lbW9yeSBkcml2ZXJzCgpDT05GSUdfTVREX1VCST15CkNPTkZJR19NVERfVUJJX1dMX1RIUkVT
SE9MRD00MDk2CkNPTkZJR19NVERfVUJJX0JFQl9MSU1JVD0yMAojIENPTkZJR19NVERfVUJJX0ZB
U1RNQVAgaXMgbm90IHNldApDT05GSUdfTVREX1VCSV9HTFVFQkk9eQojIENPTkZJR19NVERfVUJJ
X0JMT0NLIGlzIG5vdCBzZXQKQ09ORklHX01URF9IWVBFUkJVUz15CiMgQ09ORklHX0hCTUNfQU02
NTQgaXMgbm90IHNldApDT05GSUdfRFRDPXkKQ09ORklHX09GPXkKQ09ORklHX09GX1VOSVRURVNU
PXkKIyBDT05GSUdfT0ZfQUxMX0RUQlMgaXMgbm90IHNldApDT05GSUdfT0ZfRkxBVFRSRUU9eQpD
T05GSUdfT0ZfRUFSTFlfRkxBVFRSRUU9eQpDT05GSUdfT0ZfS09CSj15CkNPTkZJR19PRl9EWU5B
TUlDPXkKQ09ORklHX09GX0FERFJFU1M9eQpDT05GSUdfT0ZfSVJRPXkKQ09ORklHX09GX1JFU0VS
VkVEX01FTT15CkNPTkZJR19PRl9SRVNPTFZFPXkKQ09ORklHX09GX09WRVJMQVk9eQpDT05GSUdf
QVJDSF9NSUdIVF9IQVZFX1BDX1BBUlBPUlQ9eQpDT05GSUdfUEFSUE9SVD15CiMgQ09ORklHX1BB
UlBPUlRfUEMgaXMgbm90IHNldApDT05GSUdfUEFSUE9SVF9BWDg4Nzk2PXkKQ09ORklHX1BBUlBP
UlRfMTI4ND15CkNPTkZJR19QQVJQT1JUX05PVF9QQz15CiMgQ09ORklHX0JMS19ERVYgaXMgbm90
IHNldAoKIwojIE5WTUUgU3VwcG9ydAojCkNPTkZJR19OVk1FX0NPUkU9eQpDT05GSUdfQkxLX0RF
Vl9OVk1FPXkKIyBDT05GSUdfTlZNRV9NVUxUSVBBVEggaXMgbm90IHNldApDT05GSUdfTlZNRV9W
RVJCT1NFX0VSUk9SUz15CkNPTkZJR19OVk1FX0hXTU9OPXkKQ09ORklHX05WTUVfRkFCUklDUz15
CkNPTkZJR19OVk1FX0ZDPXkKQ09ORklHX05WTUVfVEFSR0VUPXkKIyBDT05GSUdfTlZNRV9UQVJH
RVRfUEFTU1RIUlUgaXMgbm90IHNldApDT05GSUdfTlZNRV9UQVJHRVRfTE9PUD15CkNPTkZJR19O
Vk1FX1RBUkdFVF9GQz15CkNPTkZJR19OVk1FX1RBUkdFVF9GQ0xPT1A9eQojIGVuZCBvZiBOVk1F
IFN1cHBvcnQKCiMKIyBNaXNjIGRldmljZXMKIwojIENPTkZJR19BRDUyNVhfRFBPVCBpcyBub3Qg
c2V0CiMgQ09ORklHX0RVTU1ZX0lSUSBpcyBub3Qgc2V0CkNPTkZJR19QSEFOVE9NPXkKQ09ORklH
X1RJRk1fQ09SRT15CkNPTkZJR19USUZNXzdYWDE9eQojIENPTkZJR19JQ1M5MzJTNDAxIGlzIG5v
dCBzZXQKIyBDT05GSUdfQVRNRUxfU1NDIGlzIG5vdCBzZXQKQ09ORklHX0VOQ0xPU1VSRV9TRVJW
SUNFUz15CkNPTkZJR19ISTY0MjFWNjAwX0lSUT15CkNPTkZJR19IUF9JTE89eQpDT05GSUdfUUNP
TV9DT0lOQ0VMTD15CkNPTkZJR19RQ09NX0ZBU1RSUEM9eQpDT05GSUdfQVBEUzk4MDJBTFM9eQoj
IENPTkZJR19JU0wyOTAwMyBpcyBub3Qgc2V0CkNPTkZJR19JU0wyOTAyMD15CkNPTkZJR19TRU5T
T1JTX1RTTDI1NTA9eQpDT05GSUdfU0VOU09SU19CSDE3NzA9eQpDT05GSUdfU0VOU09SU19BUERT
OTkwWD15CkNPTkZJR19ITUM2MzUyPXkKQ09ORklHX0RTMTY4Mj15CiMgQ09ORklHX1BDSF9QSFVC
IGlzIG5vdCBzZXQKQ09ORklHX1NSQU09eQpDT05GSUdfU1JBTV9FWEVDPXkKQ09ORklHX0RXX1hE
QVRBX1BDSUU9eQojIENPTkZJR19QQ0lfRU5EUE9JTlRfVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19Y
SUxJTlhfU0RGRUM9eQpDT05GSUdfTUlTQ19SVFNYPXkKQ09ORklHX09QRU5fRElDRT15CkNPTkZJ
R19DMlBPUlQ9eQoKIwojIEVFUFJPTSBzdXBwb3J0CiMKQ09ORklHX0VFUFJPTV9BVDI0PXkKQ09O
RklHX0VFUFJPTV9MRUdBQ1k9eQojIENPTkZJR19FRVBST01fTUFYNjg3NSBpcyBub3Qgc2V0CiMg
Q09ORklHX0VFUFJPTV85M0NYNiBpcyBub3Qgc2V0CkNPTkZJR19FRVBST01fSURUXzg5SFBFU1g9
eQojIENPTkZJR19FRVBST01fRUUxMDA0IGlzIG5vdCBzZXQKIyBlbmQgb2YgRUVQUk9NIHN1cHBv
cnQKCkNPTkZJR19DQjcxMF9DT1JFPXkKQ09ORklHX0NCNzEwX0RFQlVHPXkKQ09ORklHX0NCNzEw
X0RFQlVHX0FTU1VNUFRJT05TPXkKCiMKIyBUZXhhcyBJbnN0cnVtZW50cyBzaGFyZWQgdHJhbnNw
b3J0IGxpbmUgZGlzY2lwbGluZQojCiMgZW5kIG9mIFRleGFzIEluc3RydW1lbnRzIHNoYXJlZCB0
cmFuc3BvcnQgbGluZSBkaXNjaXBsaW5lCgojIENPTkZJR19TRU5TT1JTX0xJUzNfSTJDIGlzIG5v
dCBzZXQKQ09ORklHX0FMVEVSQV9TVEFQTD15CkNPTkZJR19FQ0hPPXkKIyBDT05GSUdfQkNNX1ZL
IGlzIG5vdCBzZXQKQ09ORklHX01JU0NfQUxDT1JfUENJPXkKQ09ORklHX01JU0NfUlRTWF9QQ0k9
eQojIENPTkZJR19IQUJBTkFfQUkgaXMgbm90IHNldApDT05GSUdfVUFDQ0U9eQojIENPTkZJR19Q
VlBBTklDIGlzIG5vdCBzZXQKIyBlbmQgb2YgTWlzYyBkZXZpY2VzCgojCiMgU0NTSSBkZXZpY2Ug
c3VwcG9ydAojCkNPTkZJR19TQ1NJX01PRD15CkNPTkZJR19SQUlEX0FUVFJTPXkKIyBDT05GSUdf
U0NTSSBpcyBub3Qgc2V0CiMgZW5kIG9mIFNDU0kgZGV2aWNlIHN1cHBvcnQKCkNPTkZJR19IQVZF
X1BBVEFfUExBVEZPUk09eQojIENPTkZJR19BVEEgaXMgbm90IHNldApDT05GSUdfTUQ9eQojIENP
TkZJR19CTEtfREVWX01EIGlzIG5vdCBzZXQKIyBDT05GSUdfQkNBQ0hFIGlzIG5vdCBzZXQKQ09O
RklHX0JMS19ERVZfRE1fQlVJTFRJTj15CkNPTkZJR19CTEtfREVWX0RNPXkKIyBDT05GSUdfRE1f
REVCVUcgaXMgbm90IHNldApDT05GSUdfRE1fQlVGSU89eQojIENPTkZJR19ETV9ERUJVR19CTE9D
S19NQU5BR0VSX0xPQ0tJTkcgaXMgbm90IHNldApDT05GSUdfRE1fQklPX1BSSVNPTj15CkNPTkZJ
R19ETV9QRVJTSVNURU5UX0RBVEE9eQpDT05GSUdfRE1fVU5TVFJJUEVEPXkKQ09ORklHX0RNX0NS
WVBUPXkKQ09ORklHX0RNX1NOQVBTSE9UPXkKQ09ORklHX0RNX1RISU5fUFJPVklTSU9OSU5HPXkK
Q09ORklHX0RNX0NBQ0hFPXkKQ09ORklHX0RNX0NBQ0hFX1NNUT15CkNPTkZJR19ETV9XUklURUNB
Q0hFPXkKQ09ORklHX0RNX0VSQT15CkNPTkZJR19ETV9DTE9ORT15CkNPTkZJR19ETV9NSVJST1I9
eQojIENPTkZJR19ETV9SQUlEIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1fWkVSTyBpcyBub3Qgc2V0
CiMgQ09ORklHX0RNX01VTFRJUEFUSCBpcyBub3Qgc2V0CkNPTkZJR19ETV9ERUxBWT15CkNPTkZJ
R19ETV9EVVNUPXkKQ09ORklHX0RNX0lOSVQ9eQojIENPTkZJR19ETV9VRVZFTlQgaXMgbm90IHNl
dApDT05GSUdfRE1fRkxBS0VZPXkKQ09ORklHX0RNX1ZFUklUWT15CiMgQ09ORklHX0RNX1ZFUklU
WV9WRVJJRllfUk9PVEhBU0hfU0lHIGlzIG5vdCBzZXQKQ09ORklHX0RNX1ZFUklUWV9GRUM9eQpD
T05GSUdfRE1fU1dJVENIPXkKIyBDT05GSUdfRE1fTE9HX1dSSVRFUyBpcyBub3Qgc2V0CiMgQ09O
RklHX0RNX0lOVEVHUklUWSBpcyBub3Qgc2V0CkNPTkZJR19ETV9aT05FRD15CiMgQ09ORklHX1RB
UkdFVF9DT1JFIGlzIG5vdCBzZXQKQ09ORklHX0ZVU0lPTj15CkNPTkZJR19GVVNJT05fTUFYX1NH
RT0xMjgKQ09ORklHX0ZVU0lPTl9MT0dHSU5HPXkKCiMKIyBJRUVFIDEzOTQgKEZpcmVXaXJlKSBz
dXBwb3J0CiMKQ09ORklHX0ZJUkVXSVJFPXkKQ09ORklHX0ZJUkVXSVJFX09IQ0k9eQojIENPTkZJ
R19GSVJFV0lSRV9OT1NZIGlzIG5vdCBzZXQKIyBlbmQgb2YgSUVFRSAxMzk0IChGaXJlV2lyZSkg
c3VwcG9ydAoKIwojIElucHV0IGRldmljZSBzdXBwb3J0CiMKQ09ORklHX0lOUFVUPXkKIyBDT05G
SUdfSU5QVVRfTEVEUyBpcyBub3Qgc2V0CkNPTkZJR19JTlBVVF9GRl9NRU1MRVNTPXkKQ09ORklH
X0lOUFVUX1NQQVJTRUtNQVA9eQpDT05GSUdfSU5QVVRfTUFUUklYS01BUD15CkNPTkZJR19JTlBV
VF9WSVZBTERJRk1BUD15CgojCiMgVXNlcmxhbmQgaW50ZXJmYWNlcwojCiMgQ09ORklHX0lOUFVU
X01PVVNFREVWIGlzIG5vdCBzZXQKQ09ORklHX0lOUFVUX0pPWURFVj15CkNPTkZJR19JTlBVVF9F
VkRFVj15CkNPTkZJR19JTlBVVF9FVkJVRz15CgojCiMgSW5wdXQgRGV2aWNlIERyaXZlcnMKIwpD
T05GSUdfSU5QVVRfS0VZQk9BUkQ9eQpDT05GSUdfS0VZQk9BUkRfQURQNTU4OD15CkNPTkZJR19L
RVlCT0FSRF9BRFA1NTg5PXkKIyBDT05GSUdfS0VZQk9BUkRfQVRLQkQgaXMgbm90IHNldApDT05G
SUdfS0VZQk9BUkRfUVQxMDUwPXkKQ09ORklHX0tFWUJPQVJEX1FUMTA3MD15CkNPTkZJR19LRVlC
T0FSRF9RVDIxNjA9eQojIENPTkZJR19LRVlCT0FSRF9DTFBTNzExWCBpcyBub3Qgc2V0CkNPTkZJ
R19LRVlCT0FSRF9ETElOS19ESVI2ODU9eQojIENPTkZJR19LRVlCT0FSRF9MS0tCRCBpcyBub3Qg
c2V0CiMgQ09ORklHX0tFWUJPQVJEX0VQOTNYWCBpcyBub3Qgc2V0CkNPTkZJR19LRVlCT0FSRF9H
UElPPXkKQ09ORklHX0tFWUJPQVJEX0dQSU9fUE9MTEVEPXkKIyBDT05GSUdfS0VZQk9BUkRfVENB
NjQxNiBpcyBub3Qgc2V0CkNPTkZJR19LRVlCT0FSRF9UQ0E4NDE4PXkKQ09ORklHX0tFWUJPQVJE
X01BVFJJWD15CiMgQ09ORklHX0tFWUJPQVJEX0xNODMyMyBpcyBub3Qgc2V0CkNPTkZJR19LRVlC
T0FSRF9MTTgzMzM9eQpDT05GSUdfS0VZQk9BUkRfTUFYNzM1OT15CkNPTkZJR19LRVlCT0FSRF9N
Q1M9eQojIENPTkZJR19LRVlCT0FSRF9NUFIxMjEgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FS
RF9TTlZTX1BXUktFWSBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX0lNWCBpcyBub3Qgc2V0
CkNPTkZJR19LRVlCT0FSRF9ORVdUT049eQpDT05GSUdfS0VZQk9BUkRfT1BFTkNPUkVTPXkKIyBD
T05GSUdfS0VZQk9BUkRfU0FNU1VORyBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX0dPTERG
SVNIX0VWRU5UUyBpcyBub3Qgc2V0CkNPTkZJR19LRVlCT0FSRF9TVE9XQVdBWT15CiMgQ09ORklH
X0tFWUJPQVJEX1NUX0tFWVNDQU4gaXMgbm90IHNldApDT05GSUdfS0VZQk9BUkRfU1VOS0JEPXkK
IyBDT05GSUdfS0VZQk9BUkRfU0hfS0VZU0MgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9T
VE1QRSBpcyBub3Qgc2V0CkNPTkZJR19LRVlCT0FSRF9TVU40SV9MUkFEQz15CkNPTkZJR19LRVlC
T0FSRF9JUVM2Mlg9eQpDT05GSUdfS0VZQk9BUkRfT01BUDQ9eQpDT05GSUdfS0VZQk9BUkRfU1BF
QVI9eQpDT05GSUdfS0VZQk9BUkRfVE0yX1RPVUNIS0VZPXkKIyBDT05GSUdfS0VZQk9BUkRfWFRL
QkQgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9DUk9TX0VDIGlzIG5vdCBzZXQKIyBDT05G
SUdfS0VZQk9BUkRfQ0FQMTFYWCBpcyBub3Qgc2V0CkNPTkZJR19LRVlCT0FSRF9CQ009eQojIENP
TkZJR19LRVlCT0FSRF9NVDY3NzkgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9DWVBSRVNT
X1NGIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfTU9VU0UgaXMgbm90IHNldAojIENPTkZJR19J
TlBVVF9KT1lTVElDSyBpcyBub3Qgc2V0CkNPTkZJR19JTlBVVF9UQUJMRVQ9eQojIENPTkZJR19U
QUJMRVRfU0VSSUFMX1dBQ09NNCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX1RPVUNIU0NSRUVO
IGlzIG5vdCBzZXQKQ09ORklHX0lOUFVUX01JU0M9eQpDT05GSUdfSU5QVVRfODhQTTg2MFhfT05L
RVk9eQpDT05GSUdfSU5QVVRfQUQ3MTRYPXkKIyBDT05GSUdfSU5QVVRfQUQ3MTRYX0kyQyBpcyBu
b3Qgc2V0CkNPTkZJR19JTlBVVF9BVEMyNjBYX09OS0VZPXkKQ09ORklHX0lOUFVUX0FUTUVMX0NB
UFRPVUNIPXkKQ09ORklHX0lOUFVUX0JNQTE1MD15CkNPTkZJR19JTlBVVF9FM1gwX0JVVFRPTj15
CkNPTkZJR19JTlBVVF9QTTg5NDFfUFdSS0VZPXkKIyBDT05GSUdfSU5QVVRfUE04WFhYX1ZJQlJB
VE9SIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfTUFYNzc2NTBfT05LRVkgaXMgbm90IHNldAoj
IENPTkZJR19JTlBVVF9NTUE4NDUwIGlzIG5vdCBzZXQKQ09ORklHX0lOUFVUX0dQSU9fQkVFUEVS
PXkKQ09ORklHX0lOUFVUX0dQSU9fREVDT0RFUj15CkNPTkZJR19JTlBVVF9HUElPX1ZJQlJBPXkK
Q09ORklHX0lOUFVUX0tYVEo5PXkKQ09ORklHX0lOUFVUX1JFR1VMQVRPUl9IQVBUSUM9eQpDT05G
SUdfSU5QVVRfUkVUVV9QV1JCVVRUT049eQpDT05GSUdfSU5QVVRfQVhQMjBYX1BFSz15CiMgQ09O
RklHX0lOUFVUX1RXTDYwNDBfVklCUkEgaXMgbm90IHNldApDT05GSUdfSU5QVVRfVUlOUFVUPXkK
Q09ORklHX0lOUFVUX1BDRjg1NzQ9eQojIENPTkZJR19JTlBVVF9SSzgwNV9QV1JLRVkgaXMgbm90
IHNldApDT05GSUdfSU5QVVRfR1BJT19ST1RBUllfRU5DT0RFUj15CkNPTkZJR19JTlBVVF9EQTcy
ODBfSEFQVElDUz15CkNPTkZJR19JTlBVVF9EQTkwNTJfT05LRVk9eQojIENPTkZJR19JTlBVVF9E
QTkwNjNfT05LRVkgaXMgbm90IHNldApDT05GSUdfSU5QVVRfV004MzFYX09OPXkKQ09ORklHX0lO
UFVUX0FEWEwzNFg9eQojIENPTkZJR19JTlBVVF9BRFhMMzRYX0kyQyBpcyBub3Qgc2V0CkNPTkZJ
R19JTlBVVF9JUVMyNjlBPXkKQ09ORklHX0lOUFVUX0lRUzYyNkE9eQpDT05GSUdfSU5QVVRfQ01B
MzAwMD15CkNPTkZJR19JTlBVVF9DTUEzMDAwX0kyQz15CiMgQ09ORklHX0lOUFVUX0RSVjI2MFhf
SEFQVElDUyBpcyBub3Qgc2V0CkNPTkZJR19JTlBVVF9EUlYyNjY1X0hBUFRJQ1M9eQpDT05GSUdf
SU5QVVRfRFJWMjY2N19IQVBUSUNTPXkKIyBDT05GSUdfSU5QVVRfSElTSV9QT1dFUktFWSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0lOUFVUX1NDMjdYWF9WSUJSQSBpcyBub3Qgc2V0CkNPTkZJR19STUk0
X0NPUkU9eQpDT05GSUdfUk1JNF9JMkM9eQojIENPTkZJR19STUk0X1NNQiBpcyBub3Qgc2V0CkNP
TkZJR19STUk0X0YwMz15CkNPTkZJR19STUk0X0YwM19TRVJJTz15CkNPTkZJR19STUk0XzJEX1NF
TlNPUj15CkNPTkZJR19STUk0X0YxMT15CkNPTkZJR19STUk0X0YxMj15CkNPTkZJR19STUk0X0Yz
MD15CiMgQ09ORklHX1JNSTRfRjM0IGlzIG5vdCBzZXQKQ09ORklHX1JNSTRfRjNBPXkKQ09ORklH
X1JNSTRfRjU1PXkKCiMKIyBIYXJkd2FyZSBJL08gcG9ydHMKIwpDT05GSUdfU0VSSU89eQpDT05G
SUdfU0VSSU9fU0VSUE9SVD15CiMgQ09ORklHX1NFUklPX1BBUktCRCBpcyBub3Qgc2V0CkNPTkZJ
R19TRVJJT19BTUJBS01JPXkKQ09ORklHX1NFUklPX1BDSVBTMj15CkNPTkZJR19TRVJJT19MSUJQ
UzI9eQojIENPTkZJR19TRVJJT19SQVcgaXMgbm90IHNldAojIENPTkZJR19TRVJJT19BTFRFUkFf
UFMyIGlzIG5vdCBzZXQKQ09ORklHX1NFUklPX1BTMk1VTFQ9eQpDT05GSUdfU0VSSU9fQVJDX1BT
Mj15CkNPTkZJR19TRVJJT19BUEJQUzI9eQojIENPTkZJR19TRVJJT19PTFBDX0FQU1AgaXMgbm90
IHNldApDT05GSUdfU0VSSU9fU1VONElfUFMyPXkKQ09ORklHX1NFUklPX0dQSU9fUFMyPXkKQ09O
RklHX1VTRVJJTz15CkNPTkZJR19HQU1FUE9SVD15CiMgQ09ORklHX0dBTUVQT1JUX05TNTU4IGlz
IG5vdCBzZXQKQ09ORklHX0dBTUVQT1JUX0w0PXkKQ09ORklHX0dBTUVQT1JUX0VNVTEwSzE9eQpD
T05GSUdfR0FNRVBPUlRfRk04MDE9eQojIGVuZCBvZiBIYXJkd2FyZSBJL08gcG9ydHMKIyBlbmQg
b2YgSW5wdXQgZGV2aWNlIHN1cHBvcnQKCiMKIyBDaGFyYWN0ZXIgZGV2aWNlcwojCkNPTkZJR19U
VFk9eQpDT05GSUdfVlQ9eQpDT05GSUdfQ09OU09MRV9UUkFOU0xBVElPTlM9eQpDT05GSUdfVlRf
Q09OU09MRT15CkNPTkZJR19IV19DT05TT0xFPXkKQ09ORklHX1ZUX0hXX0NPTlNPTEVfQklORElO
Rz15CkNPTkZJR19VTklYOThfUFRZUz15CkNPTkZJR19MRUdBQ1lfUFRZUz15CkNPTkZJR19MRUdB
Q1lfUFRZX0NPVU5UPTI1NgojIENPTkZJR19MRElTQ19BVVRPTE9BRCBpcyBub3Qgc2V0CgojCiMg
U2VyaWFsIGRyaXZlcnMKIwpDT05GSUdfU0VSSUFMX0VBUkxZQ09OPXkKIyBDT05GSUdfU0VSSUFM
XzgyNTAgaXMgbm90IHNldAoKIwojIE5vbi04MjUwIHNlcmlhbCBwb3J0IHN1cHBvcnQKIwpDT05G
SUdfU0VSSUFMX0FNQkFfUEwwMTA9eQpDT05GSUdfU0VSSUFMX0FNQkFfUEwwMTBfQ09OU09MRT15
CiMgQ09ORklHX1NFUklBTF9BTUJBX1BMMDExIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX0VB
UkxZQ09OX0FSTV9TRU1JSE9TVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9BVE1FTCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFUklBTF9LR0RCX05NSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklB
TF9NRVNPTiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9DTFBTNzExWCBpcyBub3Qgc2V0CkNP
TkZJR19TRVJJQUxfU0FNU1VORz15CkNPTkZJR19TRVJJQUxfU0FNU1VOR19VQVJUU180PXkKQ09O
RklHX1NFUklBTF9TQU1TVU5HX1VBUlRTPTQKQ09ORklHX1NFUklBTF9TQU1TVU5HX0NPTlNPTEU9
eQojIENPTkZJR19TRVJJQUxfVEVHUkEgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfVEVHUkFf
VENVIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX0lNWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
UklBTF9JTVhfRUFSTFlDT04gaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfVUFSVExJVEUgaXMg
bm90IHNldApDT05GSUdfU0VSSUFMX1NIX1NDST15CkNPTkZJR19TRVJJQUxfU0hfU0NJX05SX1VB
UlRTPTE4CkNPTkZJR19TRVJJQUxfU0hfU0NJX0NPTlNPTEU9eQpDT05GSUdfU0VSSUFMX1NIX1ND
SV9FQVJMWUNPTj15CiMgQ09ORklHX1NFUklBTF9IU19MUEMzMlhYIGlzIG5vdCBzZXQKQ09ORklH
X1NFUklBTF9DT1JFPXkKQ09ORklHX1NFUklBTF9DT1JFX0NPTlNPTEU9eQpDT05GSUdfQ09OU09M
RV9QT0xMPXkKIyBDT05GSUdfU0VSSUFMX0lDT00gaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxf
SlNNIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF9NU009eQojIENPTkZJR19TRVJJQUxfTVNNX0NP
TlNPTEUgaXMgbm90IHNldApDT05GSUdfU0VSSUFMX1FDT01fR0VOST15CiMgQ09ORklHX1NFUklB
TF9RQ09NX0dFTklfQ09OU09MRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9WVDg1MDAgaXMg
bm90IHNldApDT05GSUdfU0VSSUFMX09NQVA9eQojIENPTkZJR19TRVJJQUxfT01BUF9DT05TT0xF
IGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF9TSUZJVkU9eQpDT05GSUdfU0VSSUFMX1NJRklWRV9D
T05TT0xFPXkKIyBDT05GSUdfU0VSSUFMX0xBTlRJUSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklB
TF9TQ0NOWFAgaXMgbm90IHNldApDT05GSUdfU0VSSUFMX1NDMTZJUzdYWF9DT1JFPXkKQ09ORklH
X1NFUklBTF9TQzE2SVM3WFg9eQpDT05GSUdfU0VSSUFMX1NDMTZJUzdYWF9JMkM9eQojIENPTkZJ
R19TRVJJQUxfVElNQkVSREFMRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9CQ002M1hYIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX0FMVEVSQV9KVEFHVUFSVCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFUklBTF9BTFRFUkFfVUFSVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9QQ0hfVUFS
VCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9NWFNfQVVBUlQgaXMgbm90IHNldApDT05GSUdf
U0VSSUFMX1hJTElOWF9QU19VQVJUPXkKIyBDT05GSUdfU0VSSUFMX1hJTElOWF9QU19VQVJUX0NP
TlNPTEUgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfTVBTMl9VQVJUIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VSSUFMX0FSQyBpcyBub3Qgc2V0CkNPTkZJR19TRVJJQUxfUlAyPXkKQ09ORklHX1NF
UklBTF9SUDJfTlJfVUFSVFM9MzIKQ09ORklHX1NFUklBTF9GU0xfTFBVQVJUPXkKIyBDT05GSUdf
U0VSSUFMX0ZTTF9MUFVBUlRfQ09OU09MRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9GU0xf
TElORkxFWFVBUlQgaXMgbm90IHNldApDT05GSUdfU0VSSUFMX0NPTkVYQU5UX0RJR0lDT0xPUj15
CiMgQ09ORklHX1NFUklBTF9DT05FWEFOVF9ESUdJQ09MT1JfQ09OU09MRSBpcyBub3Qgc2V0CiMg
Q09ORklHX1NFUklBTF9TVF9BU0MgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfTUVOX1oxMzUg
aXMgbm90IHNldApDT05GSUdfU0VSSUFMX1NQUkQ9eQpDT05GSUdfU0VSSUFMX1NQUkRfQ09OU09M
RT15CkNPTkZJR19TRVJJQUxfU1RNMzI9eQojIENPTkZJR19TRVJJQUxfU1RNMzJfQ09OU09MRSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9NVkVCVV9VQVJUIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VSSUFMX09XTCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9SREEgaXMgbm90IHNldAojIENP
TkZJR19TRVJJQUxfTUlMQkVBVVRfVVNJTyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9MSVRF
VUFSVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9TVU5QTFVTIGlzIG5vdCBzZXQKIyBlbmQg
b2YgU2VyaWFsIGRyaXZlcnMKCkNPTkZJR19TRVJJQUxfTUNUUkxfR1BJTz15CkNPTkZJR19TRVJJ
QUxfTk9OU1RBTkRBUkQ9eQpDT05GSUdfTU9YQV9JTlRFTExJTz15CkNPTkZJR19NT1hBX1NNQVJU
SU89eQpDT05GSUdfU1lOQ0xJTktfR1Q9eQpDT05GSUdfTl9IRExDPXkKQ09ORklHX05PWk9NST15
CkNPTkZJR19OVUxMX1RUWT15CkNPTkZJR19IVkNfRFJJVkVSPXkKQ09ORklHX0hWQ19EQ0M9eQoj
IENPTkZJR19SUE1TR19UVFkgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfREVWX0JVUyBpcyBu
b3Qgc2V0CkNPTkZJR19QUklOVEVSPXkKIyBDT05GSUdfTFBfQ09OU09MRSBpcyBub3Qgc2V0CkNP
TkZJR19QUERFVj15CiMgQ09ORklHX1ZJUlRJT19DT05TT0xFIGlzIG5vdCBzZXQKQ09ORklHX0lQ
TUlfSEFORExFUj15CkNPTkZJR19JUE1JX1BMQVRfREFUQT15CkNPTkZJR19JUE1JX1BBTklDX0VW
RU5UPXkKIyBDT05GSUdfSVBNSV9QQU5JQ19TVFJJTkcgaXMgbm90IHNldApDT05GSUdfSVBNSV9E
RVZJQ0VfSU5URVJGQUNFPXkKQ09ORklHX0lQTUlfU0k9eQojIENPTkZJR19JUE1JX1NTSUYgaXMg
bm90IHNldApDT05GSUdfSVBNSV9JUE1CPXkKIyBDT05GSUdfSVBNSV9XQVRDSERPRyBpcyBub3Qg
c2V0CkNPTkZJR19JUE1JX1BPV0VST0ZGPXkKQ09ORklHX0lQTUlfS0NTX0JNQz15CiMgQ09ORklH
X0FTUEVFRF9LQ1NfSVBNSV9CTUMgaXMgbm90IHNldApDT05GSUdfTlBDTTdYWF9LQ1NfSVBNSV9C
TUM9eQojIENPTkZJR19JUE1JX0tDU19CTUNfQ0RFVl9JUE1JIGlzIG5vdCBzZXQKQ09ORklHX0lQ
TUlfS0NTX0JNQ19TRVJJTz15CiMgQ09ORklHX0FTUEVFRF9CVF9JUE1JX0JNQyBpcyBub3Qgc2V0
CiMgQ09ORklHX0lQTUJfREVWSUNFX0lOVEVSRkFDRSBpcyBub3Qgc2V0CkNPTkZJR19IV19SQU5E
T009eQpDT05GSUdfSFdfUkFORE9NX1RJTUVSSU9NRU09eQpDT05GSUdfSFdfUkFORE9NX0FUTUVM
PXkKQ09ORklHX0hXX1JBTkRPTV9CQTQzMT15CkNPTkZJR19IV19SQU5ET01fQkNNMjgzNT15CkNP
TkZJR19IV19SQU5ET01fSVBST0NfUk5HMjAwPXkKQ09ORklHX0hXX1JBTkRPTV9JWFA0WFg9eQoj
IENPTkZJR19IV19SQU5ET01fT01BUCBpcyBub3Qgc2V0CkNPTkZJR19IV19SQU5ET01fT01BUDNf
Uk9NPXkKQ09ORklHX0hXX1JBTkRPTV9WSVJUSU89eQpDT05GSUdfSFdfUkFORE9NX0lNWF9STkdD
PXkKQ09ORklHX0hXX1JBTkRPTV9OT01BRElLPXkKQ09ORklHX0hXX1JBTkRPTV9ISVNJPXkKQ09O
RklHX0hXX1JBTkRPTV9TVE0zMj15CkNPTkZJR19IV19SQU5ET01fTUVTT049eQpDT05GSUdfSFdf
UkFORE9NX01USz15CiMgQ09ORklHX0hXX1JBTkRPTV9FWFlOT1MgaXMgbm90IHNldApDT05GSUdf
SFdfUkFORE9NX09QVEVFPXkKQ09ORklHX0hXX1JBTkRPTV9OUENNPXkKQ09ORklHX0hXX1JBTkRP
TV9LRVlTVE9ORT15CiMgQ09ORklHX0hXX1JBTkRPTV9DQ1RSTkcgaXMgbm90IHNldApDT05GSUdf
SFdfUkFORE9NX1hJUEhFUkE9eQpDT05GSUdfSFdfUkFORE9NX0FSTV9TTUNDQ19UUk5HPXkKQ09O
RklHX0FQUExJQ09NPXkKQ09ORklHX0RFVk1FTT15CkNPTkZJR19ERVZQT1JUPXkKQ09ORklHX1RD
R19UUE09eQpDT05GSUdfSFdfUkFORE9NX1RQTT15CiMgQ09ORklHX1RDR19USVMgaXMgbm90IHNl
dAojIENPTkZJR19UQ0dfVElTX1NZTlFVQUNFUiBpcyBub3Qgc2V0CkNPTkZJR19UQ0dfVElTX0ky
Q19DUjUwPXkKIyBDT05GSUdfVENHX1RJU19JMkNfQVRNRUwgaXMgbm90IHNldAojIENPTkZJR19U
Q0dfVElTX0kyQ19JTkZJTkVPTiBpcyBub3Qgc2V0CkNPTkZJR19UQ0dfVElTX0kyQ19OVVZPVE9O
PXkKIyBDT05GSUdfVENHX1ZUUE1fUFJPWFkgaXMgbm90IHNldApDT05GSUdfVENHX0ZUUE1fVEVF
PXkKIyBDT05GSUdfVENHX1RJU19TVDMzWlAyNF9JMkMgaXMgbm90IHNldApDT05GSUdfWElMTFlC
VVNfQ0xBU1M9eQpDT05GSUdfWElMTFlCVVM9eQpDT05GSUdfWElMTFlCVVNfUENJRT15CkNPTkZJ
R19YSUxMWUJVU19PRj15CiMgQ09ORklHX1JBTkRPTV9UUlVTVF9CT09UTE9BREVSIGlzIG5vdCBz
ZXQKIyBlbmQgb2YgQ2hhcmFjdGVyIGRldmljZXMKCiMKIyBJMkMgc3VwcG9ydAojCkNPTkZJR19J
MkM9eQpDT05GSUdfSTJDX0JPQVJESU5GTz15CkNPTkZJR19JMkNfQ09NUEFUPXkKIyBDT05GSUdf
STJDX0NIQVJERVYgaXMgbm90IHNldApDT05GSUdfSTJDX01VWD15CgojCiMgTXVsdGlwbGV4ZXIg
STJDIENoaXAgc3VwcG9ydAojCiMgQ09ORklHX0kyQ19BUkJfR1BJT19DSEFMTEVOR0UgaXMgbm90
IHNldAojIENPTkZJR19JMkNfTVVYX0dQSU8gaXMgbm90IHNldApDT05GSUdfSTJDX01VWF9HUE1V
WD15CkNPTkZJR19JMkNfTVVYX0xUQzQzMDY9eQpDT05GSUdfSTJDX01VWF9QQ0E5NTQxPXkKQ09O
RklHX0kyQ19NVVhfUENBOTU0eD15CkNPTkZJR19JMkNfTVVYX1BJTkNUUkw9eQpDT05GSUdfSTJD
X01VWF9SRUc9eQpDT05GSUdfSTJDX0RFTVVYX1BJTkNUUkw9eQpDT05GSUdfSTJDX01VWF9NTFhD
UExEPXkKIyBlbmQgb2YgTXVsdGlwbGV4ZXIgSTJDIENoaXAgc3VwcG9ydAoKQ09ORklHX0kyQ19I
RUxQRVJfQVVUTz15CkNPTkZJR19JMkNfU01CVVM9eQpDT05GSUdfSTJDX0FMR09CSVQ9eQpDT05G
SUdfSTJDX0FMR09QQ0E9eQoKIwojIEkyQyBIYXJkd2FyZSBCdXMgc3VwcG9ydAojCgojCiMgUEMg
U01CdXMgaG9zdCBjb250cm9sbGVyIGRyaXZlcnMKIwpDT05GSUdfSTJDX0NDR1hfVUNTST15CkNP
TkZJR19JMkNfQUxJMTUzNT15CiMgQ09ORklHX0kyQ19BTEkxNTYzIGlzIG5vdCBzZXQKQ09ORklH
X0kyQ19BTEkxNVgzPXkKIyBDT05GSUdfSTJDX0FNRDc1NiBpcyBub3Qgc2V0CkNPTkZJR19JMkNf
QU1EODExMT15CkNPTkZJR19JMkNfSElYNUhEMj15CiMgQ09ORklHX0kyQ19JODAxIGlzIG5vdCBz
ZXQKQ09ORklHX0kyQ19JU0NIPXkKIyBDT05GSUdfSTJDX1BJSVg0IGlzIG5vdCBzZXQKQ09ORklH
X0kyQ19ORk9SQ0UyPXkKQ09ORklHX0kyQ19OVklESUFfR1BVPXkKIyBDT05GSUdfSTJDX1NJUzU1
OTUgaXMgbm90IHNldAojIENPTkZJR19JMkNfU0lTNjMwIGlzIG5vdCBzZXQKQ09ORklHX0kyQ19T
SVM5Nlg9eQpDT05GSUdfSTJDX1ZJQT15CiMgQ09ORklHX0kyQ19WSUFQUk8gaXMgbm90IHNldAoK
IwojIEkyQyBzeXN0ZW0gYnVzIGRyaXZlcnMgKG1vc3RseSBlbWJlZGRlZCAvIHN5c3RlbS1vbi1j
aGlwKQojCiMgQ09ORklHX0kyQ19BTFRFUkEgaXMgbm90IHNldAojIENPTkZJR19JMkNfQVNQRUVE
IGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0FUOTEgaXMgbm90IHNldAojIENPTkZJR19JMkNfQVhY
SUEgaXMgbm90IHNldAojIENPTkZJR19JMkNfQkNNMjgzNSBpcyBub3Qgc2V0CiMgQ09ORklHX0ky
Q19CQ01fSVBST0MgaXMgbm90IHNldAojIENPTkZJR19JMkNfQkNNX0tPTkEgaXMgbm90IHNldApD
T05GSUdfSTJDX0JSQ01TVEI9eQojIENPTkZJR19JMkNfQ0FERU5DRSBpcyBub3Qgc2V0CkNPTkZJ
R19JMkNfQ0JVU19HUElPPXkKQ09ORklHX0kyQ19EQVZJTkNJPXkKQ09ORklHX0kyQ19ERVNJR05X
QVJFX0NPUkU9eQpDT05GSUdfSTJDX0RFU0lHTldBUkVfU0xBVkU9eQojIENPTkZJR19JMkNfREVT
SUdOV0FSRV9QTEFURk9STSBpcyBub3Qgc2V0CkNPTkZJR19JMkNfREVTSUdOV0FSRV9QQ0k9eQpD
T05GSUdfSTJDX0RJR0lDT0xPUj15CiMgQ09ORklHX0kyQ19FRzIwVCBpcyBub3Qgc2V0CiMgQ09O
RklHX0kyQ19FTUVWMiBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19FWFlOT1M1IGlzIG5vdCBzZXQK
IyBDT05GSUdfSTJDX0dQSU8gaXMgbm90IHNldAojIENPTkZJR19JMkNfSElHSExBTkRFUiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0kyQ19ISVNJIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0lNRyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0kyQ19JTVggaXMgbm90IHNldAojIENPTkZJR19JMkNfSU1YX0xQSTJD
IGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0lPUDNYWCBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19K
WjQ3ODAgaXMgbm90IHNldAojIENPTkZJR19JMkNfS0VNUExEIGlzIG5vdCBzZXQKIyBDT05GSUdf
STJDX0xQQzJLIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX01FU09OIGlzIG5vdCBzZXQKIyBDT05G
SUdfSTJDX01UNjVYWCBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19NVDc2MjEgaXMgbm90IHNldApD
T05GSUdfSTJDX01WNjRYWFg9eQojIENPTkZJR19JMkNfTVhTIGlzIG5vdCBzZXQKQ09ORklHX0ky
Q19OT01BRElLPXkKIyBDT05GSUdfSTJDX05QQ003WFggaXMgbm90IHNldApDT05GSUdfSTJDX09D
T1JFUz15CkNPTkZJR19JMkNfT01BUD15CiMgQ09ORklHX0kyQ19PV0wgaXMgbm90IHNldAojIENP
TkZJR19JMkNfQVBQTEUgaXMgbm90IHNldApDT05GSUdfSTJDX1BDQV9QTEFURk9STT15CiMgQ09O
RklHX0kyQ19QTlggaXMgbm90IHNldAojIENPTkZJR19JMkNfUFhBIGlzIG5vdCBzZXQKQ09ORklH
X0kyQ19RQ09NX0NDST15CkNPTkZJR19JMkNfUUNPTV9HRU5JPXkKIyBDT05GSUdfSTJDX1FVUCBp
cyBub3Qgc2V0CkNPTkZJR19JMkNfUklJQz15CkNPTkZJR19JMkNfUkszWD15CkNPTkZJR19JMkNf
UzNDMjQxMD15CkNPTkZJR19JMkNfU0hfTU9CSUxFPXkKQ09ORklHX0kyQ19TSU1URUM9eQojIENP
TkZJR19JMkNfU1BSRCBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19TVCBpcyBub3Qgc2V0CiMgQ09O
RklHX0kyQ19TVE0zMkY0IGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1NUTTMyRjcgaXMgbm90IHNl
dAojIENPTkZJR19JMkNfU1VONklfUDJXSSBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19TWU5RVUFD
RVIgaXMgbm90IHNldAojIENPTkZJR19JMkNfVEVHUkEgaXMgbm90IHNldAojIENPTkZJR19JMkNf
VEVHUkFfQlBNUCBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19VTklQSElFUiBpcyBub3Qgc2V0CiMg
Q09ORklHX0kyQ19VTklQSElFUl9GIGlzIG5vdCBzZXQKQ09ORklHX0kyQ19WRVJTQVRJTEU9eQoj
IENPTkZJR19JMkNfV01UIGlzIG5vdCBzZXQKQ09ORklHX0kyQ19YSUxJTlg9eQojIENPTkZJR19J
MkNfWExQOVhYIGlzIG5vdCBzZXQKQ09ORklHX0kyQ19SQ0FSPXkKCiMKIyBFeHRlcm5hbCBJMkMv
U01CdXMgYWRhcHRlciBkcml2ZXJzCiMKQ09ORklHX0kyQ19QQVJQT1JUPXkKQ09ORklHX0kyQ19U
QU9TX0VWTT15CgojCiMgT3RoZXIgSTJDL1NNQnVzIGJ1cyBkcml2ZXJzCiMKIyBDT05GSUdfSTJD
X01MWENQTEQgaXMgbm90IHNldAojIENPTkZJR19JMkNfQ1JPU19FQ19UVU5ORUwgaXMgbm90IHNl
dApDT05GSUdfSTJDX0ZTST15CkNPTkZJR19JMkNfVklSVElPPXkKIyBlbmQgb2YgSTJDIEhhcmR3
YXJlIEJ1cyBzdXBwb3J0CgpDT05GSUdfSTJDX1NMQVZFPXkKIyBDT05GSUdfSTJDX1NMQVZFX0VF
UFJPTSBpcyBub3Qgc2V0CkNPTkZJR19JMkNfU0xBVkVfVEVTVFVOSVQ9eQpDT05GSUdfSTJDX0RF
QlVHX0NPUkU9eQpDT05GSUdfSTJDX0RFQlVHX0FMR089eQojIENPTkZJR19JMkNfREVCVUdfQlVT
IGlzIG5vdCBzZXQKIyBlbmQgb2YgSTJDIHN1cHBvcnQKCiMgQ09ORklHX0kzQyBpcyBub3Qgc2V0
CiMgQ09ORklHX1NQSSBpcyBub3Qgc2V0CkNPTkZJR19TUE1JPXkKQ09ORklHX1NQTUlfSElTSTM2
NzA9eQpDT05GSUdfU1BNSV9NU01fUE1JQ19BUkI9eQojIENPTkZJR19TUE1JX01US19QTUlGIGlz
IG5vdCBzZXQKQ09ORklHX0hTST15CkNPTkZJR19IU0lfQk9BUkRJTkZPPXkKCiMKIyBIU0kgY29u
dHJvbGxlcnMKIwojIENPTkZJR19PTUFQX1NTSSBpcyBub3Qgc2V0CgojCiMgSFNJIGNsaWVudHMK
IwojIENPTkZJR19IU0lfQ0hBUiBpcyBub3Qgc2V0CkNPTkZJR19QUFM9eQojIENPTkZJR19QUFNf
REVCVUcgaXMgbm90IHNldAoKIwojIFBQUyBjbGllbnRzIHN1cHBvcnQKIwojIENPTkZJR19QUFNf
Q0xJRU5UX0tUSU1FUiBpcyBub3Qgc2V0CkNPTkZJR19QUFNfQ0xJRU5UX0xESVNDPXkKQ09ORklH
X1BQU19DTElFTlRfUEFSUE9SVD15CkNPTkZJR19QUFNfQ0xJRU5UX0dQSU89eQoKIwojIFBQUyBn
ZW5lcmF0b3JzIHN1cHBvcnQKIwoKIwojIFBUUCBjbG9jayBzdXBwb3J0CiMKQ09ORklHX1BUUF8x
NTg4X0NMT0NLX09QVElPTkFMPXkKCiMKIyBFbmFibGUgUEhZTElCIGFuZCBORVRXT1JLX1BIWV9U
SU1FU1RBTVBJTkcgdG8gc2VlIHRoZSBhZGRpdGlvbmFsIGNsb2Nrcy4KIwojIGVuZCBvZiBQVFAg
Y2xvY2sgc3VwcG9ydAoKQ09ORklHX1BJTkNUUkw9eQpDT05GSUdfR0VORVJJQ19QSU5DVFJMX0dS
T1VQUz15CkNPTkZJR19QSU5NVVg9eQpDT05GSUdfR0VORVJJQ19QSU5NVVhfRlVOQ1RJT05TPXkK
Q09ORklHX1BJTkNPTkY9eQpDT05GSUdfR0VORVJJQ19QSU5DT05GPXkKIyBDT05GSUdfREVCVUdf
UElOQ1RSTCBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfQU1EIGlzIG5vdCBzZXQKQ09ORklH
X1BJTkNUUkxfQVMzNzIyPXkKQ09ORklHX1BJTkNUUkxfQVQ5MT15CkNPTkZJR19QSU5DVFJMX0FU
OTFQSU80PXkKQ09ORklHX1BJTkNUUkxfQVhQMjA5PXkKIyBDT05GSUdfUElOQ1RSTF9CTTE4ODAg
aXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX0RBODUwX1BVUEQgaXMgbm90IHNldApDT05GSUdf
UElOQ1RSTF9ESUdJQ09MT1I9eQojIENPTkZJR19QSU5DVFJMX0VRVUlMSUJSSVVNIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUElOQ1RSTF9JTkdFTklDIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9M
UEMxOFhYIGlzIG5vdCBzZXQKQ09ORklHX1BJTkNUUkxfTUNQMjNTMDhfSTJDPXkKQ09ORklHX1BJ
TkNUUkxfTUNQMjNTMDg9eQpDT05GSUdfUElOQ1RSTF9NSUNST0NISVBfU0dQSU89eQojIENPTkZJ
R19QSU5DVFJMX09DRUxPVCBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfUElTVEFDSElPIGlz
IG5vdCBzZXQKQ09ORklHX1BJTkNUUkxfUks4MDU9eQojIENPTkZJR19QSU5DVFJMX1JPQ0tDSElQ
IGlzIG5vdCBzZXQKQ09ORklHX1BJTkNUUkxfU0lOR0xFPXkKIyBDT05GSUdfUElOQ1RSTF9TVEFS
RklWRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfU1RNRlggaXMgbm90IHNldApDT05GSUdf
UElOQ1RSTF9TWDE1MFg9eQojIENPTkZJR19QSU5DVFJMX09XTCBpcyBub3Qgc2V0CiMgQ09ORklH
X1BJTkNUUkxfQVNQRUVEX0c0IGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9BU1BFRURfRzUg
aXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX0FTUEVFRF9HNiBpcyBub3Qgc2V0CiMgQ09ORklH
X1BJTkNUUkxfQkNNMjgxWFggaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX0JDTTI4MzUgaXMg
bm90IHNldAojIENPTkZJR19QSU5DVFJMX0JDTTQ5MDggaXMgbm90IHNldAojIENPTkZJR19QSU5D
VFJMX0JDTTYzMTggaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX0JDTTYzMjggaXMgbm90IHNl
dAojIENPTkZJR19QSU5DVFJMX0JDTTYzNTggaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX0JD
TTYzNjIgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX0JDTTYzNjggaXMgbm90IHNldAojIENP
TkZJR19QSU5DVFJMX0JDTTYzMjY4IGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9JUFJPQ19H
UElPIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9DWUdOVVNfTVVYIGlzIG5vdCBzZXQKIyBD
T05GSUdfUElOQ1RSTF9OUyBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfTlNQX0dQSU8gaXMg
bm90IHNldAojIENPTkZJR19QSU5DVFJMX05TMl9NVVggaXMgbm90IHNldAojIENPTkZJR19QSU5D
VFJMX05TUF9NVVggaXMgbm90IHNldApDT05GSUdfUElOQ1RSTF9CRVJMSU49eQojIENPTkZJR19Q
SU5DVFJMX0FTMzcwIGlzIG5vdCBzZXQKQ09ORklHX1BJTkNUUkxfQkVSTElOX0JHMj15CkNPTkZJ
R19QSU5DVFJMX0JFUkxJTl9CRzJDRD15CkNPTkZJR19QSU5DVFJMX0JFUkxJTl9CRzRDVD15Cgoj
CiMgSW50ZWwgcGluY3RybCBkcml2ZXJzCiMKIyBlbmQgb2YgSW50ZWwgcGluY3RybCBkcml2ZXJz
CgojCiMgTWVkaWFUZWsgcGluY3RybCBkcml2ZXJzCiMKIyBDT05GSUdfRUlOVF9NVEsgaXMgbm90
IHNldAojIENPTkZJR19QSU5DVFJMX01UMjcwMSBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxf
TVQ3NjIzIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9NVDc2MjkgaXMgbm90IHNldAojIENP
TkZJR19QSU5DVFJMX01UODEzNSBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfTVQ4MTI3IGlz
IG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9NVDI3MTIgaXMgbm90IHNldAojIENPTkZJR19QSU5D
VFJMX01UNjc2NSBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfTVQ2Nzc5IGlzIG5vdCBzZXQK
IyBDT05GSUdfUElOQ1RSTF9NVDY3OTcgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX01UNzYy
MiBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfTVQ3OTg2IGlzIG5vdCBzZXQKIyBDT05GSUdf
UElOQ1RSTF9NVDgxNjcgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX01UODE3MyBpcyBub3Qg
c2V0CiMgQ09ORklHX1BJTkNUUkxfTVQ4MTgzIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9N
VDgxODYgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX01UODE5MiBpcyBub3Qgc2V0CiMgQ09O
RklHX1BJTkNUUkxfTVQ4MTk1IGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9NVDgzNjUgaXMg
bm90IHNldAojIENPTkZJR19QSU5DVFJMX01UODUxNiBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNU
UkxfTVQ2Mzk3IGlzIG5vdCBzZXQKIyBlbmQgb2YgTWVkaWFUZWsgcGluY3RybCBkcml2ZXJzCgpD
T05GSUdfUElOQ1RSTF9NRVNPTj15CiMgQ09ORklHX1BJTkNUUkxfTUVTT044IGlzIG5vdCBzZXQK
IyBDT05GSUdfUElOQ1RSTF9NRVNPTjhCIGlzIG5vdCBzZXQKQ09ORklHX1BJTkNUUkxfTVZFQlU9
eQpDT05GSUdfUElOQ1RSTF9ET1ZFPXkKIyBDT05GSUdfUElOQ1RSTF9XUENNNDUwIGlzIG5vdCBz
ZXQKQ09ORklHX1BJTkNUUkxfTlBDTTdYWD15CiMgQ09ORklHX1BJTkNUUkxfUFhBMjVYIGlzIG5v
dCBzZXQKIyBDT05GSUdfUElOQ1RSTF9QWEEyN1ggaXMgbm90IHNldApDT05GSUdfUElOQ1RSTF9N
U009eQojIENPTkZJR19QSU5DVFJMX0FQUTgwNjQgaXMgbm90IHNldApDT05GSUdfUElOQ1RSTF9B
UFE4MDg0PXkKQ09ORklHX1BJTkNUUkxfSVBRNDAxOT15CkNPTkZJR19QSU5DVFJMX0lQUTgwNjQ9
eQojIENPTkZJR19QSU5DVFJMX0lQUTgwNzQgaXMgbm90IHNldApDT05GSUdfUElOQ1RSTF9JUFE2
MDE4PXkKQ09ORklHX1BJTkNUUkxfTVNNODIyNj15CkNPTkZJR19QSU5DVFJMX01TTTg2NjA9eQoj
IENPTkZJR19QSU5DVFJMX01TTTg5NjAgaXMgbm90IHNldApDT05GSUdfUElOQ1RSTF9NRE05NjA3
PXkKQ09ORklHX1BJTkNUUkxfTURNOTYxNT15CkNPTkZJR19QSU5DVFJMX01TTThYNzQ9eQpDT05G
SUdfUElOQ1RSTF9NU004OTE2PXkKQ09ORklHX1BJTkNUUkxfTVNNODk1Mz15CkNPTkZJR19QSU5D
VFJMX01TTTg5NzY9eQpDT05GSUdfUElOQ1RSTF9NU004OTk0PXkKQ09ORklHX1BJTkNUUkxfTVNN
ODk5Nj15CkNPTkZJR19QSU5DVFJMX01TTTg5OTg9eQojIENPTkZJR19QSU5DVFJMX1FDTTIyOTAg
aXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1FDUzQwNCBpcyBub3Qgc2V0CkNPTkZJR19QSU5D
VFJMX1FDT01fU1BNSV9QTUlDPXkKIyBDT05GSUdfUElOQ1RSTF9RQ09NX1NTQklfUE1JQyBpcyBu
b3Qgc2V0CkNPTkZJR19QSU5DVFJMX1NDNzE4MD15CkNPTkZJR19QSU5DVFJMX1NDNzI4MD15CkNP
TkZJR19QSU5DVFJMX1NDODE4MFg9eQojIENPTkZJR19QSU5DVFJMX1NDODI4MFhQIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUElOQ1RSTF9TRE02NjAgaXMgbm90IHNldApDT05GSUdfUElOQ1RSTF9TRE04
NDU9eQpDT05GSUdfUElOQ1RSTF9TRFg1NT15CkNPTkZJR19QSU5DVFJMX1NNNjExNT15CiMgQ09O
RklHX1BJTkNUUkxfU002MTI1IGlzIG5vdCBzZXQKQ09ORklHX1BJTkNUUkxfU002MzUwPXkKQ09O
RklHX1BJTkNUUkxfU0RYNjU9eQpDT05GSUdfUElOQ1RSTF9TTTgxNTA9eQpDT05GSUdfUElOQ1RS
TF9TTTgyNTA9eQojIENPTkZJR19QSU5DVFJMX1NNODM1MCBpcyBub3Qgc2V0CiMgQ09ORklHX1BJ
TkNUUkxfU004NDUwIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9MUEFTU19MUEkgaXMgbm90
IHNldAoKIwojIFJlbmVzYXMgcGluY3RybCBkcml2ZXJzCiMKQ09ORklHX1BJTkNUUkxfUkVORVNB
Uz15CkNPTkZJR19QSU5DVFJMX1NIX1BGQz15CkNPTkZJR19QSU5DVFJMX1NIX1BGQ19HUElPPXkK
Q09ORklHX1BJTkNUUkxfUEZDX0VNRVYyPXkKIyBDT05GSUdfUElOQ1RSTF9QRkNfUjhBNzc5OTUg
aXMgbm90IHNldApDT05GSUdfUElOQ1RSTF9QRkNfUjhBNzc5ND15CiMgQ09ORklHX1BJTkNUUkxf
UEZDX1I4QTc3OTkwIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9QRkNfUjhBNzc3OSBpcyBu
b3Qgc2V0CkNPTkZJR19QSU5DVFJMX1BGQ19SOEE3NzkwPXkKIyBDT05GSUdfUElOQ1RSTF9QRkNf
UjhBNzc5NTAgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1BGQ19SOEE3Nzk1MSBpcyBub3Qg
c2V0CiMgQ09ORklHX1BJTkNUUkxfUEZDX1I4QTc3NzggaXMgbm90IHNldApDT05GSUdfUElOQ1RS
TF9QRkNfUjhBNzc5Mz15CkNPTkZJR19QSU5DVFJMX1BGQ19SOEE3NzkxPXkKIyBDT05GSUdfUElO
Q1RSTF9QRkNfUjhBNzc5NjUgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1BGQ19SOEE3Nzk2
MCBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfUEZDX1I4QTc3OTYxIGlzIG5vdCBzZXQKIyBD
T05GSUdfUElOQ1RSTF9QRkNfUjhBNzc5RjAgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1BG
Q19SOEE3NzkyIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9QRkNfUjhBNzc5ODAgaXMgbm90
IHNldAojIENPTkZJR19QSU5DVFJMX1BGQ19SOEE3Nzk3MCBpcyBub3Qgc2V0CiMgQ09ORklHX1BJ
TkNUUkxfUEZDX1I4QTc3OUEwIGlzIG5vdCBzZXQKQ09ORklHX1BJTkNUUkxfUEZDX1I4QTc3NDA9
eQpDT05GSUdfUElOQ1RSTF9QRkNfUjhBNzNBND15CiMgQ09ORklHX1BJTkNUUkxfUlpBMSBpcyBu
b3Qgc2V0CkNPTkZJR19QSU5DVFJMX1JaQTI9eQojIENPTkZJR19QSU5DVFJMX1JaRzJMIGlzIG5v
dCBzZXQKIyBDT05GSUdfUElOQ1RSTF9QRkNfUjhBNzc0NzAgaXMgbm90IHNldApDT05GSUdfUElO
Q1RSTF9QRkNfUjhBNzc0NT15CkNPTkZJR19QSU5DVFJMX1BGQ19SOEE3NzQyPXkKQ09ORklHX1BJ
TkNUUkxfUEZDX1I4QTc3NDM9eQpDT05GSUdfUElOQ1RSTF9QRkNfUjhBNzc0ND15CiMgQ09ORklH
X1BJTkNUUkxfUEZDX1I4QTc3NEMwIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9QRkNfUjhB
Nzc0RTEgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1BGQ19SOEE3NzRBMSBpcyBub3Qgc2V0
CiMgQ09ORklHX1BJTkNUUkxfUEZDX1I4QTc3NEIxIGlzIG5vdCBzZXQKQ09ORklHX1BJTkNUUkxf
UlpOMT15CiMgQ09ORklHX1BJTkNUUkxfUEZDX1NINzIwMyBpcyBub3Qgc2V0CiMgQ09ORklHX1BJ
TkNUUkxfUEZDX1NINzI2NCBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfUEZDX1NINzI2OSBp
cyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfUEZDX1NINzcyMCBpcyBub3Qgc2V0CiMgQ09ORklH
X1BJTkNUUkxfUEZDX1NINzcyMiBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfUEZDX1NINzcz
NCBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfUEZDX1NINzc1NyBpcyBub3Qgc2V0CiMgQ09O
RklHX1BJTkNUUkxfUEZDX1NINzc4NSBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfUEZDX1NI
Nzc4NiBpcyBub3Qgc2V0CkNPTkZJR19QSU5DVFJMX1BGQ19TSDczQTA9eQojIENPTkZJR19QSU5D
VFJMX1BGQ19TSDc3MjMgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1BGQ19TSDc3MjQgaXMg
bm90IHNldAojIENPTkZJR19QSU5DVFJMX1BGQ19TSFgzIGlzIG5vdCBzZXQKIyBlbmQgb2YgUmVu
ZXNhcyBwaW5jdHJsIGRyaXZlcnMKCkNPTkZJR19QSU5DVFJMX1NBTVNVTkc9eQpDT05GSUdfUElO
Q1RSTF9FWFlOT1M9eQpDT05GSUdfUElOQ1RSTF9FWFlOT1NfQVJNPXkKIyBDT05GSUdfUElOQ1RS
TF9FWFlOT1NfQVJNNjQgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX1MzQzI0WFggaXMgbm90
IHNldAojIENPTkZJR19QSU5DVFJMX1MzQzY0WFggaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJM
X1NQUkRfU0M5ODYwIGlzIG5vdCBzZXQKQ09ORklHX1BJTkNUUkxfU1RNMzI9eQojIENPTkZJR19Q
SU5DVFJMX1NUTTMyRjQyOSBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfU1RNMzJGNDY5IGlz
IG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9TVE0zMkY3NDYgaXMgbm90IHNldAojIENPTkZJR19Q
SU5DVFJMX1NUTTMyRjc2OSBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfU1RNMzJINzQzIGlz
IG5vdCBzZXQKQ09ORklHX1BJTkNUUkxfU1RNMzJNUDEzNT15CkNPTkZJR19QSU5DVFJMX1NUTTMy
TVAxNTc9eQpDT05GSUdfUElOQ1RSTF9TVU5YST15CkNPTkZJR19QSU5DVFJMX1NVTjRJX0ExMD15
CkNPTkZJR19QSU5DVFJMX1NVTjVJPXkKQ09ORklHX1BJTkNUUkxfU1VONklfQTMxPXkKIyBDT05G
SUdfUElOQ1RSTF9TVU42SV9BMzFfUiBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfU1VOOElf
QTIzIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9TVU44SV9BMzMgaXMgbm90IHNldApDT05G
SUdfUElOQ1RSTF9TVU44SV9BODNUPXkKIyBDT05GSUdfUElOQ1RSTF9TVU44SV9BODNUX1IgaXMg
bm90IHNldAojIENPTkZJR19QSU5DVFJMX1NVTjhJX0EyM19SIGlzIG5vdCBzZXQKQ09ORklHX1BJ
TkNUUkxfU1VOOElfSDM9eQojIENPTkZJR19QSU5DVFJMX1NVTjhJX0gzX1IgaXMgbm90IHNldAoj
IENPTkZJR19QSU5DVFJMX1NVTjhJX1YzUyBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfU1VO
OUlfQTgwIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9TVU45SV9BODBfUiBpcyBub3Qgc2V0
CiMgQ09ORklHX1BJTkNUUkxfU1VONTBJX0E2NCBpcyBub3Qgc2V0CkNPTkZJR19QSU5DVFJMX1NV
TjUwSV9BNjRfUj15CiMgQ09ORklHX1BJTkNUUkxfU1VONTBJX0ExMDAgaXMgbm90IHNldAojIENP
TkZJR19QSU5DVFJMX1NVTjUwSV9BMTAwX1IgaXMgbm90IHNldApDT05GSUdfUElOQ1RSTF9TVU41
MElfSDU9eQojIENPTkZJR19QSU5DVFJMX1NVTjUwSV9INiBpcyBub3Qgc2V0CkNPTkZJR19QSU5D
VFJMX1NVTjUwSV9INl9SPXkKIyBDT05GSUdfUElOQ1RSTF9TVU41MElfSDYxNiBpcyBub3Qgc2V0
CiMgQ09ORklHX1BJTkNUUkxfU1VONTBJX0g2MTZfUiBpcyBub3Qgc2V0CkNPTkZJR19QSU5DVFJM
X1RJX0lPREVMQVk9eQpDT05GSUdfUElOQ1RSTF9VTklQSElFUj15CkNPTkZJR19QSU5DVFJMX1VO
SVBISUVSX0xEND15CkNPTkZJR19QSU5DVFJMX1VOSVBISUVSX1BSTzQ9eQpDT05GSUdfUElOQ1RS
TF9VTklQSElFUl9TTEQ4PXkKQ09ORklHX1BJTkNUUkxfVU5JUEhJRVJfUFJPNT15CkNPTkZJR19Q
SU5DVFJMX1VOSVBISUVSX1BYUzI9eQpDT05GSUdfUElOQ1RSTF9VTklQSElFUl9MRDZCPXkKIyBD
T05GSUdfUElOQ1RSTF9VTklQSElFUl9MRDExIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9V
TklQSElFUl9MRDIwIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9VTklQSElFUl9QWFMzIGlz
IG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9VTklQSElFUl9OWDEgaXMgbm90IHNldAojIENPTkZJ
R19QSU5DVFJMX1RNUFY3NzAwIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9XTTg3NTAgaXMg
bm90IHNldApDT05GSUdfQVJDSF9IQVZFX0NVU1RPTV9HUElPX0g9eQpDT05GSUdfR1BJT0xJQj15
CkNPTkZJR19HUElPTElCX0ZBU1RQQVRIX0xJTUlUPTUxMgpDT05GSUdfT0ZfR1BJTz15CkNPTkZJ
R19HUElPTElCX0lSUUNISVA9eQpDT05GSUdfREVCVUdfR1BJTz15CkNPTkZJR19HUElPX0NERVY9
eQojIENPTkZJR19HUElPX0NERVZfVjEgaXMgbm90IHNldApDT05GSUdfR1BJT19HRU5FUklDPXkK
Q09ORklHX0dQSU9fTUFYNzMwWD15CgojCiMgTWVtb3J5IG1hcHBlZCBHUElPIGRyaXZlcnMKIwoj
IENPTkZJR19HUElPXzc0WFhfTU1JTyBpcyBub3Qgc2V0CkNPTkZJR19HUElPX0FMVEVSQT15CiMg
Q09ORklHX0dQSU9fQVNQRUVEIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19BU1BFRURfU0dQSU8g
aXMgbm90IHNldAojIENPTkZJR19HUElPX0FUSDc5IGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19S
QVNQQkVSUllQSV9FWFAgaXMgbm90IHNldAojIENPTkZJR19HUElPX0JDTV9LT05BIGlzIG5vdCBz
ZXQKIyBDT05GSUdfR1BJT19CQ01fWEdTX0lQUk9DIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19C
UkNNU1RCIGlzIG5vdCBzZXQKQ09ORklHX0dQSU9fQ0FERU5DRT15CiMgQ09ORklHX0dQSU9fQ0xQ
UzcxMVggaXMgbm90IHNldApDT05GSUdfR1BJT19EQVZJTkNJPXkKIyBDT05GSUdfR1BJT19EV0FQ
QiBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fRUlDX1NQUkQgaXMgbm90IHNldAojIENPTkZJR19H
UElPX0VNIGlzIG5vdCBzZXQKQ09ORklHX0dQSU9fRlRHUElPMDEwPXkKIyBDT05GSUdfR1BJT19H
RU5FUklDX1BMQVRGT1JNIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19HUkdQSU8gaXMgbm90IHNl
dAojIENPTkZJR19HUElPX0hJU0kgaXMgbm90IHNldAojIENPTkZJR19HUElPX0hMV0QgaXMgbm90
IHNldAojIENPTkZJR19HUElPX0lPUCBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fTE9HSUNWQyBp
cyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fTFBDMThYWCBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9f
TFBDMzJYWCBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fTUI4NlM3WCBpcyBub3Qgc2V0CkNPTkZJ
R19HUElPX01FTloxMjc9eQojIENPTkZJR19HUElPX01QQzhYWFggaXMgbm90IHNldAojIENPTkZJ
R19HUElPX01UNzYyMSBpcyBub3Qgc2V0CkNPTkZJR19HUElPX01WRUJVPXkKIyBDT05GSUdfR1BJ
T19NWEMgaXMgbm90IHNldAojIENPTkZJR19HUElPX01YUyBpcyBub3Qgc2V0CiMgQ09ORklHX0dQ
SU9fT01BUCBpcyBub3Qgc2V0CkNPTkZJR19HUElPX1BMMDYxPXkKIyBDT05GSUdfR1BJT19QTUlD
X0VJQ19TUFJEIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19QWEEgaXMgbm90IHNldAojIENPTkZJ
R19HUElPX1JDQVIgaXMgbm90IHNldAojIENPTkZJR19HUElPX1JEQSBpcyBub3Qgc2V0CiMgQ09O
RklHX0dQSU9fUk9DS0NISVAgaXMgbm90IHNldApDT05GSUdfR1BJT19TQU1BNUQyX1BJT0JVPXkK
Q09ORklHX0dQSU9fU0lGSVZFPXkKQ09ORklHX0dQSU9fU0lPWD15CiMgQ09ORklHX0dQSU9fU05Q
U19DUkVHIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19TUEVBUl9TUElDUyBpcyBub3Qgc2V0CiMg
Q09ORklHX0dQSU9fU1BSRCBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fU1RQX1hXQVkgaXMgbm90
IHNldApDT05GSUdfR1BJT19TWVNDT049eQojIENPTkZJR19HUElPX1RFR1JBIGlzIG5vdCBzZXQK
IyBDT05GSUdfR1BJT19URUdSQTE4NiBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fVFM0ODAwIGlz
IG5vdCBzZXQKIyBDT05GSUdfR1BJT19VTklQSElFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9f
VklTQ09OVEkgaXMgbm90IHNldAojIENPTkZJR19HUElPX1ZYODU1IGlzIG5vdCBzZXQKIyBDT05G
SUdfR1BJT19YR0VORV9TQiBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fWElMSU5YIGlzIG5vdCBz
ZXQKIyBDT05GSUdfR1BJT19YTFAgaXMgbm90IHNldAojIENPTkZJR19HUElPX1pFVklPIGlzIG5v
dCBzZXQKIyBDT05GSUdfR1BJT19BTURfRkNIIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19NU0Mz
MTMgaXMgbm90IHNldAojIENPTkZJR19HUElPX0lEVDMyNDNYIGlzIG5vdCBzZXQKIyBlbmQgb2Yg
TWVtb3J5IG1hcHBlZCBHUElPIGRyaXZlcnMKCiMKIyBJMkMgR1BJTyBleHBhbmRlcnMKIwpDT05G
SUdfR1BJT19BRFA1NTg4PXkKQ09ORklHX0dQSU9fQURQNTU4OF9JUlE9eQpDT05GSUdfR1BJT19B
RE5QPXkKQ09ORklHX0dQSU9fR1dfUExEPXkKQ09ORklHX0dQSU9fTUFYNzMwMD15CkNPTkZJR19H
UElPX01BWDczMlg9eQojIENPTkZJR19HUElPX01BWDczMlhfSVJRIGlzIG5vdCBzZXQKQ09ORklH
X0dQSU9fUENBOTUzWD15CkNPTkZJR19HUElPX1BDQTk1M1hfSVJRPXkKQ09ORklHX0dQSU9fUENB
OTU3MD15CkNPTkZJR19HUElPX1BDRjg1N1g9eQpDT05GSUdfR1BJT19UUElDMjgxMD15CiMgQ09O
RklHX0dQSU9fVFM0OTAwIGlzIG5vdCBzZXQKIyBlbmQgb2YgSTJDIEdQSU8gZXhwYW5kZXJzCgoj
CiMgTUZEIEdQSU8gZXhwYW5kZXJzCiMKIyBDT05GSUdfR1BJT19BUklaT05BIGlzIG5vdCBzZXQK
Q09ORklHX0dQSU9fQkQ3MTgxNT15CkNPTkZJR19HUElPX0JENzE4Mjg9eQpDT05GSUdfR1BJT19E
QTkwNTI9eQpDT05GSUdfSFRDX0VHUElPPXkKQ09ORklHX0dQSU9fS0VNUExEPXkKIyBDT05GSUdf
R1BJT19MUDg3M1ggaXMgbm90IHNldApDT05GSUdfR1BJT19MUDg3NTY1PXkKQ09ORklHX0dQSU9f
TUFYNzc2NTA9eQojIENPTkZJR19HUElPX1NMMjhDUExEIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJ
T19TVE1QRSBpcyBub3Qgc2V0CkNPTkZJR19HUElPX1RXTDYwNDA9eQpDT05GSUdfR1BJT19XTTgz
MVg9eQojIENPTkZJR19HUElPX1dNODM1MCBpcyBub3Qgc2V0CiMgZW5kIG9mIE1GRCBHUElPIGV4
cGFuZGVycwoKIwojIFBDSSBHUElPIGV4cGFuZGVycwojCiMgQ09ORklHX0dQSU9fQlQ4WFggaXMg
bm90IHNldAojIENPTkZJR19HUElPX01MX0lPSCBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fUENI
IGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19QQ0lfSURJT18xNiBpcyBub3Qgc2V0CiMgQ09ORklH
X0dQSU9fUENJRV9JRElPXzI0IGlzIG5vdCBzZXQKQ09ORklHX0dQSU9fUkRDMzIxWD15CiMgZW5k
IG9mIFBDSSBHUElPIGV4cGFuZGVycwoKIwojIFZpcnR1YWwgR1BJTyBkcml2ZXJzCiMKIyBDT05G
SUdfR1BJT19BR0dSRUdBVE9SIGlzIG5vdCBzZXQKQ09ORklHX0dQSU9fTU9DS1VQPXkKIyBDT05G
SUdfR1BJT19WSVJUSU8gaXMgbm90IHNldAojIENPTkZJR19HUElPX1NJTSBpcyBub3Qgc2V0CiMg
ZW5kIG9mIFZpcnR1YWwgR1BJTyBkcml2ZXJzCgpDT05GSUdfVzE9eQoKIwojIDEtd2lyZSBCdXMg
TWFzdGVycwojCkNPTkZJR19XMV9NQVNURVJfTUFUUk9YPXkKIyBDT05GSUdfVzFfTUFTVEVSX0RT
MjQ4MiBpcyBub3Qgc2V0CiMgQ09ORklHX1cxX01BU1RFUl9NWEMgaXMgbm90IHNldAojIENPTkZJ
R19XMV9NQVNURVJfRFMxV00gaXMgbm90IHNldApDT05GSUdfVzFfTUFTVEVSX0dQSU89eQpDT05G
SUdfSERRX01BU1RFUl9PTUFQPXkKQ09ORklHX1cxX01BU1RFUl9TR0k9eQojIGVuZCBvZiAxLXdp
cmUgQnVzIE1hc3RlcnMKCiMKIyAxLXdpcmUgU2xhdmVzCiMKQ09ORklHX1cxX1NMQVZFX1RIRVJN
PXkKQ09ORklHX1cxX1NMQVZFX1NNRU09eQpDT05GSUdfVzFfU0xBVkVfRFMyNDA1PXkKQ09ORklH
X1cxX1NMQVZFX0RTMjQwOD15CiMgQ09ORklHX1cxX1NMQVZFX0RTMjQwOF9SRUFEQkFDSyBpcyBu
b3Qgc2V0CkNPTkZJR19XMV9TTEFWRV9EUzI0MTM9eQpDT05GSUdfVzFfU0xBVkVfRFMyNDA2PXkK
Q09ORklHX1cxX1NMQVZFX0RTMjQyMz15CkNPTkZJR19XMV9TTEFWRV9EUzI4MDU9eQpDT05GSUdf
VzFfU0xBVkVfRFMyNDMwPXkKQ09ORklHX1cxX1NMQVZFX0RTMjQzMT15CiMgQ09ORklHX1cxX1NM
QVZFX0RTMjQzMyBpcyBub3Qgc2V0CiMgQ09ORklHX1cxX1NMQVZFX0RTMjQzOCBpcyBub3Qgc2V0
CiMgQ09ORklHX1cxX1NMQVZFX0RTMjUwWCBpcyBub3Qgc2V0CkNPTkZJR19XMV9TTEFWRV9EUzI3
ODA9eQpDT05GSUdfVzFfU0xBVkVfRFMyNzgxPXkKQ09ORklHX1cxX1NMQVZFX0RTMjhFMDQ9eQpD
T05GSUdfVzFfU0xBVkVfRFMyOEUxNz15CiMgZW5kIG9mIDEtd2lyZSBTbGF2ZXMKCkNPTkZJR19Q
T1dFUl9SRVNFVD15CkNPTkZJR19QT1dFUl9SRVNFVF9BUzM3MjI9eQpDT05GSUdfUE9XRVJfUkVT
RVRfQVQ5MV9QT1dFUk9GRj15CkNPTkZJR19QT1dFUl9SRVNFVF9BVDkxX1JFU0VUPXkKIyBDT05G
SUdfUE9XRVJfUkVTRVRfQVQ5MV9TQU1BNUQyX1NIRFdDIGlzIG5vdCBzZXQKQ09ORklHX1BPV0VS
X1JFU0VUX0FUQzI2MFg9eQojIENPTkZJR19QT1dFUl9SRVNFVF9CUkNNS09OQSBpcyBub3Qgc2V0
CkNPTkZJR19QT1dFUl9SRVNFVF9CUkNNU1RCPXkKIyBDT05GSUdfUE9XRVJfUkVTRVRfR0VNSU5J
X1BPV0VST0ZGIGlzIG5vdCBzZXQKQ09ORklHX1BPV0VSX1JFU0VUX0dQSU89eQpDT05GSUdfUE9X
RVJfUkVTRVRfR1BJT19SRVNUQVJUPXkKQ09ORklHX1BPV0VSX1JFU0VUX0hJU0k9eQojIENPTkZJ
R19QT1dFUl9SRVNFVF9NU00gaXMgbm90IHNldApDT05GSUdfUE9XRVJfUkVTRVRfUUNPTV9QT049
eQojIENPTkZJR19QT1dFUl9SRVNFVF9PQ0VMT1RfUkVTRVQgaXMgbm90IHNldAojIENPTkZJR19Q
T1dFUl9SRVNFVF9QSUlYNF9QT1dFUk9GRiBpcyBub3Qgc2V0CiMgQ09ORklHX1BPV0VSX1JFU0VU
X0xUQzI5NTIgaXMgbm90IHNldApDT05GSUdfUE9XRVJfUkVTRVRfUU5BUD15CkNPTkZJR19QT1dF
Ul9SRVNFVF9SRUdVTEFUT1I9eQojIENPTkZJR19QT1dFUl9SRVNFVF9SRVNUQVJUIGlzIG5vdCBz
ZXQKQ09ORklHX1BPV0VSX1JFU0VUX1ZFUlNBVElMRT15CkNPTkZJR19QT1dFUl9SRVNFVF9LRVlT
VE9ORT15CkNPTkZJR19QT1dFUl9SRVNFVF9TWVNDT049eQpDT05GSUdfUE9XRVJfUkVTRVRfU1lT
Q09OX1BPV0VST0ZGPXkKQ09ORklHX1BPV0VSX1JFU0VUX1JNT0JJTEU9eQpDT05GSUdfUkVCT09U
X01PREU9eQpDT05GSUdfU1lTQ09OX1JFQk9PVF9NT0RFPXkKIyBDT05GSUdfUE9XRVJfUkVTRVRf
U0MyN1hYIGlzIG5vdCBzZXQKIyBDT05GSUdfTlZNRU1fUkVCT09UX01PREUgaXMgbm90IHNldApD
T05GSUdfUE9XRVJfU1VQUExZPXkKIyBDT05GSUdfUE9XRVJfU1VQUExZX0RFQlVHIGlzIG5vdCBz
ZXQKQ09ORklHX1BPV0VSX1NVUFBMWV9IV01PTj15CkNPTkZJR19QREFfUE9XRVI9eQpDT05GSUdf
SVA1WFhYX1BPV0VSPXkKQ09ORklHX1dNODMxWF9CQUNLVVA9eQojIENPTkZJR19XTTgzMVhfUE9X
RVIgaXMgbm90IHNldApDT05GSUdfV004MzUwX1BPV0VSPXkKQ09ORklHX1RFU1RfUE9XRVI9eQpD
T05GSUdfQkFUVEVSWV84OFBNODYwWD15CiMgQ09ORklHX0NIQVJHRVJfQURQNTA2MSBpcyBub3Qg
c2V0CiMgQ09ORklHX0JBVFRFUllfQUNUODk0NUEgaXMgbm90IHNldApDT05GSUdfQkFUVEVSWV9D
VzIwMTU9eQpDT05GSUdfQkFUVEVSWV9EUzI3NjA9eQpDT05GSUdfQkFUVEVSWV9EUzI3ODA9eQpD
T05GSUdfQkFUVEVSWV9EUzI3ODE9eQojIENPTkZJR19CQVRURVJZX0RTMjc4MiBpcyBub3Qgc2V0
CkNPTkZJR19CQVRURVJZX1NBTVNVTkdfU0RJPXkKIyBDT05GSUdfQkFUVEVSWV9TQlMgaXMgbm90
IHNldAojIENPTkZJR19DSEFSR0VSX1NCUyBpcyBub3Qgc2V0CiMgQ09ORklHX01BTkFHRVJfU0JT
IGlzIG5vdCBzZXQKQ09ORklHX0JBVFRFUllfQlEyN1hYWD15CkNPTkZJR19CQVRURVJZX0JRMjdY
WFhfSTJDPXkKIyBDT05GSUdfQkFUVEVSWV9CUTI3WFhYX0hEUSBpcyBub3Qgc2V0CkNPTkZJR19C
QVRURVJZX0JRMjdYWFhfRFRfVVBEQVRFU19OVk09eQpDT05GSUdfQkFUVEVSWV9EQTkwMzA9eQpD
T05GSUdfQkFUVEVSWV9EQTkwNTI9eQpDT05GSUdfQkFUVEVSWV9EQTkxNTA9eQojIENPTkZJR19C
QVRURVJZX01BWDE3MDQwIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVSWV9NQVgxNzA0MiBpcyBu
b3Qgc2V0CkNPTkZJR19CQVRURVJZX01BWDE3MjFYPXkKQ09ORklHX0NIQVJHRVJfODhQTTg2MFg9
eQojIENPTkZJR19DSEFSR0VSX01BWDg5MDMgaXMgbm90IHNldApDT05GSUdfQ0hBUkdFUl9MUDg3
Mjc9eQojIENPTkZJR19DSEFSR0VSX0dQSU8gaXMgbm90IHNldApDT05GSUdfQ0hBUkdFUl9NQU5B
R0VSPXkKQ09ORklHX0NIQVJHRVJfTFQzNjUxPXkKQ09ORklHX0NIQVJHRVJfTFRDNDE2Mkw9eQpD
T05GSUdfQ0hBUkdFUl9ERVRFQ1RPUl9NQVgxNDY1Nj15CkNPTkZJR19DSEFSR0VSX01BWDc3NjUw
PXkKIyBDT05GSUdfQ0hBUkdFUl9NQVg3NzY5MyBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJf
TUFYNzc5NzYgaXMgbm90IHNldApDT05GSUdfQ0hBUkdFUl9NQVg4OTk4PXkKQ09ORklHX0NIQVJH
RVJfTVQ2MzYwPXkKIyBDT05GSUdfQ0hBUkdFUl9RQ09NX1NNQkIgaXMgbm90IHNldApDT05GSUdf
Q0hBUkdFUl9CUTI0MTVYPXkKQ09ORklHX0NIQVJHRVJfQlEyNDE5MD15CiMgQ09ORklHX0NIQVJH
RVJfQlEyNDI1NyBpcyBub3Qgc2V0CkNPTkZJR19DSEFSR0VSX0JRMjQ3MzU9eQpDT05GSUdfQ0hB
UkdFUl9CUTI1MTVYPXkKQ09ORklHX0NIQVJHRVJfQlEyNTg5MD15CiMgQ09ORklHX0NIQVJHRVJf
QlEyNTk4MCBpcyBub3Qgc2V0CkNPTkZJR19DSEFSR0VSX0JRMjU2WFg9eQpDT05GSUdfQ0hBUkdF
Ul9TTUIzNDc9eQpDT05GSUdfQ0hBUkdFUl9UUFM2NTA5MD15CiMgQ09ORklHX0JBVFRFUllfR0FV
R0VfTFRDMjk0MSBpcyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfR09MREZJU0ggaXMgbm90IHNl
dApDT05GSUdfQkFUVEVSWV9SVDUwMzM9eQpDT05GSUdfQ0hBUkdFUl9SVDk0NTU9eQpDT05GSUdf
Q0hBUkdFUl9DUk9TX1VTQlBEPXkKQ09ORklHX0NIQVJHRVJfQ1JPU19QQ0hHPXkKIyBDT05GSUdf
Q0hBUkdFUl9TQzI3MzEgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX1VDUzEwMDIgaXMgbm90
IHNldApDT05GSUdfQ0hBUkdFUl9CRDk5OTU0PXkKQ09ORklHX0JBVFRFUllfVUczMTA1PXkKQ09O
RklHX0hXTU9OPXkKQ09ORklHX0hXTU9OX1ZJRD15CkNPTkZJR19IV01PTl9ERUJVR19DSElQPXkK
CiMKIyBOYXRpdmUgZHJpdmVycwojCkNPTkZJR19TRU5TT1JTX0FENzQxND15CiMgQ09ORklHX1NF
TlNPUlNfQUQ3NDE4IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BRE0xMDIxIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VOU09SU19BRE0xMDI1IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19B
RE0xMDI2IGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfQURNMTAyOT15CkNPTkZJR19TRU5TT1JT
X0FETTEwMzE9eQpDT05GSUdfU0VOU09SU19BRE0xMTc3PXkKQ09ORklHX1NFTlNPUlNfQURNOTI0
MD15CkNPTkZJR19TRU5TT1JTX0FEVDdYMTA9eQpDT05GSUdfU0VOU09SU19BRFQ3NDEwPXkKQ09O
RklHX1NFTlNPUlNfQURUNzQxMT15CkNPTkZJR19TRU5TT1JTX0FEVDc0NjI9eQpDT05GSUdfU0VO
U09SU19BRFQ3NDcwPXkKQ09ORklHX1NFTlNPUlNfQURUNzQ3NT15CiMgQ09ORklHX1NFTlNPUlNf
QUhUMTAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FTMzcwIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0VOU09SU19BU0M3NjIxIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfQVhJX0ZBTl9DT05U
Uk9MPXkKQ09ORklHX1NFTlNPUlNfQVJNX1NDTUk9eQojIENPTkZJR19TRU5TT1JTX0FSTV9TQ1BJ
IGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfQVNQRUVEPXkKQ09ORklHX1NFTlNPUlNfQVRYUDE9
eQojIENPTkZJR19TRU5TT1JTX0JUMV9QVlQgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0NP
UlNBSVJfQ1BSTyBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0NPUlNBSVJfUFNVPXkKQ09ORklH
X1NFTlNPUlNfRFM2MjA9eQojIENPTkZJR19TRU5TT1JTX0RTMTYyMSBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFTlNPUlNfREE5MDUyX0FEQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfSTVLX0FN
QiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU1BBUlg1IGlzIG5vdCBzZXQKQ09ORklHX1NF
TlNPUlNfRjcxODA1Rj15CiMgQ09ORklHX1NFTlNPUlNfRjcxODgyRkcgaXMgbm90IHNldApDT05G
SUdfU0VOU09SU19GNzUzNzVTPXkKQ09ORklHX1NFTlNPUlNfR1NDPXkKIyBDT05GSUdfU0VOU09S
U19GVFNURVVUQVRFUyBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0dMNTE4U009eQpDT05GSUdf
U0VOU09SU19HTDUyMFNNPXkKIyBDT05GSUdfU0VOU09SU19HNzYwQSBpcyBub3Qgc2V0CkNPTkZJ
R19TRU5TT1JTX0c3NjI9eQpDT05GSUdfU0VOU09SU19HUElPX0ZBTj15CkNPTkZJR19TRU5TT1JT
X0hJSDYxMzA9eQpDT05GSUdfU0VOU09SU19JQk1BRU09eQpDT05GSUdfU0VOU09SU19JQk1QRVg9
eQpDT05GSUdfU0VOU09SU19JVDg3PXkKQ09ORklHX1NFTlNPUlNfSkM0Mj15CiMgQ09ORklHX1NF
TlNPUlNfUE9XUjEyMjAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xJTkVBR0UgaXMgbm90
IHNldApDT05GSUdfU0VOU09SU19MVEMyOTQ1PXkKQ09ORklHX1NFTlNPUlNfTFRDMjk0Nz15CkNP
TkZJR19TRU5TT1JTX0xUQzI5NDdfSTJDPXkKIyBDT05GSUdfU0VOU09SU19MVEMyOTkwIGlzIG5v
dCBzZXQKQ09ORklHX1NFTlNPUlNfTFRDMjk5Mj15CkNPTkZJR19TRU5TT1JTX0xUQzQxNTE9eQpD
T05GSUdfU0VOU09SU19MVEM0MjE1PXkKQ09ORklHX1NFTlNPUlNfTFRDNDIyMj15CiMgQ09ORklH
X1NFTlNPUlNfTFRDNDI0NSBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0xUQzQyNjA9eQpDT05G
SUdfU0VOU09SU19MVEM0MjYxPXkKIyBDT05GSUdfU0VOU09SU19NQVgxMjcgaXMgbm90IHNldApD
T05GSUdfU0VOU09SU19NQVgxNjA2NT15CkNPTkZJR19TRU5TT1JTX01BWDE2MTk9eQpDT05GSUdf
U0VOU09SU19NQVgxNjY4PXkKQ09ORklHX1NFTlNPUlNfTUFYMTk3PXkKQ09ORklHX1NFTlNPUlNf
TUFYMzE3MzA9eQpDT05GSUdfU0VOU09SU19NQVg2NjIwPXkKQ09ORklHX1NFTlNPUlNfTUFYNjYy
MT15CkNPTkZJR19TRU5TT1JTX01BWDY2Mzk9eQojIENPTkZJR19TRU5TT1JTX01BWDY2NDIgaXMg
bm90IHNldApDT05GSUdfU0VOU09SU19NQVg2NjUwPXkKQ09ORklHX1NFTlNPUlNfTUFYNjY5Nz15
CiMgQ09ORklHX1NFTlNPUlNfTUFYMzE3OTAgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19NQ1Az
MDIxPXkKQ09ORklHX1NFTlNPUlNfTUxYUkVHX0ZBTj15CkNPTkZJR19TRU5TT1JTX1RDNjU0PXkK
Q09ORklHX1NFTlNPUlNfVFBTMjM4NjE9eQpDT05GSUdfU0VOU09SU19NUjc1MjAzPXkKQ09ORklH
X1NFTlNPUlNfTE02Mz15CiMgQ09ORklHX1NFTlNPUlNfTE03MyBpcyBub3Qgc2V0CkNPTkZJR19T
RU5TT1JTX0xNNzU9eQojIENPTkZJR19TRU5TT1JTX0xNNzcgaXMgbm90IHNldAojIENPTkZJR19T
RU5TT1JTX0xNNzggaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xNODAgaXMgbm90IHNldApD
T05GSUdfU0VOU09SU19MTTgzPXkKQ09ORklHX1NFTlNPUlNfTE04NT15CiMgQ09ORklHX1NFTlNP
UlNfTE04NyBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0xNOTA9eQpDT05GSUdfU0VOU09SU19M
TTkyPXkKIyBDT05GSUdfU0VOU09SU19MTTkzIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19M
TTk1MjM0IGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfTE05NTI0MT15CkNPTkZJR19TRU5TT1JT
X0xNOTUyNDU9eQpDT05GSUdfU0VOU09SU19QQzg3MzYwPXkKIyBDT05GSUdfU0VOU09SU19QQzg3
NDI3IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19OQ1Q2NjgzIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0VOU09SU19OQ1Q2Nzc1IGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfTkNUNzgwMj15CiMg
Q09ORklHX1NFTlNPUlNfTkNUNzkwNCBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX05QQ003WFg9
eQojIENPTkZJR19TRU5TT1JTX05TQTMyMCBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX09DQ19Q
OF9JMkM9eQpDT05GSUdfU0VOU09SU19PQ0M9eQojIENPTkZJR19TRU5TT1JTX1BDRjg1OTEgaXMg
bm90IHNldApDT05GSUdfU0VOU09SU19QRUNJX0NQVVRFTVA9eQpDT05GSUdfU0VOU09SU19QRUNJ
X0RJTU1URU1QPXkKQ09ORklHX1NFTlNPUlNfUEVDST15CiMgQ09ORklHX1BNQlVTIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VOU09SU19QV01fRkFOIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19S
QVNQQkVSUllQSV9IV01PTiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU0wyOENQTEQgaXMg
bm90IHNldAojIENPTkZJR19TRU5TT1JTX1NCVFNJIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09S
U19TQlJNSSBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX1NIVDE1PXkKQ09ORklHX1NFTlNPUlNf
U0hUMjE9eQpDT05GSUdfU0VOU09SU19TSFQzeD15CiMgQ09ORklHX1NFTlNPUlNfU0hUNHggaXMg
bm90IHNldApDT05GSUdfU0VOU09SU19TSFRDMT15CkNPTkZJR19TRU5TT1JTX1NJUzU1OTU9eQoj
IENPTkZJR19TRU5TT1JTX1NZNzYzNkEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0RNRTE3
MzcgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19FTUMxNDAzPXkKIyBDT05GSUdfU0VOU09SU19F
TUMyMTAzIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfRU1DNlcyMDE9eQojIENPTkZJR19TRU5T
T1JTX1NNU0M0N00xIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfU01TQzQ3TTE5Mj15CkNPTkZJ
R19TRU5TT1JTX1NNU0M0N0IzOTc9eQpDT05GSUdfU0VOU09SU19TQ0g1NlhYX0NPTU1PTj15CkNP
TkZJR19TRU5TT1JTX1NDSDU2Mjc9eQojIENPTkZJR19TRU5TT1JTX1NDSDU2MzYgaXMgbm90IHNl
dApDT05GSUdfU0VOU09SU19TVFRTNzUxPXkKQ09ORklHX1NFTlNPUlNfU01NNjY1PXkKQ09ORklH
X1NFTlNPUlNfQURDMTI4RDgxOD15CkNPTkZJR19TRU5TT1JTX0FEUzc4Mjg9eQpDT05GSUdfU0VO
U09SU19BTUM2ODIxPXkKQ09ORklHX1NFTlNPUlNfSU5BMjA5PXkKIyBDT05GSUdfU0VOU09SU19J
TkEyWFggaXMgbm90IHNldApDT05GSUdfU0VOU09SU19JTkEyMzg9eQojIENPTkZJR19TRU5TT1JT
X0lOQTMyMjEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1RDNzQgaXMgbm90IHNldApDT05G
SUdfU0VOU09SU19USE1DNTA9eQpDT05GSUdfU0VOU09SU19UTVAxMDI9eQojIENPTkZJR19TRU5T
T1JTX1RNUDEwMyBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX1RNUDEwOD15CkNPTkZJR19TRU5T
T1JTX1RNUDQwMT15CkNPTkZJR19TRU5TT1JTX1RNUDQyMT15CiMgQ09ORklHX1NFTlNPUlNfVE1Q
NDY0IGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfVE1QNTEzPXkKIyBDT05GSUdfU0VOU09SU19W
SUE2ODZBIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19WVDEyMTEgaXMgbm90IHNldApDT05G
SUdfU0VOU09SU19WVDgyMzE9eQpDT05GSUdfU0VOU09SU19XODM3NzNHPXkKQ09ORklHX1NFTlNP
UlNfVzgzNzgxRD15CkNPTkZJR19TRU5TT1JTX1c4Mzc5MUQ9eQojIENPTkZJR19TRU5TT1JTX1c4
Mzc5MkQgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19XODM3OTM9eQpDT05GSUdfU0VOU09SU19X
ODM3OTU9eQojIENPTkZJR19TRU5TT1JTX1c4Mzc5NV9GQU5DVFJMIGlzIG5vdCBzZXQKQ09ORklH
X1NFTlNPUlNfVzgzTDc4NVRTPXkKQ09ORklHX1NFTlNPUlNfVzgzTDc4Nk5HPXkKQ09ORklHX1NF
TlNPUlNfVzgzNjI3SEY9eQpDT05GSUdfU0VOU09SU19XODM2MjdFSEY9eQpDT05GSUdfU0VOU09S
U19XTTgzMVg9eQojIENPTkZJR19TRU5TT1JTX1dNODM1MCBpcyBub3Qgc2V0CkNPTkZJR19USEVS
TUFMPXkKQ09ORklHX1RIRVJNQUxfU1RBVElTVElDUz15CkNPTkZJR19USEVSTUFMX0VNRVJHRU5D
WV9QT1dFUk9GRl9ERUxBWV9NUz0wCiMgQ09ORklHX1RIRVJNQUxfSFdNT04gaXMgbm90IHNldApD
T05GSUdfVEhFUk1BTF9PRj15CkNPTkZJR19USEVSTUFMX1dSSVRBQkxFX1RSSVBTPXkKQ09ORklH
X1RIRVJNQUxfREVGQVVMVF9HT1ZfU1RFUF9XSVNFPXkKIyBDT05GSUdfVEhFUk1BTF9ERUZBVUxU
X0dPVl9GQUlSX1NIQVJFIGlzIG5vdCBzZXQKIyBDT05GSUdfVEhFUk1BTF9ERUZBVUxUX0dPVl9V
U0VSX1NQQUNFIGlzIG5vdCBzZXQKQ09ORklHX1RIRVJNQUxfR09WX0ZBSVJfU0hBUkU9eQpDT05G
SUdfVEhFUk1BTF9HT1ZfU1RFUF9XSVNFPXkKQ09ORklHX1RIRVJNQUxfR09WX0JBTkdfQkFORz15
CkNPTkZJR19USEVSTUFMX0dPVl9VU0VSX1NQQUNFPXkKIyBDT05GSUdfVEhFUk1BTF9HT1ZfUE9X
RVJfQUxMT0NBVE9SIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BVX1RIRVJNQUwgaXMgbm90IHNldApD
T05GSUdfREVWRlJFUV9USEVSTUFMPXkKIyBDT05GSUdfVEhFUk1BTF9FTVVMQVRJT04gaXMgbm90
IHNldApDT05GSUdfVEhFUk1BTF9NTUlPPXkKQ09ORklHX0hJU0lfVEhFUk1BTD15CiMgQ09ORklH
X0lNWF9USEVSTUFMIGlzIG5vdCBzZXQKIyBDT05GSUdfSU1YOE1NX1RIRVJNQUwgaXMgbm90IHNl
dAojIENPTkZJR19LM19USEVSTUFMIGlzIG5vdCBzZXQKIyBDT05GSUdfUU9SSVFfVEhFUk1BTCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NQRUFSX1RIRVJNQUwgaXMgbm90IHNldAojIENPTkZJR19TVU44
SV9USEVSTUFMIGlzIG5vdCBzZXQKIyBDT05GSUdfUk9DS0NISVBfVEhFUk1BTCBpcyBub3Qgc2V0
CiMgQ09ORklHX1JDQVJfVEhFUk1BTCBpcyBub3Qgc2V0CkNPTkZJR19SQ0FSX0dFTjNfVEhFUk1B
TD15CiMgQ09ORklHX1JaRzJMX1RIRVJNQUwgaXMgbm90IHNldAojIENPTkZJR19LSVJLV09PRF9U
SEVSTUFMIGlzIG5vdCBzZXQKQ09ORklHX0RPVkVfVEhFUk1BTD15CiMgQ09ORklHX0FSTUFEQV9U
SEVSTUFMIGlzIG5vdCBzZXQKIyBDT05GSUdfREE5MDYyX1RIRVJNQUwgaXMgbm90IHNldApDT05G
SUdfTVRLX1RIRVJNQUw9eQpDT05GSUdfQU1MT0dJQ19USEVSTUFMPXkKCiMKIyBJbnRlbCB0aGVy
bWFsIGRyaXZlcnMKIwoKIwojIEFDUEkgSU5UMzQwWCB0aGVybWFsIGRyaXZlcnMKIwojIGVuZCBv
ZiBBQ1BJIElOVDM0MFggdGhlcm1hbCBkcml2ZXJzCiMgZW5kIG9mIEludGVsIHRoZXJtYWwgZHJp
dmVycwoKIwojIEJyb2FkY29tIHRoZXJtYWwgZHJpdmVycwojCiMgQ09ORklHX0JDTTI3MTFfVEhF
Uk1BTCBpcyBub3Qgc2V0CiMgQ09ORklHX0JDTTI4MzVfVEhFUk1BTCBpcyBub3Qgc2V0CiMgQ09O
RklHX0JSQ01TVEJfVEhFUk1BTCBpcyBub3Qgc2V0CiMgQ09ORklHX0JDTV9OU19USEVSTUFMIGlz
IG5vdCBzZXQKIyBDT05GSUdfQkNNX1NSX1RIRVJNQUwgaXMgbm90IHNldAojIGVuZCBvZiBCcm9h
ZGNvbSB0aGVybWFsIGRyaXZlcnMKCiMKIyBUZXhhcyBJbnN0cnVtZW50cyB0aGVybWFsIGRyaXZl
cnMKIwpDT05GSUdfVElfU09DX1RIRVJNQUw9eQpDT05GSUdfVElfVEhFUk1BTD15CiMgQ09ORklH
X09NQVAzX1RIRVJNQUwgaXMgbm90IHNldAojIENPTkZJR19PTUFQNF9USEVSTUFMIGlzIG5vdCBz
ZXQKIyBDT05GSUdfT01BUDVfVEhFUk1BTCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSQTc1Ml9USEVS
TUFMIGlzIG5vdCBzZXQKIyBlbmQgb2YgVGV4YXMgSW5zdHJ1bWVudHMgdGhlcm1hbCBkcml2ZXJz
CgojCiMgU2Ftc3VuZyB0aGVybWFsIGRyaXZlcnMKIwpDT05GSUdfRVhZTk9TX1RIRVJNQUw9eQoj
IGVuZCBvZiBTYW1zdW5nIHRoZXJtYWwgZHJpdmVycwoKIwojIFNUTWljcm9lbGVjdHJvbmljcyB0
aGVybWFsIGRyaXZlcnMKIwpDT05GSUdfU1RfVEhFUk1BTD15CiMgQ09ORklHX1NUX1RIRVJNQUxf
U1lTQ0ZHIGlzIG5vdCBzZXQKQ09ORklHX1NUX1RIRVJNQUxfTUVNTUFQPXkKIyBDT05GSUdfU1RN
MzJfVEhFUk1BTCBpcyBub3Qgc2V0CiMgZW5kIG9mIFNUTWljcm9lbGVjdHJvbmljcyB0aGVybWFs
IGRyaXZlcnMKCiMKIyBOVklESUEgVGVncmEgdGhlcm1hbCBkcml2ZXJzCiMKIyBDT05GSUdfVEVH
UkFfU09DVEhFUk0gaXMgbm90IHNldAojIENPTkZJR19URUdSQV9CUE1QX1RIRVJNQUwgaXMgbm90
IHNldAojIENPTkZJR19URUdSQTMwX1RTRU5TT1IgaXMgbm90IHNldAojIGVuZCBvZiBOVklESUEg
VGVncmEgdGhlcm1hbCBkcml2ZXJzCgojCiMgUXVhbGNvbW0gdGhlcm1hbCBkcml2ZXJzCiMKQ09O
RklHX1FDT01fVFNFTlM9eQpDT05GSUdfUUNPTV9MTUg9eQojIGVuZCBvZiBRdWFsY29tbSB0aGVy
bWFsIGRyaXZlcnMKCiMgQ09ORklHX1VOSVBISUVSX1RIRVJNQUwgaXMgbm90IHNldAojIENPTkZJ
R19TUFJEX1RIRVJNQUwgaXMgbm90IHNldApDT05GSUdfV0FUQ0hET0c9eQpDT05GSUdfV0FUQ0hE
T0dfQ09SRT15CiMgQ09ORklHX1dBVENIRE9HX05PV0FZT1VUIGlzIG5vdCBzZXQKIyBDT05GSUdf
V0FUQ0hET0dfSEFORExFX0JPT1RfRU5BQkxFRCBpcyBub3Qgc2V0CkNPTkZJR19XQVRDSERPR19P
UEVOX1RJTUVPVVQ9MApDT05GSUdfV0FUQ0hET0dfU1lTRlM9eQpDT05GSUdfV0FUQ0hET0dfSFJU
SU1FUl9QUkVUSU1FT1VUPXkKCiMKIyBXYXRjaGRvZyBQcmV0aW1lb3V0IEdvdmVybm9ycwojCiMg
Q09ORklHX1dBVENIRE9HX1BSRVRJTUVPVVRfR09WIGlzIG5vdCBzZXQKCiMKIyBXYXRjaGRvZyBE
ZXZpY2UgRHJpdmVycwojCkNPTkZJR19TT0ZUX1dBVENIRE9HPXkKQ09ORklHX0JEOTU3WE1VRl9X
QVRDSERPRz15CiMgQ09ORklHX0RBOTA1Ml9XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklHX0RB
OTA1NV9XQVRDSERPRyBpcyBub3Qgc2V0CkNPTkZJR19EQTkwNjNfV0FUQ0hET0c9eQojIENPTkZJ
R19EQTkwNjJfV0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19HUElPX1dBVENIRE9HIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUVORjIxQk1DX1dBVENIRE9HIGlzIG5vdCBzZXQKQ09ORklHX01FTlow
NjlfV0FUQ0hET0c9eQpDT05GSUdfV004MzFYX1dBVENIRE9HPXkKQ09ORklHX1dNODM1MF9XQVRD
SERPRz15CiMgQ09ORklHX1hJTElOWF9XQVRDSERPRyBpcyBub3Qgc2V0CkNPTkZJR19aSUlSQVZF
X1dBVENIRE9HPXkKIyBDT05GSUdfTUxYX1dEVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NMMjhDUExE
X1dBVENIRE9HIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJNX1NQODA1X1dBVENIRE9HIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQVJNQURBXzM3WFhfV0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19BU005
MjYwX1dBVENIRE9HIGlzIG5vdCBzZXQKIyBDT05GSUdfQVQ5MVJNOTIwMF9XQVRDSERPRyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0FUOTFTQU05WF9XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklHX1NB
TUE1RDRfV0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19DQURFTkNFX1dBVENIRE9HIGlzIG5v
dCBzZXQKIyBDT05GSUdfOTc3X1dBVENIRE9HIGlzIG5vdCBzZXQKIyBDT05GSUdfRlRXRFQwMTBf
V0FUQ0hET0cgaXMgbm90IHNldApDT05GSUdfUzNDMjQxMF9XQVRDSERPRz15CiMgQ09ORklHX0RX
X1dBVENIRE9HIGlzIG5vdCBzZXQKIyBDT05GSUdfRVA5M1hYX1dBVENIRE9HIGlzIG5vdCBzZXQK
Q09ORklHX09NQVBfV0FUQ0hET0c9eQojIENPTkZJR19QTlg0MDA4X1dBVENIRE9HIGlzIG5vdCBz
ZXQKQ09ORklHX0RBVklOQ0lfV0FUQ0hET0c9eQojIENPTkZJR19LM19SVElfV0FUQ0hET0cgaXMg
bm90IHNldAojIENPTkZJR19PUklPTl9XQVRDSERPRyBpcyBub3Qgc2V0CkNPTkZJR19STjVUNjE4
X1dBVENIRE9HPXkKQ09ORklHX1NVTlhJX1dBVENIRE9HPXkKQ09ORklHX05QQ003WFhfV0FUQ0hE
T0c9eQojIENPTkZJR19TVE1QM1hYWF9SVENfV0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19U
UzQ4MDBfV0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19UUzcyWFhfV0FUQ0hET0cgaXMgbm90
IHNldApDT05GSUdfTUFYNjNYWF9XQVRDSERPRz15CkNPTkZJR19NQVg3NzYyMF9XQVRDSERPRz15
CiMgQ09ORklHX0lNWDJfV0RUIGlzIG5vdCBzZXQKIyBDT05GSUdfSU1YN1VMUF9XRFQgaXMgbm90
IHNldAojIENPTkZJR19SRVRVX1dBVENIRE9HIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9YQVJUX1dE
VCBpcyBub3Qgc2V0CiMgQ09ORklHX1NUX0xQQ19XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklH
X1RFR1JBX1dBVENIRE9HIGlzIG5vdCBzZXQKQ09ORklHX1FDT01fV0RUPXkKIyBDT05GSUdfTUVT
T05fR1hCQl9XQVRDSERPRyBpcyBub3Qgc2V0CkNPTkZJR19NRVNPTl9XQVRDSERPRz15CiMgQ09O
RklHX01FRElBVEVLX1dBVENIRE9HIGlzIG5vdCBzZXQKQ09ORklHX0RJR0lDT0xPUl9XQVRDSERP
Rz15CiMgQ09ORklHX0FSTV9TTUNfV0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19MUEMxOFhY
X1dBVENIRE9HIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVORVNBU19XRFQgaXMgbm90IHNldApDT05G
SUdfUkVORVNBU19SWkFXRFQ9eQpDT05GSUdfUkVORVNBU19SWkcyTFdEVD15CiMgQ09ORklHX0FT
UEVFRF9XQVRDSERPRyBpcyBub3Qgc2V0CkNPTkZJR19TVE0zMl9XQVRDSERPRz15CiMgQ09ORklH
X1VOSVBISUVSX1dBVENIRE9HIGlzIG5vdCBzZXQKIyBDT05GSUdfUlREMTE5WF9XQVRDSERPRyBp
cyBub3Qgc2V0CiMgQ09ORklHX1JFQUxURUtfT1RUT19XRFQgaXMgbm90IHNldAojIENPTkZJR19T
UFJEX1dBVENIRE9HIGlzIG5vdCBzZXQKIyBDT05GSUdfUE04OTE2X1dBVENIRE9HIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVklTQ09OVElfV0FUQ0hET0cgaXMgbm90IHNldApDT05GSUdfTVNDMzEzRV9X
QVRDSERPRz15CiMgQ09ORklHX0FQUExFX1dBVENIRE9HIGlzIG5vdCBzZXQKQ09ORklHX0FMSU03
MTAxX1dEVD15CiMgQ09ORklHX1NDNTIwX1dEVCBpcyBub3Qgc2V0CkNPTkZJR19JNjMwMEVTQl9X
RFQ9eQpDT05GSUdfS0VNUExEX1dEVD15CiMgQ09ORklHX1JEQzMyMVhfV0RUIGlzIG5vdCBzZXQK
IyBDT05GSUdfQVRINzlfV0RUIGlzIG5vdCBzZXQKIyBDT05GSUdfQkNNNDdYWF9XRFQgaXMgbm90
IHNldAojIENPTkZJR19CQ00yODM1X1dEVCBpcyBub3Qgc2V0CiMgQ09ORklHX0JDTV9LT05BX1dE
VCBpcyBub3Qgc2V0CiMgQ09ORklHX0JDTTcwMzhfV0RUIGlzIG5vdCBzZXQKIyBDT05GSUdfSU1H
UERDX1dEVCBpcyBub3Qgc2V0CiMgQ09ORklHX01QQzUyMDBfV0RUIGlzIG5vdCBzZXQKIyBDT05G
SUdfTUVOX0EyMV9XRFQgaXMgbm90IHNldAojIENPTkZJR19VTUxfV0FUQ0hET0cgaXMgbm90IHNl
dAoKIwojIFBDSS1iYXNlZCBXYXRjaGRvZyBDYXJkcwojCiMgQ09ORklHX1BDSVBDV0FUQ0hET0cg
aXMgbm90IHNldApDT05GSUdfV0RUUENJPXkKQ09ORklHX1NTQl9QT1NTSUJMRT15CiMgQ09ORklH
X1NTQiBpcyBub3Qgc2V0CkNPTkZJR19CQ01BX1BPU1NJQkxFPXkKIyBDT05GSUdfQkNNQSBpcyBu
b3Qgc2V0CgojCiMgTXVsdGlmdW5jdGlvbiBkZXZpY2UgZHJpdmVycwojCkNPTkZJR19NRkRfQ09S
RT15CiMgQ09ORklHX01GRF9BTFRFUkFfU1lTTUdSIGlzIG5vdCBzZXQKQ09ORklHX01GRF9BQ1Q4
OTQ1QT15CiMgQ09ORklHX01GRF9TVU40SV9HUEFEQyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9B
UzM3MTEgaXMgbm90IHNldApDT05GSUdfTUZEX0FTMzcyMj15CiMgQ09ORklHX1BNSUNfQURQNTUy
MCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9BQVQyODcwX0NPUkUgaXMgbm90IHNldApDT05GSUdf
TUZEX0FUOTFfVVNBUlQ9eQojIENPTkZJR19NRkRfQVRNRUxfRkxFWENPTSBpcyBub3Qgc2V0CkNP
TkZJR19NRkRfQVRNRUxfSExDREM9eQpDT05GSUdfTUZEX0FUTUVMX1NNQz15CkNPTkZJR19NRkRf
QkNNNTkwWFg9eQojIENPTkZJR19NRkRfQkQ5NTcxTVdWIGlzIG5vdCBzZXQKQ09ORklHX01GRF9B
QzEwMD15CkNPTkZJR19NRkRfQVhQMjBYPXkKQ09ORklHX01GRF9BWFAyMFhfSTJDPXkKQ09ORklH
X01GRF9BWFAyMFhfUlNCPXkKQ09ORklHX01GRF9DUk9TX0VDX0RFVj15CiMgQ09ORklHX01GRF9N
QURFUkEgaXMgbm90IHNldApDT05GSUdfTUZEX0FTSUMzPXkKQ09ORklHX1BNSUNfREE5MDNYPXkK
Q09ORklHX1BNSUNfREE5MDUyPXkKQ09ORklHX01GRF9EQTkwNTJfSTJDPXkKIyBDT05GSUdfTUZE
X0RBOTA1NSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9EQTkwNjIgaXMgbm90IHNldApDT05GSUdf
TUZEX0RBOTA2Mz15CkNPTkZJR19NRkRfREE5MTUwPXkKIyBDT05GSUdfTUZEX0VORV9LQjM5MzAg
aXMgbm90IHNldAojIENPTkZJR19NRkRfRVhZTk9TX0xQQVNTIGlzIG5vdCBzZXQKQ09ORklHX01G
RF9HQVRFV09SS1NfR1NDPXkKIyBDT05GSUdfTUZEX01DMTNYWFhfSTJDIGlzIG5vdCBzZXQKQ09O
RklHX01GRF9NUDI2Mjk9eQojIENPTkZJR19NRkRfTVhTX0xSQURDIGlzIG5vdCBzZXQKIyBDT05G
SUdfTUZEX01YMjVfVFNBREMgaXMgbm90IHNldApDT05GSUdfTUZEX0hJNjQyMV9QTUlDPXkKQ09O
RklHX01GRF9ISTY0MjFfU1BNST15CkNPTkZJR19NRkRfSEk2NTVYX1BNSUM9eQpDT05GSUdfSFRD
X1BBU0lDMz15CiMgQ09ORklHX0hUQ19JMkNQTEQgaXMgbm90IHNldApDT05GSUdfTFBDX0lDSD15
CkNPTkZJR19MUENfU0NIPXkKQ09ORklHX01GRF9JUVM2Mlg9eQojIENPTkZJR19NRkRfSkFOWl9D
TU9ESU8gaXMgbm90IHNldApDT05GSUdfTUZEX0tFTVBMRD15CiMgQ09ORklHX01GRF84OFBNODAw
IGlzIG5vdCBzZXQKQ09ORklHX01GRF84OFBNODA1PXkKQ09ORklHX01GRF84OFBNODYwWD15CiMg
Q09ORklHX01GRF9NQVgxNDU3NyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NQVg3NzYyMCBpcyBu
b3Qgc2V0CkNPTkZJR19NRkRfTUFYNzc2NTA9eQpDT05GSUdfTUZEX01BWDc3Njg2PXkKQ09ORklH
X01GRF9NQVg3NzY5Mz15CkNPTkZJR19NRkRfTUFYNzc3MTQ9eQojIENPTkZJR19NRkRfTUFYNzc4
NDMgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYODkwNyBpcyBub3Qgc2V0CiMgQ09ORklHX01G
RF9NQVg4OTI1IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX01BWDg5OTcgaXMgbm90IHNldApDT05G
SUdfTUZEX01BWDg5OTg9eQpDT05GSUdfTUZEX01UNjM2MD15CiMgQ09ORklHX01GRF9NVDYzOTcg
aXMgbm90IHNldAojIENPTkZJR19NRkRfTUVORjIxQk1DIGlzIG5vdCBzZXQKQ09ORklHX01GRF9O
VFhFQz15CkNPTkZJR19NRkRfUkVUVT15CiMgQ09ORklHX01GRF9QQ0Y1MDYzMyBpcyBub3Qgc2V0
CiMgQ09ORklHX01GRF9QTThYWFggaXMgbm90IHNldApDT05GSUdfTUZEX1FDT01fUlBNPXkKQ09O
RklHX01GRF9TUE1JX1BNSUM9eQpDT05GSUdfTUZEX1JEQzMyMVg9eQpDT05GSUdfTUZEX1JUNDgz
MT15CiMgQ09ORklHX01GRF9SVDUwMzMgaXMgbm90IHNldAojIENPTkZJR19NRkRfUkM1VDU4MyBp
cyBub3Qgc2V0CkNPTkZJR19NRkRfUks4MDg9eQpDT05GSUdfTUZEX1JONVQ2MTg9eQpDT05GSUdf
TUZEX1NFQ19DT1JFPXkKQ09ORklHX01GRF9TSTQ3NlhfQ09SRT15CiMgQ09ORklHX01GRF9TSU1Q
TEVfTUZEX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9TTDI4Q1BMRCBpcyBub3Qgc2V0CiMg
Q09ORklHX01GRF9TTTUwMSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9TS1k4MTQ1MiBpcyBub3Qg
c2V0CiMgQ09ORklHX0FCWDUwMF9DT1JFIGlzIG5vdCBzZXQKQ09ORklHX01GRF9TVE1QRT15Cgoj
CiMgU1RNaWNyb2VsZWN0cm9uaWNzIFNUTVBFIEludGVyZmFjZSBEcml2ZXJzCiMKIyBDT05GSUdf
U1RNUEVfSTJDIGlzIG5vdCBzZXQKIyBlbmQgb2YgU1RNaWNyb2VsZWN0cm9uaWNzIFNUTVBFIElu
dGVyZmFjZSBEcml2ZXJzCgojIENPTkZJR19NRkRfU1VONklfUFJDTSBpcyBub3Qgc2V0CkNPTkZJ
R19NRkRfU1lTQ09OPXkKQ09ORklHX01GRF9USV9BTTMzNVhfVFNDQURDPXkKIyBDT05GSUdfTUZE
X0xQMzk0MyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9MUDg3ODggaXMgbm90IHNldApDT05GSUdf
TUZEX1RJX0xNVT15CiMgQ09ORklHX01GRF9QQUxNQVMgaXMgbm90IHNldApDT05GSUdfVFBTNjEw
NVg9eQpDT05GSUdfVFBTNjUwMTA9eQpDT05GSUdfVFBTNjUwN1g9eQojIENPTkZJR19NRkRfVFBT
NjUwODYgaXMgbm90IHNldApDT05GSUdfTUZEX1RQUzY1MDkwPXkKIyBDT05GSUdfTUZEX1RQUzY1
MjE3IGlzIG5vdCBzZXQKQ09ORklHX01GRF9USV9MUDg3M1g9eQpDT05GSUdfTUZEX1RJX0xQODc1
NjU9eQojIENPTkZJR19NRkRfVFBTNjUyMTggaXMgbm90IHNldAojIENPTkZJR19NRkRfVFBTNjU4
NlggaXMgbm90IHNldAojIENPTkZJR19NRkRfVFBTNjU5MTAgaXMgbm90IHNldAojIENPTkZJR19N
RkRfVFBTNjU5MTJfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfVFdMNDAzMF9DT1JFIGlzIG5vdCBz
ZXQKQ09ORklHX1RXTDYwNDBfQ09SRT15CkNPTkZJR19NRkRfV0wxMjczX0NPUkU9eQpDT05GSUdf
TUZEX0xNMzUzMz15CiMgQ09ORklHX01GRF9USU1CRVJEQUxFIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUZEX1RDMzU4OVggaXMgbm90IHNldApDT05GSUdfTUZEX1RNSU89eQojIENPTkZJR19NRkRfVDdM
NjZYQiBpcyBub3Qgc2V0CkNPTkZJR19NRkRfVEM2Mzg3WEI9eQojIENPTkZJR19NRkRfVEM2Mzkz
WEIgaXMgbm90IHNldApDT05GSUdfTUZEX1RRTVg4Nj15CkNPTkZJR19NRkRfVlg4NTU9eQojIENP
TkZJR19NRkRfTE9DSE5BR0FSIGlzIG5vdCBzZXQKQ09ORklHX01GRF9BUklaT05BPXkKQ09ORklH
X01GRF9BUklaT05BX0kyQz15CkNPTkZJR19NRkRfQ1M0N0wyND15CiMgQ09ORklHX01GRF9XTTUx
MDIgaXMgbm90IHNldAojIENPTkZJR19NRkRfV001MTEwIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZE
X1dNODk5NyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9XTTg5OTggaXMgbm90IHNldAojIENPTkZJ
R19NRkRfV004NDAwIGlzIG5vdCBzZXQKQ09ORklHX01GRF9XTTgzMVg9eQpDT05GSUdfTUZEX1dN
ODMxWF9JMkM9eQpDT05GSUdfTUZEX1dNODM1MD15CkNPTkZJR19NRkRfV004MzUwX0kyQz15CiMg
Q09ORklHX01GRF9XTTg5OTQgaXMgbm90IHNldAojIENPTkZJR19NRkRfU1RXNDgxWCBpcyBub3Qg
c2V0CkNPTkZJR19NRkRfUk9ITV9CRDcxOFhYPXkKQ09ORklHX01GRF9ST0hNX0JENzE4Mjg9eQpD
T05GSUdfTUZEX1JPSE1fQkQ5NTdYTVVGPXkKQ09ORklHX01GRF9TVE0zMl9MUFRJTUVSPXkKQ09O
RklHX01GRF9TVE0zMl9USU1FUlM9eQojIENPTkZJR19NRkRfU1RQTUlDMSBpcyBub3Qgc2V0CiMg
Q09ORklHX01GRF9TVE1GWCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9XQ0Q5MzRYIGlzIG5vdCBz
ZXQKQ09ORklHX01GRF9BVEMyNjBYPXkKQ09ORklHX01GRF9BVEMyNjBYX0kyQz15CiMgQ09ORklH
X01GRF9LSEFEQVNfTUNVIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0FDRVJfQTUwMF9FQyBpcyBu
b3Qgc2V0CkNPTkZJR19NRkRfUUNPTV9QTTgwMDg9eQpDT05GSUdfTUZEX1JTTVVfSTJDPXkKIyBl
bmQgb2YgTXVsdGlmdW5jdGlvbiBkZXZpY2UgZHJpdmVycwoKQ09ORklHX1JFR1VMQVRPUj15CiMg
Q09ORklHX1JFR1VMQVRPUl9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfRklYRURf
Vk9MVEFHRT15CkNPTkZJR19SRUdVTEFUT1JfVklSVFVBTF9DT05TVU1FUj15CkNPTkZJR19SRUdV
TEFUT1JfVVNFUlNQQUNFX0NPTlNVTUVSPXkKQ09ORklHX1JFR1VMQVRPUl84OFBHODZYPXkKQ09O
RklHX1JFR1VMQVRPUl84OFBNODYwNz15CiMgQ09ORklHX1JFR1VMQVRPUl9BQ1Q4ODY1IGlzIG5v
dCBzZXQKQ09ORklHX1JFR1VMQVRPUl9BQ1Q4OTQ1QT15CkNPTkZJR19SRUdVTEFUT1JfQUQ1Mzk4
PXkKIyBDT05GSUdfUkVHVUxBVE9SX0FOQVRPUCBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1Jf
QVJNX1NDTUk9eQpDT05GSUdfUkVHVUxBVE9SX0FTMzcyMj15CiMgQ09ORklHX1JFR1VMQVRPUl9B
VEMyNjBYIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX0FYUDIwWCBpcyBub3Qgc2V0CkNP
TkZJR19SRUdVTEFUT1JfQkNNNTkwWFg9eQojIENPTkZJR19SRUdVTEFUT1JfQkQ3MTgxNSBpcyBu
b3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfQkQ3MTgyOD15CiMgQ09ORklHX1JFR1VMQVRPUl9CRDcx
OFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX0JEOTU3WE1VRiBpcyBub3Qgc2V0CiMg
Q09ORklHX1JFR1VMQVRPUl9DUk9TX0VDIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX0RB
OTAzWCBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfREE5MDUyPXkKIyBDT05GSUdfUkVHVUxB
VE9SX0RBOTA2MyBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9EQTkxMjEgaXMgbm90IHNl
dApDT05GSUdfUkVHVUxBVE9SX0RBOTIxMD15CkNPTkZJR19SRUdVTEFUT1JfREE5MjExPXkKQ09O
RklHX1JFR1VMQVRPUl9GQU41MzU1NT15CkNPTkZJR19SRUdVTEFUT1JfRkFONTM4ODA9eQojIENP
TkZJR19SRUdVTEFUT1JfR1BJTyBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfSEk2NDIxPXkK
Q09ORklHX1JFR1VMQVRPUl9ISTY0MjFWNTMwPXkKIyBDT05GSUdfUkVHVUxBVE9SX0hJNjU1WCBp
cyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfSEk2NDIxVjYwMD15CiMgQ09ORklHX1JFR1VMQVRP
Ul9JU0w5MzA1IGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX0lTTDYyNzFBIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUkVHVUxBVE9SX0xNMzYzWCBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1Jf
TFAzOTcxPXkKIyBDT05GSUdfUkVHVUxBVE9SX0xQMzk3MiBpcyBub3Qgc2V0CkNPTkZJR19SRUdV
TEFUT1JfTFA4NzJYPXkKQ09ORklHX1JFR1VMQVRPUl9MUDg3M1g9eQojIENPTkZJR19SRUdVTEFU
T1JfTFA4NzU1IGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9MUDg3NTY1PXkKIyBDT05GSUdf
UkVHVUxBVE9SX0xUQzM1ODkgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX0xUQzM2NzY9eQpD
T05GSUdfUkVHVUxBVE9SX01BWDE1ODY9eQojIENPTkZJR19SRUdVTEFUT1JfTUFYNzc2MjAgaXMg
bm90IHNldApDT05GSUdfUkVHVUxBVE9SX01BWDc3NjUwPXkKQ09ORklHX1JFR1VMQVRPUl9NQVg4
NjQ5PXkKQ09ORklHX1JFR1VMQVRPUl9NQVg4NjYwPXkKQ09ORklHX1JFR1VMQVRPUl9NQVg4ODkz
PXkKIyBDT05GSUdfUkVHVUxBVE9SX01BWDg5MDcgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFU
T1JfTUFYODk1MiBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9NQVg4OTczIGlzIG5vdCBz
ZXQKQ09ORklHX1JFR1VMQVRPUl9NQVg4OTk4PXkKQ09ORklHX1JFR1VMQVRPUl9NQVgyMDA4Nj15
CiMgQ09ORklHX1JFR1VMQVRPUl9NQVg3NzY4NiBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRP
Ul9NQVg3NzY5MyBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9NQVg3NzgwMiBpcyBub3Qg
c2V0CkNPTkZJR19SRUdVTEFUT1JfTUFYNzc4MjY9eQojIENPTkZJR19SRUdVTEFUT1JfTUNQMTY1
MDIgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfTVA1NDE2IGlzIG5vdCBzZXQKIyBDT05G
SUdfUkVHVUxBVE9SX01QODg1OSBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfTVA4ODZYPXkK
Q09ORklHX1JFR1VMQVRPUl9NUFE3OTIwPXkKQ09ORklHX1JFR1VMQVRPUl9NVDYzMTE9eQojIENP
TkZJR19SRUdVTEFUT1JfTVQ2MzE1IGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9NVDYzNjA9
eQpDT05GSUdfUkVHVUxBVE9SX1BCSUFTPXkKQ09ORklHX1JFR1VMQVRPUl9QQ0E5NDUwPXkKQ09O
RklHX1JFR1VMQVRPUl9QRjhYMDA9eQpDT05GSUdfUkVHVUxBVE9SX1BGVVpFMTAwPXkKQ09ORklH
X1JFR1VMQVRPUl9QVjg4MDYwPXkKIyBDT05GSUdfUkVHVUxBVE9SX1BWODgwODAgaXMgbm90IHNl
dAojIENPTkZJR19SRUdVTEFUT1JfUFY4ODA5MCBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1Jf
UUNPTV9SUE09eQpDT05GSUdfUkVHVUxBVE9SX1FDT01fUlBNSD15CkNPTkZJR19SRUdVTEFUT1Jf
UUNPTV9TUE1JPXkKIyBDT05GSUdfUkVHVUxBVE9SX1FDT01fVVNCX1ZCVVMgaXMgbm90IHNldApD
T05GSUdfUkVHVUxBVE9SX1JLODA4PXkKQ09ORklHX1JFR1VMQVRPUl9STjVUNjE4PXkKQ09ORklH
X1JFR1VMQVRPUl9ST0hNPXkKQ09ORklHX1JFR1VMQVRPUl9SVDQ4MDE9eQpDT05GSUdfUkVHVUxB
VE9SX1JUNDgzMT15CkNPTkZJR19SRUdVTEFUT1JfUlQ1MTkwQT15CiMgQ09ORklHX1JFR1VMQVRP
Ul9SVDYxNjAgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX1JUNjI0NT15CkNPTkZJR19SRUdV
TEFUT1JfUlRRMjEzND15CiMgQ09ORklHX1JFR1VMQVRPUl9SVE1WMjAgaXMgbm90IHNldAojIENP
TkZJR19SRUdVTEFUT1JfUlRRNjc1MiBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfUzJNUEEw
MT15CkNPTkZJR19SRUdVTEFUT1JfUzJNUFMxMT15CiMgQ09ORklHX1JFR1VMQVRPUl9TNU04NzY3
IGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX1NDMjczMSBpcyBub3Qgc2V0CkNPTkZJR19S
RUdVTEFUT1JfU0xHNTEwMDA9eQojIENPTkZJR19SRUdVTEFUT1JfU1RNMzJfQk9PU1RFUiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9TVE0zMl9WUkVGQlVGIGlzIG5vdCBzZXQKQ09ORklH
X1JFR1VMQVRPUl9TVE0zMl9QV1I9eQpDT05GSUdfUkVHVUxBVE9SX1RJX0FCQj15CiMgQ09ORklH
X1JFR1VMQVRPUl9TVFc0ODFYX1ZNTUMgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX1NZNzYz
NkE9eQojIENPTkZJR19SRUdVTEFUT1JfU1k4MTA2QSBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFU
T1JfU1k4ODI0WD15CkNPTkZJR19SRUdVTEFUT1JfU1k4ODI3Tj15CkNPTkZJR19SRUdVTEFUT1Jf
VFBTNTE2MzI9eQpDT05GSUdfUkVHVUxBVE9SX1RQUzYxMDVYPXkKIyBDT05GSUdfUkVHVUxBVE9S
X1RQUzYyMzYwIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9SX1RQUzYyODZYIGlzIG5vdCBz
ZXQKQ09ORklHX1JFR1VMQVRPUl9UUFM2NTAyMz15CkNPTkZJR19SRUdVTEFUT1JfVFBTNjUwN1g9
eQojIENPTkZJR19SRUdVTEFUT1JfVFBTNjUwOTAgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9S
X1RQUzY1MTMyPXkKIyBDT05GSUdfUkVHVUxBVE9SX1RQUzY4NDcwIGlzIG5vdCBzZXQKIyBDT05G
SUdfUkVHVUxBVE9SX1VOSVBISUVSIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9WQ1RSTD15
CiMgQ09ORklHX1JFR1VMQVRPUl9WUU1NQ19JUFE0MDE5IGlzIG5vdCBzZXQKIyBDT05GSUdfUkVH
VUxBVE9SX1dNODMxWCBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9XTTgzNTAgaXMgbm90
IHNldApDT05GSUdfUkVHVUxBVE9SX1FDT01fTEFCSUJCPXkKQ09ORklHX1JDX0NPUkU9eQpDT05G
SUdfTElSQz15CiMgQ09ORklHX1JDX01BUCBpcyBub3Qgc2V0CiMgQ09ORklHX1JDX0RFQ09ERVJT
IGlzIG5vdCBzZXQKQ09ORklHX1JDX0RFVklDRVM9eQojIENPTkZJR19JUl9FTkUgaXMgbm90IHNl
dAojIENPTkZJR19JUl9GSU5URUsgaXMgbm90IHNldApDT05GSUdfSVJfR1BJT19DSVI9eQpDT05G
SUdfSVJfR1BJT19UWD15CkNPTkZJR19JUl9ISVg1SEQyPXkKIyBDT05GSUdfSVJfSVRFX0NJUiBp
cyBub3Qgc2V0CkNPTkZJR19JUl9NRVNPTj15CkNPTkZJR19JUl9NRVNPTl9UWD15CiMgQ09ORklH
X0lSX01USyBpcyBub3Qgc2V0CiMgQ09ORklHX0lSX05VVk9UT04gaXMgbm90IHNldAojIENPTkZJ
R19JUl9SWDUxIGlzIG5vdCBzZXQKIyBDT05GSUdfSVJfU0VSSUFMIGlzIG5vdCBzZXQKQ09ORklH
X0lSX1NVTlhJPXkKIyBDT05GSUdfSVJfV0lOQk9ORF9DSVIgaXMgbm90IHNldAojIENPTkZJR19S
Q19MT09QQkFDSyBpcyBub3Qgc2V0CiMgQ09ORklHX1JDX1NUIGlzIG5vdCBzZXQKIyBDT05GSUdf
SVJfSU1HIGlzIG5vdCBzZXQKQ09ORklHX0NFQ19DT1JFPXkKQ09ORklHX0NFQ19OT1RJRklFUj15
CgojCiMgQ0VDIHN1cHBvcnQKIwpDT05GSUdfTUVESUFfQ0VDX1JDPXkKQ09ORklHX01FRElBX0NF
Q19TVVBQT1JUPXkKQ09ORklHX0NFQ19DSDczMjI9eQojIENPTkZJR19DRUNfQ1JPU19FQyBpcyBu
b3Qgc2V0CkNPTkZJR19DRUNfTUVTT05fQU89eQojIENPTkZJR19DRUNfTUVTT05fRzEyQV9BTyBp
cyBub3Qgc2V0CiMgQ09ORklHX0NFQ19HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0VDX1NBTVNV
TkdfUzVQIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0VDX1NUSSBpcyBub3Qgc2V0CkNPTkZJR19DRUNf
U1RNMzI9eQojIENPTkZJR19DRUNfVEVHUkEgaXMgbm90IHNldAojIGVuZCBvZiBDRUMgc3VwcG9y
dAoKIyBDT05GSUdfTUVESUFfU1VQUE9SVCBpcyBub3Qgc2V0CgojCiMgR3JhcGhpY3Mgc3VwcG9y
dAojCiMgQ09ORklHX1RFR1JBX0hPU1QxWCBpcyBub3Qgc2V0CkNPTkZJR19JTVhfSVBVVjNfQ09S
RT15CiMgQ09ORklHX0RSTSBpcyBub3Qgc2V0CgojCiMgQVJNIGRldmljZXMKIwojIGVuZCBvZiBB
Uk0gZGV2aWNlcwoKIwojIEZyYW1lIGJ1ZmZlciBEZXZpY2VzCiMKIyBDT05GSUdfRkIgaXMgbm90
IHNldAojIENPTkZJR19NTVBfRElTUCBpcyBub3Qgc2V0CiMgZW5kIG9mIEZyYW1lIGJ1ZmZlciBE
ZXZpY2VzCgojCiMgQmFja2xpZ2h0ICYgTENEIGRldmljZSBzdXBwb3J0CiMKIyBDT05GSUdfTENE
X0NMQVNTX0RFVklDRSBpcyBub3Qgc2V0CiMgQ09ORklHX0JBQ0tMSUdIVF9DTEFTU19ERVZJQ0Ug
aXMgbm90IHNldAojIGVuZCBvZiBCYWNrbGlnaHQgJiBMQ0QgZGV2aWNlIHN1cHBvcnQKCiMKIyBD
b25zb2xlIGRpc3BsYXkgZHJpdmVyIHN1cHBvcnQKIwpDT05GSUdfRFVNTVlfQ09OU09MRT15CiMg
ZW5kIG9mIENvbnNvbGUgZGlzcGxheSBkcml2ZXIgc3VwcG9ydAojIGVuZCBvZiBHcmFwaGljcyBz
dXBwb3J0CgojIENPTkZJR19TT1VORCBpcyBub3Qgc2V0CgojCiMgSElEIHN1cHBvcnQKIwpDT05G
SUdfSElEPXkKQ09ORklHX0hJRF9CQVRURVJZX1NUUkVOR1RIPXkKIyBDT05GSUdfSElEUkFXIGlz
IG5vdCBzZXQKIyBDT05GSUdfVUhJRCBpcyBub3Qgc2V0CkNPTkZJR19ISURfR0VORVJJQz15Cgoj
CiMgU3BlY2lhbCBISUQgZHJpdmVycwojCkNPTkZJR19ISURfQTRURUNIPXkKQ09ORklHX0hJRF9B
Q1JVWD15CiMgQ09ORklHX0hJRF9BQ1JVWF9GRiBpcyBub3Qgc2V0CkNPTkZJR19ISURfQVBQTEU9
eQojIENPTkZJR19ISURfQVVSRUFMIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0JFTEtJTiBpcyBu
b3Qgc2V0CkNPTkZJR19ISURfQ0hFUlJZPXkKQ09ORklHX0hJRF9DT1VHQVI9eQpDT05GSUdfSElE
X01BQ0FMTFk9eQpDT05GSUdfSElEX0NNRURJQT15CiMgQ09ORklHX0hJRF9DWVBSRVNTIGlzIG5v
dCBzZXQKQ09ORklHX0hJRF9EUkFHT05SSVNFPXkKIyBDT05GSUdfRFJBR09OUklTRV9GRiBpcyBu
b3Qgc2V0CkNPTkZJR19ISURfRU1TX0ZGPXkKQ09ORklHX0hJRF9FTEVDT009eQojIENPTkZJR19I
SURfRVpLRVkgaXMgbm90IHNldApDT05GSUdfSElEX0dFTUJJUkQ9eQojIENPTkZJR19ISURfR0ZS
TSBpcyBub3Qgc2V0CkNPTkZJR19ISURfR0xPUklPVVM9eQpDT05GSUdfSElEX1ZJVkFMRElfQ09N
TU9OPXkKQ09ORklHX0hJRF9WSVZBTERJPXkKIyBDT05GSUdfSElEX0tFWVRPVUNIIGlzIG5vdCBz
ZXQKQ09ORklHX0hJRF9LWUU9eQpDT05GSUdfSElEX1dBTFRPUD15CkNPTkZJR19ISURfVklFV1NP
TklDPXkKQ09ORklHX0hJRF9YSUFPTUk9eQpDT05GSUdfSElEX0dZUkFUSU9OPXkKIyBDT05GSUdf
SElEX0lDQURFIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9JVEU9eQpDT05GSUdfSElEX0pBQlJBPXkK
Q09ORklHX0hJRF9UV0lOSEFOPXkKQ09ORklHX0hJRF9LRU5TSU5HVE9OPXkKIyBDT05GSUdfSElE
X0xDUE9XRVIgaXMgbm90IHNldApDT05GSUdfSElEX0xFRD15CkNPTkZJR19ISURfTEVOT1ZPPXkK
Q09ORklHX0hJRF9NQUdJQ01PVVNFPXkKQ09ORklHX0hJRF9NQUxUUk9OPXkKQ09ORklHX0hJRF9N
QVlGTEFTSD15CkNPTkZJR19ISURfUkVEUkFHT049eQpDT05GSUdfSElEX01JQ1JPU09GVD15CkNP
TkZJR19ISURfTU9OVEVSRVk9eQpDT05GSUdfSElEX01VTFRJVE9VQ0g9eQpDT05GSUdfSElEX05J
TlRFTkRPPXkKIyBDT05GSUdfTklOVEVORE9fRkYgaXMgbm90IHNldApDT05GSUdfSElEX05UST15
CiMgQ09ORklHX0hJRF9PUlRFSyBpcyBub3Qgc2V0CkNPTkZJR19ISURfUEFOVEhFUkxPUkQ9eQoj
IENPTkZJR19QQU5USEVSTE9SRF9GRiBpcyBub3Qgc2V0CkNPTkZJR19ISURfUEVUQUxZTlg9eQoj
IENPTkZJR19ISURfUElDT0xDRCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9QTEFOVFJPTklDUyBp
cyBub3Qgc2V0CiMgQ09ORklHX0hJRF9QTEFZU1RBVElPTiBpcyBub3Qgc2V0CkNPTkZJR19ISURf
UkFaRVI9eQpDT05GSUdfSElEX1BSSU1BWD15CkNPTkZJR19ISURfU0FJVEVLPXkKQ09ORklHX0hJ
RF9TRU1JVEVLPXkKQ09ORklHX0hJRF9TUEVFRExJTks9eQpDT05GSUdfSElEX1NURUFNPXkKIyBD
T05GSUdfSElEX1NURUVMU0VSSUVTIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9TVU5QTFVTPXkKQ09O
RklHX0hJRF9STUk9eQojIENPTkZJR19ISURfR1JFRU5BU0lBIGlzIG5vdCBzZXQKQ09ORklHX0hJ
RF9TTUFSVEpPWVBMVVM9eQojIENPTkZJR19TTUFSVEpPWVBMVVNfRkYgaXMgbm90IHNldAojIENP
TkZJR19ISURfVElWTyBpcyBub3Qgc2V0CkNPTkZJR19ISURfVE9QU0VFRD15CkNPTkZJR19ISURf
VEhJTkdNPXkKIyBDT05GSUdfSElEX1VEUkFXX1BTMyBpcyBub3Qgc2V0CkNPTkZJR19ISURfV0lJ
TU9URT15CkNPTkZJR19ISURfWElOTU89eQojIENPTkZJR19ISURfWkVST1BMVVMgaXMgbm90IHNl
dApDT05GSUdfSElEX1pZREFDUk9OPXkKQ09ORklHX0hJRF9TRU5TT1JfSFVCPXkKIyBDT05GSUdf
SElEX1NFTlNPUl9DVVNUT01fU0VOU09SIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9BTFBTPXkKIyBl
bmQgb2YgU3BlY2lhbCBISUQgZHJpdmVycwoKIwojIEkyQyBISUQgc3VwcG9ydAojCkNPTkZJR19J
MkNfSElEX09GPXkKIyBDT05GSUdfSTJDX0hJRF9PRl9HT09ESVggaXMgbm90IHNldAojIGVuZCBv
ZiBJMkMgSElEIHN1cHBvcnQKCkNPTkZJR19JMkNfSElEX0NPUkU9eQoKIwojIEludGVsIElTSCBI
SUQgc3VwcG9ydAojCiMgZW5kIG9mIEludGVsIElTSCBISUQgc3VwcG9ydAoKIwojIEFNRCBTRkgg
SElEIFN1cHBvcnQKIwojIENPTkZJR19BTURfU0ZIX0hJRCBpcyBub3Qgc2V0CiMgZW5kIG9mIEFN
RCBTRkggSElEIFN1cHBvcnQKIyBlbmQgb2YgSElEIHN1cHBvcnQKCkNPTkZJR19VU0JfT0hDSV9M
SVRUTEVfRU5ESUFOPXkKIyBDT05GSUdfVVNCX1NVUFBPUlQgaXMgbm90IHNldApDT05GSUdfTU1D
PXkKQ09ORklHX1BXUlNFUV9FTU1DPXkKQ09ORklHX1BXUlNFUV9TSU1QTEU9eQpDT05GSUdfTU1D
X0JMT0NLPXkKQ09ORklHX01NQ19CTE9DS19NSU5PUlM9OAojIENPTkZJR19TRElPX1VBUlQgaXMg
bm90IHNldApDT05GSUdfTU1DX1RFU1Q9eQoKIwojIE1NQy9TRC9TRElPIEhvc3QgQ29udHJvbGxl
ciBEcml2ZXJzCiMKQ09ORklHX01NQ19ERUJVRz15CkNPTkZJR19NTUNfQVJNTU1DST15CkNPTkZJ
R19NTUNfU1RNMzJfU0RNTUM9eQojIENPTkZJR19NTUNfU0RIQ0kgaXMgbm90IHNldApDT05GSUdf
TU1DX01FU09OX0dYPXkKQ09ORklHX01NQ19NRVNPTl9NWF9TREhDPXkKQ09ORklHX01NQ19NRVNP
Tl9NWF9TRElPPXkKIyBDT05GSUdfTU1DX01PWEFSVCBpcyBub3Qgc2V0CkNPTkZJR19NTUNfT01B
UD15CiMgQ09ORklHX01NQ19PTUFQX0hTIGlzIG5vdCBzZXQKQ09ORklHX01NQ19BTENPUj15CkNP
TkZJR19NTUNfQVRNRUxNQ0k9eQpDT05GSUdfTU1DX1RJRk1fU0Q9eQojIENPTkZJR19NTUNfTVZT
RElPIGlzIG5vdCBzZXQKIyBDT05GSUdfTU1DX0RBVklOQ0kgaXMgbm90IHNldAojIENPTkZJR19N
TUNfUzNDIGlzIG5vdCBzZXQKQ09ORklHX01NQ19UTUlPX0NPUkU9eQpDT05GSUdfTU1DX1RNSU89
eQpDT05GSUdfTU1DX1NESEk9eQpDT05GSUdfTU1DX1NESElfU1lTX0RNQUM9eQpDT05GSUdfTU1D
X1NESElfSU5URVJOQUxfRE1BQz15CiMgQ09ORklHX01NQ19VTklQSElFUiBpcyBub3Qgc2V0CkNP
TkZJR19NTUNfQ0I3MTA9eQpDT05GSUdfTU1DX1ZJQV9TRE1NQz15CkNPTkZJR19NTUNfRFc9eQpD
T05GSUdfTU1DX0RXX1BMVEZNPXkKQ09ORklHX01NQ19EV19CTFVFRklFTEQ9eQpDT05GSUdfTU1D
X0RXX0VYWU5PUz15CiMgQ09ORklHX01NQ19EV19ISTM3OThDVjIwMCBpcyBub3Qgc2V0CkNPTkZJ
R19NTUNfRFdfSzM9eQpDT05GSUdfTU1DX0RXX1BDST15CiMgQ09ORklHX01NQ19TSF9NTUNJRiBp
cyBub3Qgc2V0CiMgQ09ORklHX01NQ19XTVQgaXMgbm90IHNldApDT05GSUdfTU1DX1VTREhJNlJP
TDA9eQojIENPTkZJR19NTUNfUkVBTFRFS19QQ0kgaXMgbm90IHNldApDT05GSUdfTU1DX1NVTlhJ
PXkKQ09ORklHX01NQ19DUUhDST15CiMgQ09ORklHX01NQ19IU1EgaXMgbm90IHNldApDT05GSUdf
TU1DX1RPU0hJQkFfUENJPXkKIyBDT05GSUdfTU1DX0JDTTI4MzUgaXMgbm90IHNldApDT05GSUdf
TU1DX01USz15CiMgQ09ORklHX01NQ19PV0wgaXMgbm90IHNldAojIENPTkZJR19NTUNfTElURVgg
aXMgbm90IHNldApDT05GSUdfTUVNU1RJQ0s9eQojIENPTkZJR19NRU1TVElDS19ERUJVRyBpcyBu
b3Qgc2V0CgojCiMgTWVtb3J5U3RpY2sgZHJpdmVycwojCiMgQ09ORklHX01FTVNUSUNLX1VOU0FG
RV9SRVNVTUUgaXMgbm90IHNldApDT05GSUdfTVNQUk9fQkxPQ0s9eQojIENPTkZJR19NU19CTE9D
SyBpcyBub3Qgc2V0CgojCiMgTWVtb3J5U3RpY2sgSG9zdCBDb250cm9sbGVyIERyaXZlcnMKIwpD
T05GSUdfTUVNU1RJQ0tfVElGTV9NUz15CkNPTkZJR19NRU1TVElDS19KTUlDUk9OXzM4WD15CkNP
TkZJR19NRU1TVElDS19SNTkyPXkKQ09ORklHX01FTVNUSUNLX1JFQUxURUtfUENJPXkKQ09ORklH
X05FV19MRURTPXkKQ09ORklHX0xFRFNfQ0xBU1M9eQpDT05GSUdfTEVEU19DTEFTU19GTEFTSD15
CkNPTkZJR19MRURTX0NMQVNTX01VTFRJQ09MT1I9eQpDT05GSUdfTEVEU19CUklHSFRORVNTX0hX
X0NIQU5HRUQ9eQoKIwojIExFRCBkcml2ZXJzCiMKIyBDT05GSUdfTEVEU184OFBNODYwWCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0xFRFNfQU4zMDI1OUEgaXMgbm90IHNldAojIENPTkZJR19MRURTX0FS
SUVMIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19BVzIwMTMgaXMgbm90IHNldApDT05GSUdfTEVE
U19CQ002MzI4PXkKQ09ORklHX0xFRFNfQkNNNjM1OD15CiMgQ09ORklHX0xFRFNfVFVSUklTX09N
TklBIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19MTTM1MzAgaXMgbm90IHNldApDT05GSUdfTEVE
U19MTTM1MzI9eQpDT05GSUdfTEVEU19MTTM1MzM9eQojIENPTkZJR19MRURTX0xNMzY0MiBpcyBu
b3Qgc2V0CkNPTkZJR19MRURTX0xNMzY5Mlg9eQojIENPTkZJR19MRURTX1MzQzI0WFggaXMgbm90
IHNldAojIENPTkZJR19MRURTX0NPQkFMVF9RVUJFIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19D
T0JBTFRfUkFRIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNfUENBOTUzMj15CiMgQ09ORklHX0xFRFNf
UENBOTUzMl9HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19HUElPIGlzIG5vdCBzZXQKQ09O
RklHX0xFRFNfTFAzOTQ0PXkKIyBDT05GSUdfTEVEU19MUDM5NTIgaXMgbm90IHNldApDT05GSUdf
TEVEU19MUDUwWFg9eQpDT05GSUdfTEVEU19MUDU1WFhfQ09NTU9OPXkKQ09ORklHX0xFRFNfTFA1
NTIxPXkKIyBDT05GSUdfTEVEU19MUDU1MjMgaXMgbm90IHNldApDT05GSUdfTEVEU19MUDU1NjI9
eQpDT05GSUdfTEVEU19MUDg1MDE9eQojIENPTkZJR19MRURTX0xQODg2MCBpcyBub3Qgc2V0CkNP
TkZJR19MRURTX1BDQTk1NVg9eQojIENPTkZJR19MRURTX1BDQTk1NVhfR1BJTyBpcyBub3Qgc2V0
CkNPTkZJR19MRURTX1BDQTk2M1g9eQpDT05GSUdfTEVEU19XTTgzMVhfU1RBVFVTPXkKQ09ORklH
X0xFRFNfV004MzUwPXkKIyBDT05GSUdfTEVEU19EQTkwM1ggaXMgbm90IHNldApDT05GSUdfTEVE
U19EQTkwNTI9eQpDT05GSUdfTEVEU19SRUdVTEFUT1I9eQpDT05GSUdfTEVEU19CRDI4MDI9eQoj
IENPTkZJR19MRURTX0xUMzU5MyBpcyBub3Qgc2V0CkNPTkZJR19MRURTX05TMj15CkNPTkZJR19M
RURTX05FVFhCSUc9eQpDT05GSUdfTEVEU19BU0lDMz15CkNPTkZJR19MRURTX1RDQTY1MDc9eQoj
IENPTkZJR19MRURTX1RMQzU5MVhYIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNfTUFYNzc2NTA9eQoj
IENPTkZJR19MRURTX0xNMzU1eCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfT1QyMDAgaXMgbm90
IHNldApDT05GSUdfTEVEU19JUzMxRkwzMTlYPXkKQ09ORklHX0xFRFNfSVMzMUZMMzJYWD15Cgoj
CiMgTEVEIGRyaXZlciBmb3IgYmxpbmsoMSkgVVNCIFJHQiBMRUQgaXMgdW5kZXIgU3BlY2lhbCBI
SUQgZHJpdmVycyAoSElEX1RISU5HTSkKIwpDT05GSUdfTEVEU19CTElOS009eQpDT05GSUdfTEVE
U19TWVNDT049eQpDT05GSUdfTEVEU19NTFhSRUc9eQpDT05GSUdfTEVEU19VU0VSPXkKQ09ORklH
X0xFRFNfVElfTE1VX0NPTU1PTj15CiMgQ09ORklHX0xFRFNfTE0zNjk3IGlzIG5vdCBzZXQKQ09O
RklHX0xFRFNfTE0zNjI3ND15CkNPTkZJR19MRURTX1RQUzYxMDVYPXkKIyBDT05GSUdfTEVEU19J
UDMwIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19MR00gaXMgbm90IHNldAoKIwojIEZsYXNoIGFu
ZCBUb3JjaCBMRUQgZHJpdmVycwojCkNPTkZJR19MRURTX0FBVDEyOTA9eQojIENPTkZJR19MRURT
X0FTMzY0NUEgaXMgbm90IHNldAojIENPTkZJR19MRURTX0tURDI2OTIgaXMgbm90IHNldApDT05G
SUdfTEVEU19MTTM2MDFYPXkKIyBDT05GSUdfTEVEU19NQVg3NzY5MyBpcyBub3Qgc2V0CkNPTkZJ
R19MRURTX01UNjM2MD15CiMgQ09ORklHX0xFRFNfUlQ0NTA1IGlzIG5vdCBzZXQKQ09ORklHX0xF
RFNfUlQ4NTE1PXkKIyBDT05GSUdfTEVEU19TR00zMTQwIGlzIG5vdCBzZXQKCiMKIyBMRUQgVHJp
Z2dlcnMKIwpDT05GSUdfTEVEU19UUklHR0VSUz15CkNPTkZJR19MRURTX1RSSUdHRVJfVElNRVI9
eQpDT05GSUdfTEVEU19UUklHR0VSX09ORVNIT1Q9eQpDT05GSUdfTEVEU19UUklHR0VSX01URD15
CiMgQ09ORklHX0xFRFNfVFJJR0dFUl9IRUFSVEJFQVQgaXMgbm90IHNldAojIENPTkZJR19MRURT
X1RSSUdHRVJfQkFDS0xJR0hUIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19UUklHR0VSX0NQVSBp
cyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfVFJJR0dFUl9BQ1RJVklUWSBpcyBub3Qgc2V0CkNPTkZJ
R19MRURTX1RSSUdHRVJfR1BJTz15CiMgQ09ORklHX0xFRFNfVFJJR0dFUl9ERUZBVUxUX09OIGlz
IG5vdCBzZXQKCiMKIyBpcHRhYmxlcyB0cmlnZ2VyIGlzIHVuZGVyIE5ldGZpbHRlciBjb25maWcg
KExFRCB0YXJnZXQpCiMKQ09ORklHX0xFRFNfVFJJR0dFUl9UUkFOU0lFTlQ9eQpDT05GSUdfTEVE
U19UUklHR0VSX0NBTUVSQT15CiMgQ09ORklHX0xFRFNfVFJJR0dFUl9QQU5JQyBpcyBub3Qgc2V0
CkNPTkZJR19MRURTX1RSSUdHRVJfUEFUVEVSTj15CkNPTkZJR19MRURTX1RSSUdHRVJfQVVESU89
eQojIENPTkZJR19MRURTX1RSSUdHRVJfVFRZIGlzIG5vdCBzZXQKCiMKIyBTaW1wbGUgTEVEIGRy
aXZlcnMKIwpDT05GSUdfQUNDRVNTSUJJTElUWT15CkNPTkZJR19BMTFZX0JSQUlMTEVfQ09OU09M
RT15CgojCiMgU3BlYWt1cCBjb25zb2xlIHNwZWVjaAojCkNPTkZJR19TUEVBS1VQPXkKQ09ORklH
X1NQRUFLVVBfU0VSSUFMSU89eQojIENPTkZJR19TUEVBS1VQX1NZTlRIX0FDTlRTQSBpcyBub3Qg
c2V0CiMgQ09ORklHX1NQRUFLVVBfU1lOVEhfQUNOVFBDIGlzIG5vdCBzZXQKQ09ORklHX1NQRUFL
VVBfU1lOVEhfQVBPTExPPXkKIyBDT05GSUdfU1BFQUtVUF9TWU5USF9BVURQVFIgaXMgbm90IHNl
dApDT05GSUdfU1BFQUtVUF9TWU5USF9CTlM9eQojIENPTkZJR19TUEVBS1VQX1NZTlRIX0RFQ1RM
SyBpcyBub3Qgc2V0CkNPTkZJR19TUEVBS1VQX1NZTlRIX0RFQ0VYVD15CiMgQ09ORklHX1NQRUFL
VVBfU1lOVEhfRFRMSyBpcyBub3Qgc2V0CiMgQ09ORklHX1NQRUFLVVBfU1lOVEhfS0VZUEMgaXMg
bm90IHNldAojIENPTkZJR19TUEVBS1VQX1NZTlRIX0xUTEsgaXMgbm90IHNldApDT05GSUdfU1BF
QUtVUF9TWU5USF9TT0ZUPXkKIyBDT05GSUdfU1BFQUtVUF9TWU5USF9TUEtPVVQgaXMgbm90IHNl
dAojIENPTkZJR19TUEVBS1VQX1NZTlRIX1RYUFJUIGlzIG5vdCBzZXQKQ09ORklHX1NQRUFLVVBf
U1lOVEhfRFVNTVk9eQojIGVuZCBvZiBTcGVha3VwIGNvbnNvbGUgc3BlZWNoCgpDT05GSUdfRURB
Q19BVE9NSUNfU0NSVUI9eQpDT05GSUdfRURBQ19TVVBQT1JUPXkKQ09ORklHX0VEQUM9eQojIENP
TkZJR19FREFDX0xFR0FDWV9TWVNGUyBpcyBub3Qgc2V0CiMgQ09ORklHX0VEQUNfREVCVUcgaXMg
bm90IHNldAojIENPTkZJR19FREFDX0FMX01DIGlzIG5vdCBzZXQKQ09ORklHX0VEQUNfSElHSEJB
TktfTUM9eQpDT05GSUdfRURBQ19ISUdIQkFOS19MMj15CiMgQ09ORklHX0VEQUNfQUxURVJBIGlz
IG5vdCBzZXQKQ09ORklHX0VEQUNfU1lOT1BTWVM9eQojIENPTkZJR19FREFDX1hHRU5FIGlzIG5v
dCBzZXQKQ09ORklHX0VEQUNfVEk9eQojIENPTkZJR19FREFDX1FDT00gaXMgbm90IHNldApDT05G
SUdfUlRDX0xJQj15CiMgQ09ORklHX1JUQ19DTEFTUyBpcyBub3Qgc2V0CiMgQ09ORklHX0RNQURF
VklDRVMgaXMgbm90IHNldAoKIwojIERNQUJVRiBvcHRpb25zCiMKIyBDT05GSUdfU1lOQ19GSUxF
IGlzIG5vdCBzZXQKIyBDT05GSUdfVURNQUJVRiBpcyBub3Qgc2V0CiMgQ09ORklHX0RNQUJVRl9N
T1ZFX05PVElGWSBpcyBub3Qgc2V0CkNPTkZJR19ETUFCVUZfREVCVUc9eQpDT05GSUdfRE1BQlVG
X1NFTEZURVNUUz15CiMgQ09ORklHX0RNQUJVRl9IRUFQUyBpcyBub3Qgc2V0CkNPTkZJR19ETUFC
VUZfU1lTRlNfU1RBVFM9eQojIGVuZCBvZiBETUFCVUYgb3B0aW9ucwoKQ09ORklHX0FVWERJU1BM
QVk9eQpDT05GSUdfQ0hBUkxDRD15CiMgQ09ORklHX0xJTkVESVNQIGlzIG5vdCBzZXQKQ09ORklH
X0hENDQ3ODBfQ09NTU9OPXkKQ09ORklHX0hENDQ3ODA9eQojIENPTkZJR19JTUdfQVNDSUlfTENE
IGlzIG5vdCBzZXQKQ09ORklHX0xDRDJTPXkKQ09ORklHX0FSTV9DSEFSTENEPXkKQ09ORklHX1BB
UlBPUlRfUEFORUw9eQpDT05GSUdfUEFORUxfUEFSUE9SVD0wCkNPTkZJR19QQU5FTF9QUk9GSUxF
PTUKIyBDT05GSUdfUEFORUxfQ0hBTkdFX01FU1NBR0UgaXMgbm90IHNldAojIENPTkZJR19DSEFS
TENEX0JMX09GRiBpcyBub3Qgc2V0CkNPTkZJR19DSEFSTENEX0JMX09OPXkKIyBDT05GSUdfQ0hB
UkxDRF9CTF9GTEFTSCBpcyBub3Qgc2V0CiMgQ09ORklHX1BBTkVMIGlzIG5vdCBzZXQKQ09ORklH
X1VJTz15CkNPTkZJR19VSU9fQ0lGPXkKIyBDT05GSUdfVUlPX1BEUlZfR0VOSVJRIGlzIG5vdCBz
ZXQKQ09ORklHX1VJT19ETUVNX0dFTklSUT15CiMgQ09ORklHX1VJT19BRUMgaXMgbm90IHNldApD
T05GSUdfVUlPX1NFUkNPUzM9eQpDT05GSUdfVUlPX1BDSV9HRU5FUklDPXkKQ09ORklHX1VJT19O
RVRYPXkKQ09ORklHX1VJT19QUlVTUz15CiMgQ09ORklHX1VJT19NRjYyNCBpcyBub3Qgc2V0CkNP
TkZJR19WRklPPXkKQ09ORklHX1ZGSU9fSU9NTVVfVFlQRTE9eQpDT05GSUdfVkZJT19WSVJRRkQ9
eQpDT05GSUdfVkZJT19OT0lPTU1VPXkKQ09ORklHX1ZGSU9fUENJX0NPUkU9eQpDT05GSUdfVkZJ
T19QQ0lfTU1BUD15CkNPTkZJR19WRklPX1BDSV9JTlRYPXkKQ09ORklHX1ZGSU9fUENJPXkKQ09O
RklHX1ZGSU9fUExBVEZPUk09eQpDT05GSUdfVkZJT19BTUJBPXkKQ09ORklHX1ZGSU9fUExBVEZP
Uk1fQ0FMWEVEQVhHTUFDX1JFU0VUPXkKQ09ORklHX1ZGSU9fUExBVEZPUk1fQU1EWEdCRV9SRVNF
VD15CiMgQ09ORklHX1ZGSU9fUExBVEZPUk1fQkNNRkxFWFJNX1JFU0VUIGlzIG5vdCBzZXQKQ09O
RklHX1ZGSU9fTURFVj15CkNPTkZJR19JUlFfQllQQVNTX01BTkFHRVI9eQojIENPTkZJR19WSVJU
X0RSSVZFUlMgaXMgbm90IHNldApDT05GSUdfVklSVElPPXkKQ09ORklHX1ZJUlRJT19NRU5VPXkK
IyBDT05GSUdfVklSVElPX1BDSSBpcyBub3Qgc2V0CkNPTkZJR19WSVJUSU9fQkFMTE9PTj15CiMg
Q09ORklHX1ZJUlRJT19JTlBVVCBpcyBub3Qgc2V0CkNPTkZJR19WSVJUSU9fTU1JTz15CkNPTkZJ
R19WSVJUSU9fTU1JT19DTURMSU5FX0RFVklDRVM9eQpDT05GSUdfVkhPU1RfTUVOVT15CiMgQ09O
RklHX1ZIT1NUX0NST1NTX0VORElBTl9MRUdBQ1kgaXMgbm90IHNldAoKIwojIE1pY3Jvc29mdCBI
eXBlci1WIGd1ZXN0IHN1cHBvcnQKIwojIGVuZCBvZiBNaWNyb3NvZnQgSHlwZXItViBndWVzdCBz
dXBwb3J0CgpDT05GSUdfR1JFWUJVUz15CiMgQ09ORklHX0NPTUVESSBpcyBub3Qgc2V0CkNPTkZJ
R19TVEFHSU5HPXkKQ09ORklHX1NUQUdJTkdfTUVESUE9eQojIENPTkZJR19TVEFHSU5HX0JPQVJE
IGlzIG5vdCBzZXQKQ09ORklHX0ZJUkVXSVJFX1NFUklBTD15CkNPTkZJR19GV1RUWV9NQVhfVE9U
QUxfUE9SVFM9NjQKQ09ORklHX0ZXVFRZX01BWF9DQVJEX1BPUlRTPTMyCiMgQ09ORklHX1VOSVNZ
U1NQQVIgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX1hMTlhfQ0xLV1pSRCBpcyBub3Qg
c2V0CiMgQ09ORklHX01PU1RfQ09NUE9ORU5UUyBpcyBub3Qgc2V0CkNPTkZJR19HUkVZQlVTX0JP
T1RST009eQojIENPTkZJR19HUkVZQlVTX0hJRCBpcyBub3Qgc2V0CiMgQ09ORklHX0dSRVlCVVNf
TElHSFQgaXMgbm90IHNldAojIENPTkZJR19HUkVZQlVTX0xPRyBpcyBub3Qgc2V0CkNPTkZJR19H
UkVZQlVTX0xPT1BCQUNLPXkKQ09ORklHX0dSRVlCVVNfUE9XRVI9eQpDT05GSUdfR1JFWUJVU19S
QVc9eQojIENPTkZJR19HUkVZQlVTX1ZJQlJBVE9SIGlzIG5vdCBzZXQKQ09ORklHX0dSRVlCVVNf
QlJJREdFRF9QSFk9eQojIENPTkZJR19HUkVZQlVTX0dQSU8gaXMgbm90IHNldAojIENPTkZJR19H
UkVZQlVTX0kyQyBpcyBub3Qgc2V0CkNPTkZJR19HUkVZQlVTX1NESU89eQpDT05GSUdfR1JFWUJV
U19VQVJUPXkKIyBDT05GSUdfR1JFWUJVU19BUkNIRSBpcyBub3Qgc2V0CkNPTkZJR19CQ01fVklE
RU9DT1JFPXkKIyBDT05GSUdfQkNNMjgzNV9WQ0hJUSBpcyBub3Qgc2V0CkNPTkZJR19YSUxfQVhJ
U19GSUZPPXkKQ09ORklHX0ZJRUxEQlVTX0RFVj15CkNPTkZJR19ITVNfQU5ZQlVTU19CVVM9eQoj
IENPTkZJR19BUkNYX0FOWUJVU19DT05UUk9MTEVSIGlzIG5vdCBzZXQKQ09ORklHX0hNU19QUk9G
SU5FVD15CiMgQ09ORklHX0dPTERGSVNIIGlzIG5vdCBzZXQKQ09ORklHX0NIUk9NRV9QTEFURk9S
TVM9eQpDT05GSUdfQ1JPU19FQz15CiMgQ09ORklHX0NST1NfRUNfSTJDIGlzIG5vdCBzZXQKQ09O
RklHX0NST1NfRUNfUlBNU0c9eQpDT05GSUdfQ1JPU19FQ19QUk9UTz15CkNPTkZJR19DUk9TX0VD
X0NIQVJERVY9eQpDT05GSUdfQ1JPU19FQ19MSUdIVEJBUj15CkNPTkZJR19DUk9TX0VDX1ZCQz15
CkNPTkZJR19DUk9TX0VDX0RFQlVHRlM9eQpDT05GSUdfQ1JPU19FQ19TRU5TT1JIVUI9eQpDT05G
SUdfQ1JPU19FQ19TWVNGUz15CkNPTkZJR19DUk9TX1VTQlBEX0xPR0dFUj15CkNPTkZJR19DUk9T
X1VTQlBEX05PVElGWT15CkNPTkZJR19NRUxMQU5PWF9QTEFURk9STT15CkNPTkZJR19NTFhSRUdf
SE9UUExVRz15CkNPTkZJR19NTFhSRUdfSU89eQpDT05GSUdfTUxYUkVHX0xDPXkKIyBDT05GSUdf
T0xQQ19YTzE3NSBpcyBub3Qgc2V0CkNPTkZJR19TVVJGQUNFX1BMQVRGT1JNUz15CkNPTkZJR19I
QVZFX0NMSz15CkNPTkZJR19IQVZFX0NMS19QUkVQQVJFPXkKQ09ORklHX0NPTU1PTl9DTEs9eQpD
T05GSUdfQ09NTU9OX0NMS19XTTgzMVg9eQoKIwojIENsb2NrIGRyaXZlciBmb3IgQVJNIFJlZmVy
ZW5jZSBkZXNpZ25zCiMKQ09ORklHX0NMS19JQ1NUPXkKQ09ORklHX0NMS19TUDgxMD15CiMgZW5k
IG9mIENsb2NrIGRyaXZlciBmb3IgQVJNIFJlZmVyZW5jZSBkZXNpZ25zCgojIENPTkZJR19DTEtf
SFNESyBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfQVBQTEVfTkNPIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ09NTU9OX0NMS19NQVg3NzY4NiBpcyBub3Qgc2V0CkNPTkZJR19DT01NT05fQ0xL
X01BWDk0ODU9eQpDT05GSUdfQ09NTU9OX0NMS19SSzgwOD15CkNPTkZJR19DT01NT05fQ0xLX0hJ
NjU1WD15CkNPTkZJR19DT01NT05fQ0xLX1NDTUk9eQpDT05GSUdfQ09NTU9OX0NMS19TQ1BJPXkK
Q09ORklHX0NPTU1PTl9DTEtfU0k1MzQxPXkKQ09ORklHX0NPTU1PTl9DTEtfU0k1MzUxPXkKQ09O
RklHX0NPTU1PTl9DTEtfU0k1MTQ9eQpDT05GSUdfQ09NTU9OX0NMS19TSTU0ND15CiMgQ09ORklH
X0NPTU1PTl9DTEtfU0k1NzAgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX0JNMTg4MCBp
cyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfQ0RDRTcwNiBpcyBub3Qgc2V0CiMgQ09ORklH
X0NPTU1PTl9DTEtfVFBTNjg0NzAgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX0NEQ0U5
MjUgaXMgbm90IHNldApDT05GSUdfQ09NTU9OX0NMS19DUzIwMDBfQ1A9eQojIENPTkZJR19DT01N
T05fQ0xLX0ZTTF9GTEVYU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19GU0xfU0FJ
IGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19HRU1JTkkgaXMgbm90IHNldApDT05GSUdf
Q09NTU9OX0NMS19MQU45NjZYPXkKIyBDT05GSUdfQ09NTU9OX0NMS19BU1BFRUQgaXMgbm90IHNl
dAojIENPTkZJR19DT01NT05fQ0xLX1MyTVBTMTEgaXMgbm90IHNldApDT05GSUdfQ0xLX1RXTDYw
NDA9eQojIENPTkZJR19DT01NT05fQ0xLX0FYSV9DTEtHRU4gaXMgbm90IHNldAojIENPTkZJR19D
TEtfUU9SSVEgaXMgbm90IHNldAojIENPTkZJR19DTEtfTFMxMDI4QV9QTExESUcgaXMgbm90IHNl
dAojIENPTkZJR19DT01NT05fQ0xLX1hHRU5FIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NM
S19PWE5BUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfUlM5X1BDSUUgaXMgbm90IHNl
dApDT05GSUdfQ09NTU9OX0NMS19WQzU9eQpDT05GSUdfQ09NTU9OX0NMS19TVE0zMk1QMTU3PXkK
IyBDT05GSUdfQ09NTU9OX0NMS19NTVAyX0FVRElPIGlzIG5vdCBzZXQKQ09ORklHX0NPTU1PTl9D
TEtfQkQ3MThYWD15CiMgQ09ORklHX0NPTU1PTl9DTEtfRklYRURfTU1JTyBpcyBub3Qgc2V0CiMg
Q09ORklHX0NMS19BQ1RJT05TIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0xLX0JBSUtBTF9UMSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NMS19CQ00yNzExX0RWUCBpcyBub3Qgc2V0CiMgQ09ORklHX0NMS19C
Q00yODM1IGlzIG5vdCBzZXQKIyBDT05GSUdfQ0xLX0JDTV82M1hYIGlzIG5vdCBzZXQKIyBDT05G
SUdfQ0xLX0JDTV82M1hYX0dBVEUgaXMgbm90IHNldAojIENPTkZJR19DTEtfQkNNX0tPTkEgaXMg
bm90IHNldAojIENPTkZJR19DTEtfQkNNX0NZR05VUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NMS19C
Q01fSFIyIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0xLX0JDTV9OU1AgaXMgbm90IHNldAojIENPTkZJ
R19DTEtfQkNNX05TMiBpcyBub3Qgc2V0CiMgQ09ORklHX0NMS19CQ01fU1IgaXMgbm90IHNldAoj
IENPTkZJR19DTEtfUkFTUEJFUlJZUEkgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX0hJ
MzUxNkNWMzAwIGlzIG5vdCBzZXQKQ09ORklHX0NPTU1PTl9DTEtfSEkzNTE5PXkKQ09ORklHX0NP
TU1PTl9DTEtfSEkzNTU5QT15CiMgQ09ORklHX0NPTU1PTl9DTEtfSEkzNjYwIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ09NTU9OX0NMS19ISTM2NzAgaXMgbm90IHNldApDT05GSUdfQ09NTU9OX0NMS19I
STM3OThDVjIwMD15CiMgQ09ORklHX0NPTU1PTl9DTEtfSEk2MjIwIGlzIG5vdCBzZXQKQ09ORklH
X1JFU0VUX0hJU0k9eQojIENPTkZJR19DT01NT05fQ0xLX0JPU1RPTiBpcyBub3Qgc2V0CiMgQ09O
RklHX01YQ19DTEsgaXMgbm90IHNldAojIENPTkZJR19DTEtfSU1YOE1NIGlzIG5vdCBzZXQKIyBD
T05GSUdfQ0xLX0lNWDhNTiBpcyBub3Qgc2V0CiMgQ09ORklHX0NMS19JTVg4TVAgaXMgbm90IHNl
dAojIENPTkZJR19DTEtfSU1YOE1RIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0xLX0lNWDhVTFAgaXMg
bm90IHNldAojIENPTkZJR19DTEtfSU1YOTMgaXMgbm90IHNldAoKIwojIEluZ2VuaWMgU29DcyBk
cml2ZXJzCiMKIyBDT05GSUdfSU5HRU5JQ19DR1VfSlo0NzQwIGlzIG5vdCBzZXQKIyBDT05GSUdf
SU5HRU5JQ19DR1VfSlo0NzI1QiBpcyBub3Qgc2V0CiMgQ09ORklHX0lOR0VOSUNfQ0dVX0paNDc2
MCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOR0VOSUNfQ0dVX0paNDc3MCBpcyBub3Qgc2V0CiMgQ09O
RklHX0lOR0VOSUNfQ0dVX0paNDc4MCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOR0VOSUNfQ0dVX1gx
MDAwIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5HRU5JQ19DR1VfWDE4MzAgaXMgbm90IHNldAojIENP
TkZJR19JTkdFTklDX1RDVV9DTEsgaXMgbm90IHNldAojIGVuZCBvZiBJbmdlbmljIFNvQ3MgZHJp
dmVycwoKQ09ORklHX0NPTU1PTl9DTEtfS0VZU1RPTkU9eQpDT05GSUdfVElfU1lTQ09OX0NMSz15
CgojCiMgQ2xvY2sgZHJpdmVyIGZvciBNZWRpYVRlayBTb0MKIwojIENPTkZJR19DT01NT05fQ0xL
X01UMjcwMSBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfTVQyNzEyIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ09NTU9OX0NMS19NVDY3NjUgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xL
X01UNjc3OSBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfTVQ2Nzk3IGlzIG5vdCBzZXQK
IyBDT05GSUdfQ09NTU9OX0NMS19NVDc2MjIgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xL
X01UNzYyOSBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfTVQ3OTg2IGlzIG5vdCBzZXQK
IyBDT05GSUdfQ09NTU9OX0NMS19NVDgxMzUgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xL
X01UODE2NyBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfTVQ4MTczIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ09NTU9OX0NMS19NVDgxODMgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xL
X01UODE5MiBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfTVQ4MTk1IGlzIG5vdCBzZXQK
IyBDT05GSUdfQ09NTU9OX0NMS19NVDg1MTYgaXMgbm90IHNldAojIGVuZCBvZiBDbG9jayBkcml2
ZXIgZm9yIE1lZGlhVGVrIFNvQwoKIwojIENsb2NrIHN1cHBvcnQgZm9yIEFtbG9naWMgcGxhdGZv
cm1zCiMKQ09ORklHX0NPTU1PTl9DTEtfTUVTT05fUkVHTUFQPXkKQ09ORklHX0NPTU1PTl9DTEtf
TUVTT05fTVBMTD15CkNPTkZJR19DT01NT05fQ0xLX01FU09OX1BMTD15CkNPTkZJR19DT01NT05f
Q0xLX01FU09OOEI9eQojIGVuZCBvZiBDbG9jayBzdXBwb3J0IGZvciBBbWxvZ2ljIHBsYXRmb3Jt
cwoKQ09ORklHX01TVEFSX01TQzMxM19NUExMPXkKIyBDT05GSUdfTUNIUF9DTEtfTVBGUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfUElTVEFDSElPIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q09NTU9OX0NMS19RQ09NIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0xLX01UNzYyMSBpcyBub3Qgc2V0
CkNPTkZJR19DTEtfUkVORVNBUz15CkNPTkZJR19DTEtfRU1FVjI9eQojIENPTkZJR19DTEtfUlpB
MSBpcyBub3Qgc2V0CkNPTkZJR19DTEtfUjdTOTIxMD15CkNPTkZJR19DTEtfUjhBNzNBND15CkNP
TkZJR19DTEtfUjhBNzc0MD15CkNPTkZJR19DTEtfUjhBNzc0Mj15CkNPTkZJR19DTEtfUjhBNzc0
Mz15CkNPTkZJR19DTEtfUjhBNzc0NT15CiMgQ09ORklHX0NMS19SOEE3NzQ3MCBpcyBub3Qgc2V0
CiMgQ09ORklHX0NMS19SOEE3NzRBMSBpcyBub3Qgc2V0CiMgQ09ORklHX0NMS19SOEE3NzRCMSBp
cyBub3Qgc2V0CiMgQ09ORklHX0NMS19SOEE3NzRDMCBpcyBub3Qgc2V0CiMgQ09ORklHX0NMS19S
OEE3NzRFMSBpcyBub3Qgc2V0CiMgQ09ORklHX0NMS19SOEE3Nzc4IGlzIG5vdCBzZXQKIyBDT05G
SUdfQ0xLX1I4QTc3NzkgaXMgbm90IHNldApDT05GSUdfQ0xLX1I4QTc3OTA9eQpDT05GSUdfQ0xL
X1I4QTc3OTE9eQojIENPTkZJR19DTEtfUjhBNzc5MiBpcyBub3Qgc2V0CkNPTkZJR19DTEtfUjhB
Nzc5ND15CiMgQ09ORklHX0NMS19SOEE3Nzk1IGlzIG5vdCBzZXQKIyBDT05GSUdfQ0xLX1I4QTc3
OTYwIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0xLX1I4QTc3OTYxIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q0xLX1I4QTc3OTY1IGlzIG5vdCBzZXQKIyBDT05GSUdfQ0xLX1I4QTc3OTcwIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ0xLX1I4QTc3OTgwIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0xLX1I4QTc3OTkwIGlz
IG5vdCBzZXQKIyBDT05GSUdfQ0xLX1I4QTc3OTk1IGlzIG5vdCBzZXQKIyBDT05GSUdfQ0xLX1I4
QTc3OUEwIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0xLX1I4QTc3OUYwIGlzIG5vdCBzZXQKQ09ORklH
X0NMS19SOUEwNkcwMzI9eQojIENPTkZJR19DTEtfUjlBMDdHMDQ0IGlzIG5vdCBzZXQKIyBDT05G
SUdfQ0xLX1I5QTA3RzA1NCBpcyBub3Qgc2V0CkNPTkZJR19DTEtfU0g3M0EwPXkKIyBDT05GSUdf
Q0xLX1JDQVJfQ1BHX0xJQiBpcyBub3Qgc2V0CkNPTkZJR19DTEtfUkNBUl9HRU4yX0NQRz15CiMg
Q09ORklHX0NMS19SQ0FSX0dFTjNfQ1BHIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0xLX1JDQVJfR0VO
NF9DUEcgaXMgbm90IHNldAojIENPTkZJR19DTEtfUkNBUl9VU0IyX0NMT0NLX1NFTCBpcyBub3Qg
c2V0CiMgQ09ORklHX0NMS19SWkcyTCBpcyBub3Qgc2V0CkNPTkZJR19DTEtfUkVORVNBU19DUEdf
TVNTUj15CkNPTkZJR19DTEtfUkVORVNBU19DUEdfTVNUUD15CkNPTkZJR19DTEtfUkVORVNBU19E
SVY2PXkKQ09ORklHX0NPTU1PTl9DTEtfU0FNU1VORz15CiMgQ09ORklHX1MzQzY0WFhfQ09NTU9O
X0NMSyBpcyBub3Qgc2V0CiMgQ09ORklHX1M1UFYyMTBfQ09NTU9OX0NMSyBpcyBub3Qgc2V0CkNP
TkZJR19FWFlOT1NfMzI1MF9DT01NT05fQ0xLPXkKIyBDT05GSUdfRVhZTk9TXzRfQ09NTU9OX0NM
SyBpcyBub3Qgc2V0CkNPTkZJR19FWFlOT1NfNTI1MF9DT01NT05fQ0xLPXkKQ09ORklHX0VYWU5P
U181MjYwX0NPTU1PTl9DTEs9eQojIENPTkZJR19FWFlOT1NfNTQxMF9DT01NT05fQ0xLIGlzIG5v
dCBzZXQKIyBDT05GSUdfRVhZTk9TXzU0MjBfQ09NTU9OX0NMSyBpcyBub3Qgc2V0CiMgQ09ORklH
X0VYWU5PU19BUk02NF9DT01NT05fQ0xLIGlzIG5vdCBzZXQKIyBDT05GSUdfRVhZTk9TX0FVRFNT
X0NMS19DT04gaXMgbm90IHNldApDT05GSUdfRVhZTk9TX0NMS09VVD15CiMgQ09ORklHX1MzQzI0
MTBfQ09NTU9OX0NMSyBpcyBub3Qgc2V0CiMgQ09ORklHX1MzQzI0MTJfQ09NTU9OX0NMSyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1MzQzI0NDNfQ09NTU9OX0NMSyBpcyBub3Qgc2V0CiMgQ09ORklHX0NM
S19TSUZJVkUgaXMgbm90IHNldApDT05GSUdfQ0xLX0lOVEVMX1NPQ0ZQR0E9eQpDT05GSUdfQ0xL
X0lOVEVMX1NPQ0ZQR0EzMj15CiMgQ09ORklHX0NMS19JTlRFTF9TT0NGUEdBNjQgaXMgbm90IHNl
dAojIENPTkZJR19TUFJEX0NPTU1PTl9DTEsgaXMgbm90IHNldAojIENPTkZJR19DTEtfU1RBUkZJ
VkVfSkg3MTAwIGlzIG5vdCBzZXQKQ09ORklHX0NMS19TVU5YST15CkNPTkZJR19DTEtfU1VOWElf
Q0xPQ0tTPXkKIyBDT05GSUdfQ0xLX1NVTlhJX1BSQ01fU1VONkkgaXMgbm90IHNldAojIENPTkZJ
R19DTEtfU1VOWElfUFJDTV9TVU44SSBpcyBub3Qgc2V0CkNPTkZJR19DTEtfU1VOWElfUFJDTV9T
VU45ST15CkNPTkZJR19TVU5YSV9DQ1U9eQojIENPTkZJR19TVU5JVl9GMUMxMDBTX0NDVSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NVTjIwSV9EMV9DQ1UgaXMgbm90IHNldAojIENPTkZJR19TVU4yMElf
RDFfUl9DQ1UgaXMgbm90IHNldAojIENPTkZJR19TVU41MElfQTY0X0NDVSBpcyBub3Qgc2V0CiMg
Q09ORklHX1NVTjUwSV9BMTAwX0NDVSBpcyBub3Qgc2V0CiMgQ09ORklHX1NVTjUwSV9BMTAwX1Jf
Q0NVIGlzIG5vdCBzZXQKIyBDT05GSUdfU1VONTBJX0g2X0NDVSBpcyBub3Qgc2V0CiMgQ09ORklH
X1NVTjUwSV9INjE2X0NDVSBpcyBub3Qgc2V0CiMgQ09ORklHX1NVTjUwSV9INl9SX0NDVSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NVTjRJX0ExMF9DQ1UgaXMgbm90IHNldAojIENPTkZJR19TVU41SV9D
Q1UgaXMgbm90IHNldAojIENPTkZJR19TVU42SV9BMzFfQ0NVIGlzIG5vdCBzZXQKQ09ORklHX1NV
TjZJX1JUQ19DQ1U9eQojIENPTkZJR19TVU44SV9BMjNfQ0NVIGlzIG5vdCBzZXQKIyBDT05GSUdf
U1VOOElfQTMzX0NDVSBpcyBub3Qgc2V0CiMgQ09ORklHX1NVTjhJX0E4M1RfQ0NVIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU1VOOElfSDNfQ0NVIGlzIG5vdCBzZXQKIyBDT05GSUdfU1VOOElfVjNTX0ND
VSBpcyBub3Qgc2V0CiMgQ09ORklHX1NVTjhJX0RFMl9DQ1UgaXMgbm90IHNldAojIENPTkZJR19T
VU44SV9SNDBfQ0NVIGlzIG5vdCBzZXQKIyBDT05GSUdfU1VOOUlfQTgwX0NDVSBpcyBub3Qgc2V0
CkNPTkZJR19TVU44SV9SX0NDVT15CkNPTkZJR19DT01NT05fQ0xLX1RJX0FEUExMPXkKIyBDT05G
SUdfQ0xLX1VOSVBISUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19WSVNDT05USSBp
cyBub3Qgc2V0CiMgQ09ORklHX0NMS19MR01fQ0dVIGlzIG5vdCBzZXQKQ09ORklHX1hJTElOWF9W
Q1U9eQojIENPTkZJR19DT01NT05fQ0xLX1pZTlFNUCBpcyBub3Qgc2V0CkNPTkZJR19IV1NQSU5M
T0NLPXkKIyBDT05GSUdfSFdTUElOTE9DS19PTUFQIGlzIG5vdCBzZXQKQ09ORklHX0hXU1BJTkxP
Q0tfUUNPTT15CiMgQ09ORklHX0hXU1BJTkxPQ0tfU1BSRCBpcyBub3Qgc2V0CkNPTkZJR19IV1NQ
SU5MT0NLX1NUTTMyPXkKQ09ORklHX0hXU1BJTkxPQ0tfU1VONkk9eQojIENPTkZJR19IU0VNX1U4
NTAwIGlzIG5vdCBzZXQKCiMKIyBDbG9jayBTb3VyY2UgZHJpdmVycwojCkNPTkZJR19USU1FUl9P
Rj15CkNPTkZJR19USU1FUl9QUk9CRT15CkNPTkZJR19PTUFQX0RNX1RJTUVSPXkKQ09ORklHX0NM
S1NSQ19NTUlPPXkKIyBDT05GSUdfQkNNMjgzNV9USU1FUiBpcyBub3Qgc2V0CiMgQ09ORklHX0JD
TV9LT05BX1RJTUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfREFWSU5DSV9USU1FUiBpcyBub3Qgc2V0
CkNPTkZJR19ESUdJQ09MT1JfVElNRVI9eQpDT05GSUdfRFdfQVBCX1RJTUVSPXkKQ09ORklHX0RX
X0FQQl9USU1FUl9PRj15CiMgQ09ORklHX0ZUVE1SMDEwX1RJTUVSIGlzIG5vdCBzZXQKIyBDT05G
SUdfSVhQNFhYX1RJTUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfUk9DS0NISVBfVElNRVIgaXMgbm90
IHNldAojIENPTkZJR19BUk1BREFfMzcwX1hQX1RJTUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVT
T042X1RJTUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfT1JJT05fVElNRVIgaXMgbm90IHNldAojIENP
TkZJR19PV0xfVElNRVIgaXMgbm90IHNldApDT05GSUdfUkRBX1RJTUVSPXkKQ09ORklHX1NVTjRJ
X1RJTUVSPXkKIyBDT05GSUdfU1VONUlfSFNUSU1FUiBpcyBub3Qgc2V0CiMgQ09ORklHX1RFR1JB
X1RJTUVSIGlzIG5vdCBzZXQKQ09ORklHX1ZUODUwMF9USU1FUj15CkNPTkZJR19OUENNN1hYX1RJ
TUVSPXkKIyBDT05GSUdfQ0FERU5DRV9UVENfVElNRVIgaXMgbm90IHNldAojIENPTkZJR19BU005
MjYwX1RJTUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0xLU1JDX05PTUFESUtfTVRVIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQ0xLU1JDX0RCWDUwMF9QUkNNVSBpcyBub3Qgc2V0CiMgQ09ORklHX0NMUFM3
MTFYX1RJTUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfTVhTX1RJTUVSIGlzIG5vdCBzZXQKIyBDT05G
SUdfTlNQSVJFX1RJTUVSIGlzIG5vdCBzZXQKQ09ORklHX0tFWVNUT05FX1RJTUVSPXkKIyBDT05G
SUdfSU5URUdSQVRPUl9BUF9USU1FUiBpcyBub3Qgc2V0CiMgQ09ORklHX0NMS1NSQ19MUEMzMlhY
IGlzIG5vdCBzZXQKIyBDT05GSUdfQ0xLU1JDX1BJU1RBQ0hJTyBpcyBub3Qgc2V0CkNPTkZJR19D
TEtTUkNfVElfMzJLPXkKQ09ORklHX0NMS1NSQ19TVE0zMj15CiMgQ09ORklHX0NMS1NSQ19TVE0z
Ml9MUCBpcyBub3Qgc2V0CiMgQ09ORklHX0NMS1NSQ19NUFMyIGlzIG5vdCBzZXQKIyBDT05GSUdf
QVJDX1RJTUVSUyBpcyBub3Qgc2V0CkNPTkZJR19BUk1fQVJDSF9USU1FUj15CiMgQ09ORklHX0FS
TV9BUkNIX1RJTUVSX0VWVFNUUkVBTSBpcyBub3Qgc2V0CkNPTkZJR19BUk1fR0xPQkFMX1RJTUVS
PXkKQ09ORklHX0FSTV9HVF9JTklUSUFMX1BSRVNDQUxFUl9WQUw9MQpDT05GSUdfQVJNX1RJTUVS
X1NQODA0PXkKQ09ORklHX0NMS1NSQ19BUk1fR0xPQkFMX1RJTUVSX1NDSEVEX0NMT0NLPXkKIyBD
T05GSUdfQVJNVjdNX1NZU1RJQ0sgaXMgbm90IHNldAojIENPTkZJR19BVE1FTF9QSVQgaXMgbm90
IHNldAojIENPTkZJR19BVE1FTF9TVCBpcyBub3Qgc2V0CiMgQ09ORklHX0FUTUVMX1RDQl9DTEtT
UkMgaXMgbm90IHNldApDT05GSUdfQ0xLU1JDX0VYWU5PU19NQ1Q9eQojIENPTkZJR19DTEtTUkNf
U0FNU1VOR19QV00gaXMgbm90IHNldAojIENPTkZJR19GU0xfRlRNX1RJTUVSIGlzIG5vdCBzZXQK
IyBDT05GSUdfT1hOQVNfUlBTX1RJTUVSIGlzIG5vdCBzZXQKQ09ORklHX1NZU19TVVBQT1JUU19T
SF9DTVQ9eQojIENPTkZJR19NVEtfVElNRVIgaXMgbm90IHNldApDT05GSUdfU1lTX1NVUFBPUlRT
X1NIX1RNVT15CkNPTkZJR19TWVNfU1VQUE9SVFNfRU1fU1RJPXkKIyBDT05GSUdfQ0xLU1JDX0pD
T1JFX1BJVCBpcyBub3Qgc2V0CkNPTkZJR19TSF9USU1FUl9DTVQ9eQojIENPTkZJR19TSF9USU1F
Ul9NVFUyIGlzIG5vdCBzZXQKQ09ORklHX1JFTkVTQVNfT1NUTT15CkNPTkZJR19TSF9USU1FUl9U
TVU9eQpDT05GSUdfRU1fVElNRVJfU1RJPXkKQ09ORklHX0NMS1NSQ19RQ09NPXkKIyBDT05GSUdf
Q0xLU1JDX1ZFUlNBVElMRSBpcyBub3Qgc2V0CiMgQ09ORklHX0NMS1NSQ19QWEEgaXMgbm90IHNl
dAojIENPTkZJR19IODMwMF9UTVI4IGlzIG5vdCBzZXQKIyBDT05GSUdfSDgzMDBfVE1SMTYgaXMg
bm90IHNldAojIENPTkZJR19IODMwMF9UUFUgaXMgbm90IHNldAojIENPTkZJR19DTEtTUkNfSU1Y
X0dQVCBpcyBub3Qgc2V0CiMgQ09ORklHX0NMS1NSQ19JTVhfVFBNIGlzIG5vdCBzZXQKIyBDT05G
SUdfVElNRVJfSU1YX1NZU19DVFIgaXMgbm90IHNldAojIENPTkZJR19DTEtTUkNfU1RfTFBDIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUlMQkVBVVRfVElNRVIgaXMgbm90IHNldAojIENPTkZJR19NU0Mz
MTNFX1RJTUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5HRU5JQ19USU1FUiBpcyBub3Qgc2V0CiMg
Q09ORklHX0lOR0VOSUNfU1lTT1NUIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5HRU5JQ19PU1QgaXMg
bm90IHNldApDT05GSUdfTUlDUk9DSElQX1BJVDY0Qj15CiMgZW5kIG9mIENsb2NrIFNvdXJjZSBk
cml2ZXJzCgpDT05GSUdfTUFJTEJPWD15CkNPTkZJR19BUk1fTUhVPXkKQ09ORklHX0FSTV9NSFVf
VjI9eQojIENPTkZJR19JTVhfTUJPWCBpcyBub3Qgc2V0CkNPTkZJR19QTEFURk9STV9NSFU9eQpD
T05GSUdfUEwzMjBfTUJPWD15CiMgQ09ORklHX0FSTUFEQV8zN1hYX1JXVE1fTUJPWCBpcyBub3Qg
c2V0CkNPTkZJR19PTUFQMlBMVVNfTUJPWD15CkNPTkZJR19PTUFQX01CT1hfS0ZJRk9fU0laRT0y
NTYKIyBDT05GSUdfUk9DS0NISVBfTUJPWCBpcyBub3Qgc2V0CiMgQ09ORklHX0FMVEVSQV9NQk9Y
IGlzIG5vdCBzZXQKQ09ORklHX1RJX01FU1NBR0VfTUFOQUdFUj15CkNPTkZJR19ISTM2NjBfTUJP
WD15CkNPTkZJR19ISTYyMjBfTUJPWD15CkNPTkZJR19NQUlMQk9YX1RFU1Q9eQojIENPTkZJR19Q
T0xBUkZJUkVfU09DX01BSUxCT1ggaXMgbm90IHNldApDT05GSUdfUUNPTV9BUENTX0lQQz15CiMg
Q09ORklHX0JDTV9QRENfTUJPWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NUTTMyX0lQQ0MgaXMgbm90
IHNldAojIENPTkZJR19NVEtfQURTUF9NQk9YIGlzIG5vdCBzZXQKIyBDT05GSUdfTVRLX0NNRFFf
TUJPWCBpcyBub3Qgc2V0CkNPTkZJR19TVU42SV9NU0dCT1g9eQojIENPTkZJR19TUFJEX01CT1gg
aXMgbm90IHNldAojIENPTkZJR19RQ09NX0lQQ0MgaXMgbm90IHNldApDT05GSUdfSU9NTVVfQVBJ
PXkKIyBDT05GSUdfSU9NTVVfU1VQUE9SVCBpcyBub3Qgc2V0CgojCiMgUmVtb3RlcHJvYyBkcml2
ZXJzCiMKIyBDT05GSUdfUkVNT1RFUFJPQyBpcyBub3Qgc2V0CiMgZW5kIG9mIFJlbW90ZXByb2Mg
ZHJpdmVycwoKIwojIFJwbXNnIGRyaXZlcnMKIwpDT05GSUdfUlBNU0c9eQpDT05GSUdfUlBNU0df
Q1RSTD15CkNPTkZJR19SUE1TR19OUz15CkNPTkZJR19SUE1TR19RQ09NX0dMSU5LPXkKQ09ORklH
X1JQTVNHX1FDT01fR0xJTktfUlBNPXkKQ09ORklHX1JQTVNHX1FDT01fR0xJTktfU01FTT15CiMg
Q09ORklHX1JQTVNHX1FDT01fU01EIGlzIG5vdCBzZXQKQ09ORklHX1JQTVNHX1ZJUlRJTz15CiMg
ZW5kIG9mIFJwbXNnIGRyaXZlcnMKCkNPTkZJR19TT1VORFdJUkU9eQoKIwojIFNvdW5kV2lyZSBE
ZXZpY2VzCiMKCiMKIyBTT0MgKFN5c3RlbSBPbiBDaGlwKSBzcGVjaWZpYyBEcml2ZXJzCiMKIyBD
T05GSUdfT1dMX1BNX0RPTUFJTlMgaXMgbm90IHNldAoKIwojIEFtbG9naWMgU29DIGRyaXZlcnMK
IwojIENPTkZJR19NRVNPTl9DQU5WQVMgaXMgbm90IHNldApDT05GSUdfTUVTT05fQ0xLX01FQVNV
UkU9eQpDT05GSUdfTUVTT05fR1hfU09DSU5GTz15CiMgQ09ORklHX01FU09OX0dYX1BNX0RPTUFJ
TlMgaXMgbm90IHNldApDT05GSUdfTUVTT05fRUVfUE1fRE9NQUlOUz15CkNPTkZJR19NRVNPTl9N
WF9TT0NJTkZPPXkKIyBlbmQgb2YgQW1sb2dpYyBTb0MgZHJpdmVycwoKIwojIEFwcGxlIFNvQyBk
cml2ZXJzCiMKIyBDT05GSUdfQVBQTEVfUE1HUl9QV1JTVEFURSBpcyBub3Qgc2V0CiMgZW5kIG9m
IEFwcGxlIFNvQyBkcml2ZXJzCgojCiMgQVNQRUVEIFNvQyBkcml2ZXJzCiMKIyBDT05GSUdfQVNQ
RUVEX0xQQ19DVFJMIGlzIG5vdCBzZXQKIyBDT05GSUdfQVNQRUVEX0xQQ19TTk9PUCBpcyBub3Qg
c2V0CiMgQ09ORklHX0FTUEVFRF9VQVJUX1JPVVRJTkcgaXMgbm90IHNldAojIENPTkZJR19BU1BF
RURfUDJBX0NUUkwgaXMgbm90IHNldAojIENPTkZJR19BU1BFRURfU09DSU5GTyBpcyBub3Qgc2V0
CiMgZW5kIG9mIEFTUEVFRCBTb0MgZHJpdmVycwoKQ09ORklHX0FUOTFfU09DX0lEPXkKQ09ORklH
X0FUOTFfU09DX1NGUj15CgojCiMgQnJvYWRjb20gU29DIGRyaXZlcnMKIwojIENPTkZJR19CQ00y
ODM1X1BPV0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfU09DX0JDTTYzWFggaXMgbm90IHNldAojIENP
TkZJR19TT0NfQlJDTVNUQiBpcyBub3Qgc2V0CiMgQ09ORklHX0JDTV9QTUIgaXMgbm90IHNldAoj
IGVuZCBvZiBCcm9hZGNvbSBTb0MgZHJpdmVycwoKIwojIE5YUC9GcmVlc2NhbGUgUW9ySVEgU29D
IGRyaXZlcnMKIwojIENPTkZJR19RVUlDQ19FTkdJTkUgaXMgbm90IHNldApDT05GSUdfRFBBQTJf
Q09OU09MRT15CiMgZW5kIG9mIE5YUC9GcmVlc2NhbGUgUW9ySVEgU29DIGRyaXZlcnMKCiMKIyBp
Lk1YIFNvQyBkcml2ZXJzCiMKIyBDT05GSUdfSU1YX0dQQ1YyX1BNX0RPTUFJTlMgaXMgbm90IHNl
dAojIENPTkZJR19TT0NfSU1YOE0gaXMgbm90IHNldAojIGVuZCBvZiBpLk1YIFNvQyBkcml2ZXJz
CgojCiMgSVhQNHh4IFNvQyBkcml2ZXJzCiMKIyBDT05GSUdfSVhQNFhYX1FNR1IgaXMgbm90IHNl
dAojIENPTkZJR19JWFA0WFhfTlBFIGlzIG5vdCBzZXQKIyBlbmQgb2YgSVhQNHh4IFNvQyBkcml2
ZXJzCgojCiMgRW5hYmxlIExpdGVYIFNvQyBCdWlsZGVyIHNwZWNpZmljIGRyaXZlcnMKIwojIENP
TkZJR19MSVRFWF9TT0NfQ09OVFJPTExFUiBpcyBub3Qgc2V0CiMgZW5kIG9mIEVuYWJsZSBMaXRl
WCBTb0MgQnVpbGRlciBzcGVjaWZpYyBkcml2ZXJzCgojCiMgTWVkaWFUZWsgU29DIGRyaXZlcnMK
IwojIENPTkZJR19NVEtfQ01EUSBpcyBub3Qgc2V0CiMgQ09ORklHX01US19ERVZBUEMgaXMgbm90
IHNldAojIENPTkZJR19NVEtfSU5GUkFDRkcgaXMgbm90IHNldAojIENPTkZJR19NVEtfUE1JQ19X
UkFQIGlzIG5vdCBzZXQKIyBDT05GSUdfTVRLX1NDUFNZUyBpcyBub3Qgc2V0CiMgQ09ORklHX01U
S19TQ1BTWVNfUE1fRE9NQUlOUyBpcyBub3Qgc2V0CiMgQ09ORklHX01US19NTVNZUyBpcyBub3Qg
c2V0CiMgZW5kIG9mIE1lZGlhVGVrIFNvQyBkcml2ZXJzCgojCiMgUXVhbGNvbW0gU29DIGRyaXZl
cnMKIwojIENPTkZJR19RQ09NX0FPU1NfUU1QIGlzIG5vdCBzZXQKQ09ORklHX1FDT01fQ09NTUFO
RF9EQj15CkNPTkZJR19RQ09NX0NQUj15CkNPTkZJR19RQ09NX0dFTklfU0U9eQpDT05GSUdfUUNP
TV9HU0JJPXkKQ09ORklHX1FDT01fTExDQz15CiMgQ09ORklHX1FDT01fT0NNRU0gaXMgbm90IHNl
dAojIENPTkZJR19RQ09NX1JNVEZTX01FTSBpcyBub3Qgc2V0CkNPTkZJR19RQ09NX1JQTUg9eQpD
T05GSUdfUUNPTV9SUE1IUEQ9eQpDT05GSUdfUUNPTV9TTUVNPXkKIyBDT05GSUdfUUNPTV9TTURf
UlBNIGlzIG5vdCBzZXQKQ09ORklHX1FDT01fU01FTV9TVEFURT15CkNPTkZJR19RQ09NX1NNUDJQ
PXkKQ09ORklHX1FDT01fU01TTT15CiMgQ09ORklHX1FDT01fU09DSU5GTyBpcyBub3Qgc2V0CkNP
TkZJR19RQ09NX1NQTT15CkNPTkZJR19RQ09NX1NUQVRTPXkKQ09ORklHX1FDT01fV0NOU1NfQ1RS
TD15CiMgZW5kIG9mIFF1YWxjb21tIFNvQyBkcml2ZXJzCgpDT05GSUdfU09DX1JFTkVTQVM9eQpD
T05GSUdfQVJDSF9SQ0FSX0dFTjI9eQpDT05GSUdfQVJDSF9STU9CSUxFPXkKQ09ORklHX0FSQ0hf
UlpOMT15CkNPTkZJR19BUkNIX0VNRVYyPXkKQ09ORklHX0FSQ0hfUjhBNzc5ND15CiMgQ09ORklH
X0FSQ0hfUjhBNzc3OSBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX1I4QTc3OTA9eQojIENPTkZJR19B
UkNIX1I4QTc3NzggaXMgbm90IHNldApDT05GSUdfQVJDSF9SOEE3NzkzPXkKQ09ORklHX0FSQ0hf
UjhBNzc5MT15CiMgQ09ORklHX0FSQ0hfUjhBNzc5MiBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX1I4
QTc3NDA9eQpDT05GSUdfQVJDSF9SOEE3M0E0PXkKIyBDT05GSUdfQVJDSF9SN1M3MjEwMCBpcyBu
b3Qgc2V0CkNPTkZJR19BUkNIX1I3UzkyMTA9eQojIENPTkZJR19BUkNIX1I4QTc3NDcwIGlzIG5v
dCBzZXQKQ09ORklHX0FSQ0hfUjhBNzc0NT15CkNPTkZJR19BUkNIX1I4QTc3NDI9eQpDT05GSUdf
QVJDSF9SOEE3NzQzPXkKQ09ORklHX0FSQ0hfUjhBNzc0ND15CkNPTkZJR19BUkNIX1I5QTA2RzAz
Mj15CkNPTkZJR19BUkNIX1NINzNBMD15CkNPTkZJR19SU1RfUkNBUj15CkNPTkZJR19TWVNDX1JD
QVI9eQojIENPTkZJR19TWVNDX1JDQVJfR0VONCBpcyBub3Qgc2V0CiMgQ09ORklHX1NZU0NfUjhB
Nzc5OTUgaXMgbm90IHNldApDT05GSUdfU1lTQ19SOEE3Nzk0PXkKIyBDT05GSUdfU1lTQ19SOEE3
Nzk5MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NZU0NfUjhBNzc3OSBpcyBub3Qgc2V0CkNPTkZJR19T
WVNDX1I4QTc3OTA9eQojIENPTkZJR19TWVNDX1I4QTc3OTUgaXMgbm90IHNldApDT05GSUdfU1lT
Q19SOEE3NzkxPXkKIyBDT05GSUdfU1lTQ19SOEE3Nzk2NSBpcyBub3Qgc2V0CiMgQ09ORklHX1NZ
U0NfUjhBNzc5NjAgaXMgbm90IHNldAojIENPTkZJR19TWVNDX1I4QTc3OTYxIGlzIG5vdCBzZXQK
IyBDT05GSUdfU1lTQ19SOEE3NzlGMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NZU0NfUjhBNzc5MiBp
cyBub3Qgc2V0CiMgQ09ORklHX1NZU0NfUjhBNzc5ODAgaXMgbm90IHNldAojIENPTkZJR19TWVND
X1I4QTc3OTcwIGlzIG5vdCBzZXQKIyBDT05GSUdfU1lTQ19SOEE3NzlBMCBpcyBub3Qgc2V0CkNP
TkZJR19TWVNDX1JNT0JJTEU9eQojIENPTkZJR19TWVNDX1I4QTc3NDcwIGlzIG5vdCBzZXQKQ09O
RklHX1NZU0NfUjhBNzc0NT15CkNPTkZJR19TWVNDX1I4QTc3NDI9eQpDT05GSUdfU1lTQ19SOEE3
NzQzPXkKIyBDT05GSUdfU1lTQ19SOEE3NzRDMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NZU0NfUjhB
Nzc0RTEgaXMgbm90IHNldAojIENPTkZJR19TWVNDX1I4QTc3NEExIGlzIG5vdCBzZXQKIyBDT05G
SUdfU1lTQ19SOEE3NzRCMSBpcyBub3Qgc2V0CiMgQ09ORklHX1JPQ0tDSElQX0dSRiBpcyBub3Qg
c2V0CiMgQ09ORklHX1JPQ0tDSElQX0lPRE9NQUlOIGlzIG5vdCBzZXQKIyBDT05GSUdfUk9DS0NI
SVBfUE1fRE9NQUlOUyBpcyBub3Qgc2V0CkNPTkZJR19TT0NfU0FNU1VORz15CkNPTkZJR19FWFlO
T1NfQVNWX0FSTT15CkNPTkZJR19FWFlOT1NfQ0hJUElEPXkKQ09ORklHX0VYWU5PU19VU0k9eQpD
T05GSUdfRVhZTk9TX1BNVT15CkNPTkZJR19FWFlOT1NfUE1VX0FSTV9EUklWRVJTPXkKQ09ORklH
X0VYWU5PU19QTV9ET01BSU5TPXkKIyBDT05GSUdfRVhZTk9TX1JFR1VMQVRPUl9DT1VQTEVSIGlz
IG5vdCBzZXQKQ09ORklHX1NVTlhJX01CVVM9eQpDT05GSUdfU1VOWElfU1JBTT15CiMgQ09ORklH
X1NPQ19URUdSQTIwX1ZPTFRBR0VfQ09VUExFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NPQ19URUdS
QTMwX1ZPTFRBR0VfQ09VUExFUiBpcyBub3Qgc2V0CkNPTkZJR19TT0NfVEk9eQpDT05GSUdfS0VZ
U1RPTkVfTkFWSUdBVE9SX1FNU1M9eQojIENPTkZJR19LRVlTVE9ORV9OQVZJR0FUT1JfRE1BIGlz
IG5vdCBzZXQKQ09ORklHX1RJX1BSVVNTPXkKIyBDT05GSUdfVVg1MDBfU09DX0lEIGlzIG5vdCBz
ZXQKQ09ORklHX1NPQ19SRUFMVklFVz15CgojCiMgWGlsaW54IFNvQyBkcml2ZXJzCiMKIyBlbmQg
b2YgWGlsaW54IFNvQyBkcml2ZXJzCiMgZW5kIG9mIFNPQyAoU3lzdGVtIE9uIENoaXApIHNwZWNp
ZmljIERyaXZlcnMKCkNPTkZJR19QTV9ERVZGUkVRPXkKCiMKIyBERVZGUkVRIEdvdmVybm9ycwoj
CkNPTkZJR19ERVZGUkVRX0dPVl9TSU1QTEVfT05ERU1BTkQ9eQpDT05GSUdfREVWRlJFUV9HT1Zf
UEVSRk9STUFOQ0U9eQpDT05GSUdfREVWRlJFUV9HT1ZfUE9XRVJTQVZFPXkKIyBDT05GSUdfREVW
RlJFUV9HT1ZfVVNFUlNQQUNFIGlzIG5vdCBzZXQKQ09ORklHX0RFVkZSRVFfR09WX1BBU1NJVkU9
eQoKIwojIERFVkZSRVEgRHJpdmVycwojCkNPTkZJR19BUk1fRVhZTk9TX0JVU19ERVZGUkVRPXkK
IyBDT05GSUdfQVJNX0lNWF9CVVNfREVWRlJFUSBpcyBub3Qgc2V0CiMgQ09ORklHX0FSTV9JTVg4
TV9ERFJDX0RFVkZSRVEgaXMgbm90IHNldAojIENPTkZJR19BUk1fVEVHUkFfREVWRlJFUSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0FSTV9SSzMzOTlfRE1DX0RFVkZSRVEgaXMgbm90IHNldApDT05GSUdf
QVJNX1NVTjhJX0EzM19NQlVTX0RFVkZSRVE9eQpDT05GSUdfUE1fREVWRlJFUV9FVkVOVD15CkNP
TkZJR19ERVZGUkVRX0VWRU5UX0VYWU5PU19OT0NQPXkKQ09ORklHX0RFVkZSRVFfRVZFTlRfRVhZ
Tk9TX1BQTVU9eQojIENPTkZJR19ERVZGUkVRX0VWRU5UX1JPQ0tDSElQX0RGSSBpcyBub3Qgc2V0
CkNPTkZJR19FWFRDT049eQoKIwojIEV4dGNvbiBEZXZpY2UgRHJpdmVycwojCkNPTkZJR19FWFRD
T05fRlNBOTQ4MD15CkNPTkZJR19FWFRDT05fR1BJTz15CiMgQ09ORklHX0VYVENPTl9NQVgzMzU1
IGlzIG5vdCBzZXQKIyBDT05GSUdfRVhUQ09OX01BWDc3NjkzIGlzIG5vdCBzZXQKQ09ORklHX0VY
VENPTl9QVE41MTUwPXkKQ09ORklHX0VYVENPTl9RQ09NX1NQTUlfTUlTQz15CkNPTkZJR19FWFRD
T05fUlQ4OTczQT15CkNPTkZJR19FWFRDT05fU001NTAyPXkKQ09ORklHX0VYVENPTl9VU0JfR1BJ
Tz15CkNPTkZJR19FWFRDT05fVVNCQ19DUk9TX0VDPXkKIyBDT05GSUdfRVhUQ09OX1VTQkNfVFVT
QjMyMCBpcyBub3Qgc2V0CkNPTkZJR19NRU1PUlk9eQpDT05GSUdfRERSPXkKQ09ORklHX0FSTV9Q
TDE3Ml9NUE1DPXkKQ09ORklHX0FUTUVMX1NEUkFNQz15CkNPTkZJR19BVE1FTF9FQkk9eQojIENP
TkZJR19CUkNNU1RCX0RQRkUgaXMgbm90IHNldAojIENPTkZJR19CVDFfTDJfQ1RMIGlzIG5vdCBz
ZXQKQ09ORklHX1RJX0FFTUlGPXkKQ09ORklHX1RJX0VNSUY9eQpDT05GSUdfT01BUF9HUE1DPXkK
IyBDT05GSUdfT01BUF9HUE1DX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX1RJX0VNSUZfU1JBTT15
CkNPTkZJR19NVkVCVV9ERVZCVVM9eQojIENPTkZJR19GU0xfQ09SRU5FVF9DRiBpcyBub3Qgc2V0
CiMgQ09ORklHX0ZTTF9JRkMgaXMgbm90IHNldAojIENPTkZJR19KWjQ3ODBfTkVNQyBpcyBub3Qg
c2V0CiMgQ09ORklHX01US19TTUkgaXMgbm90IHNldAojIENPTkZJR19EQThYWF9ERFJDVEwgaXMg
bm90IHNldAojIENPTkZJR19QTDM1M19TTUMgaXMgbm90IHNldApDT05GSUdfUkVORVNBU19SUENJ
Rj15CiMgQ09ORklHX1NUTTMyX0ZNQzJfRUJJIGlzIG5vdCBzZXQKQ09ORklHX1NBTVNVTkdfTUM9
eQpDT05GSUdfRVhZTk9TNTQyMl9ETUM9eQpDT05GSUdfRVhZTk9TX1NST009eQpDT05GSUdfVEVH
UkFfTUM9eQpDT05GSUdfVEVHUkEyMF9FTUM9eQpDT05GSUdfVEVHUkEzMF9FTUM9eQpDT05GSUdf
VEVHUkExMjRfRU1DPXkKIyBDT05GSUdfVEVHUkEyMTBfRU1DIGlzIG5vdCBzZXQKIyBDT05GSUdf
SUlPIGlzIG5vdCBzZXQKQ09ORklHX05UQj15CiMgQ09ORklHX05UQl9NU0kgaXMgbm90IHNldApD
T05GSUdfTlRCX0lEVD15CiMgQ09ORklHX05UQl9TV0lUQ0hURUMgaXMgbm90IHNldApDT05GSUdf
TlRCX1BJTkdQT05HPXkKQ09ORklHX05UQl9UT09MPXkKQ09ORklHX05UQl9QRVJGPXkKQ09ORklH
X05UQl9UUkFOU1BPUlQ9eQpDT05GSUdfVk1FX0JVUz15CgojCiMgVk1FIEJyaWRnZSBEcml2ZXJz
CiMKIyBDT05GSUdfVk1FX1RTSTE0OCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZNRV9GQUtFIGlzIG5v
dCBzZXQKCiMKIyBWTUUgQm9hcmQgRHJpdmVycwojCiMgQ09ORklHX1ZNSVZNRV83ODA1IGlzIG5v
dCBzZXQKCiMKIyBWTUUgRGV2aWNlIERyaXZlcnMKIwpDT05GSUdfVk1FX1VTRVI9eQojIENPTkZJ
R19QV00gaXMgbm90IHNldAoKIwojIElSUSBjaGlwIHN1cHBvcnQKIwpDT05GSUdfSVJRQ0hJUD15
CkNPTkZJR19BUk1fR0lDPXkKQ09ORklHX0FSTV9HSUNfTUFYX05SPTIKQ09ORklHX0FSTV9HSUNf
VjJNPXkKQ09ORklHX0FSTV9HSUNfVjM9eQpDT05GSUdfQVJNX0dJQ19WM19JVFM9eQpDT05GSUdf
QVJNX0dJQ19WM19JVFNfUENJPXkKIyBDT05GSUdfQUxfRklDIGlzIG5vdCBzZXQKQ09ORklHX0FU
TUVMX0FJQzVfSVJRPXkKQ09ORklHX0RXX0FQQl9JQ1RMPXkKQ09ORklHX09NQVBfSVJRQ0hJUD15
CiMgQ09ORklHX0pDT1JFX0FJQyBpcyBub3Qgc2V0CkNPTkZJR19SREFfSU5UQz15CkNPTkZJR19S
RU5FU0FTX0lOVENfSVJRUElOPXkKQ09ORklHX1JFTkVTQVNfSVJRQz15CkNPTkZJR19SRU5FU0FT
X1JaQTFfSVJRQz15CiMgQ09ORklHX1NMMjhDUExEX0lOVEMgaXMgbm90IHNldAojIENPTkZJR19U
UzQ4MDBfSVJRIGlzIG5vdCBzZXQKQ09ORklHX0lSUV9DUk9TU0JBUj15CkNPTkZJR19LRVlTVE9O
RV9JUlE9eQojIENPTkZJR19JTkdFTklDX1RDVV9JUlEgaXMgbm90IHNldAojIENPTkZJR19SRU5F
U0FTX0g4U19JTlRDIGlzIG5vdCBzZXQKQ09ORklHX1BBUlRJVElPTl9QRVJDUFU9eQpDT05GSUdf
U1RNMzJfRVhUST15CiMgQ09ORklHX0lSUV9VTklQSElFUl9BSURFVCBpcyBub3Qgc2V0CkNPTkZJ
R19NRVNPTl9JUlFfR1BJTz15CkNPTkZJR19RQ09NX1BEQz15CkNPTkZJR19RQ09NX01QTT15CiMg
Q09ORklHX0lNWF9JUlFTVEVFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0lNWF9JTlRNVVggaXMgbm90
IHNldApDT05GSUdfVElfUFJVU1NfSU5UQz15CkNPTkZJR19FWFlOT1NfSVJRX0NPTUJJTkVSPXkK
IyBDT05GSUdfTE9PTkdTT05fUENIX1BJQyBpcyBub3Qgc2V0CiMgQ09ORklHX0xPT05HU09OX1BD
SF9NU0kgaXMgbm90IHNldApDT05GSUdfTVNUX0lSUT15CiMgQ09ORklHX01DSFBfRUlDIGlzIG5v
dCBzZXQKIyBlbmQgb2YgSVJRIGNoaXAgc3VwcG9ydAoKIyBDT05GSUdfSVBBQ0tfQlVTIGlzIG5v
dCBzZXQKQ09ORklHX0FSQ0hfSEFTX1JFU0VUX0NPTlRST0xMRVI9eQpDT05GSUdfUkVTRVRfQ09O
VFJPTExFUj15CiMgQ09ORklHX1JFU0VUX0FUSDc5IGlzIG5vdCBzZXQKIyBDT05GSUdfUkVTRVRf
QVhTMTBYIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVTRVRfQkNNNjM0NSBpcyBub3Qgc2V0CiMgQ09O
RklHX1JFU0VUX0JFUkxJTiBpcyBub3Qgc2V0CiMgQ09ORklHX1JFU0VUX0JSQ01TVEIgaXMgbm90
IHNldAojIENPTkZJR19SRVNFVF9CUkNNU1RCX1JFU0NBTCBpcyBub3Qgc2V0CiMgQ09ORklHX1JF
U0VUX0hTREsgaXMgbm90IHNldAojIENPTkZJR19SRVNFVF9JTVg3IGlzIG5vdCBzZXQKIyBDT05G
SUdfUkVTRVRfSU5URUxfR1cgaXMgbm90IHNldAojIENPTkZJR19SRVNFVF9LMjEwIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUkVTRVRfTEFOVElRIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVTRVRfTFBDMThY
WCBpcyBub3Qgc2V0CiMgQ09ORklHX1JFU0VUX01DSFBfU1BBUlg1IGlzIG5vdCBzZXQKQ09ORklH
X1JFU0VUX01FU09OPXkKIyBDT05GSUdfUkVTRVRfTUVTT05fQVVESU9fQVJCIGlzIG5vdCBzZXQK
Q09ORklHX1JFU0VUX05QQ009eQojIENPTkZJR19SRVNFVF9QSVNUQUNISU8gaXMgbm90IHNldApD
T05GSUdfUkVTRVRfUUNPTV9BT1NTPXkKQ09ORklHX1JFU0VUX1FDT01fUERDPXkKIyBDT05GSUdf
UkVTRVRfUkFTUEJFUlJZUEkgaXMgbm90IHNldAojIENPTkZJR19SRVNFVF9SWkcyTF9VU0JQSFlf
Q1RSTCBpcyBub3Qgc2V0CkNPTkZJR19SRVNFVF9TQ01JPXkKQ09ORklHX1JFU0VUX1NJTVBMRT15
CkNPTkZJR19SRVNFVF9TT0NGUEdBPXkKIyBDT05GSUdfUkVTRVRfU1RBUkZJVkVfSkg3MTAwIGlz
IG5vdCBzZXQKQ09ORklHX1JFU0VUX1NVTlhJPXkKIyBDT05GSUdfUkVTRVRfVElfU1lTQ09OIGlz
IG5vdCBzZXQKIyBDT05GSUdfUkVTRVRfVE40OE1fQ1BMRCBpcyBub3Qgc2V0CiMgQ09ORklHX1JF
U0VUX1VOSVBISUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVTRVRfVU5JUEhJRVJfR0xVRSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1JFU0VUX1pZTlEgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fUkVT
RVRfSEkzNjYwIGlzIG5vdCBzZXQKQ09ORklHX0NPTU1PTl9SRVNFVF9ISTYyMjA9eQoKIwojIFBI
WSBTdWJzeXN0ZW0KIwpDT05GSUdfR0VORVJJQ19QSFk9eQpDT05GSUdfR0VORVJJQ19QSFlfTUlQ
SV9EUEhZPXkKIyBDT05GSUdfUEhZX0xQQzE4WFhfVVNCX09URyBpcyBub3Qgc2V0CiMgQ09ORklH
X1BIWV9QSVNUQUNISU9fVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX1hHRU5FIGlzIG5vdCBz
ZXQKQ09ORklHX1BIWV9DQU5fVFJBTlNDRUlWRVI9eQojIENPTkZJR19QSFlfU1VONklfTUlQSV9E
UEhZIGlzIG5vdCBzZXQKQ09ORklHX1BIWV9TVU41MElfVVNCMz15CkNPTkZJR19QSFlfTUVTT044
X0hETUlfVFg9eQpDT05GSUdfUEhZX01FU09OX0cxMkFfVVNCMj15CiMgQ09ORklHX1BIWV9NRVNP
Tl9HMTJBX1VTQjNfUENJRSBpcyBub3Qgc2V0CkNPTkZJR19QSFlfTUVTT05fQVhHX1BDSUU9eQpD
T05GSUdfUEhZX01FU09OX0FYR19NSVBJX1BDSUVfQU5BTE9HPXkKIyBDT05GSUdfUEhZX01FU09O
X0FYR19NSVBJX0RQSFkgaXMgbm90IHNldAoKIwojIFBIWSBkcml2ZXJzIGZvciBCcm9hZGNvbSBw
bGF0Zm9ybXMKIwojIENPTkZJR19QSFlfQkNNNjNYWF9VU0JIIGlzIG5vdCBzZXQKIyBDT05GSUdf
UEhZX0NZR05VU19QQ0lFIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX0JDTV9TUl9VU0IgaXMgbm90
IHNldAojIENPTkZJR19CQ01fS09OQV9VU0IyX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9C
Q01fTlNfVVNCMiBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9OUzJfVVNCX0RSRCBpcyBub3Qgc2V0
CiMgQ09ORklHX1BIWV9CUkNNX1NBVEEgaXMgbm90IHNldAojIENPTkZJR19QSFlfQlJDTV9VU0Ig
aXMgbm90IHNldAojIENPTkZJR19QSFlfQkNNX1NSX1BDSUUgaXMgbm90IHNldAojIGVuZCBvZiBQ
SFkgZHJpdmVycyBmb3IgQnJvYWRjb20gcGxhdGZvcm1zCgpDT05GSUdfUEhZX0NBREVOQ0VfVE9S
UkVOVD15CiMgQ09ORklHX1BIWV9DQURFTkNFX0RQSFkgaXMgbm90IHNldApDT05GSUdfUEhZX0NB
REVOQ0VfRFBIWV9SWD15CkNPTkZJR19QSFlfQ0FERU5DRV9TSUVSUkE9eQpDT05GSUdfUEhZX0NB
REVOQ0VfU0FMVk89eQojIENPTkZJR19QSFlfRlNMX0lNWDhNUV9VU0IgaXMgbm90IHNldAojIENP
TkZJR19QSFlfTUlYRUxfTUlQSV9EUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX0ZTTF9JTVg4
TV9QQ0lFIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX0ZTTF9MWU5YXzI4RyBpcyBub3Qgc2V0CiMg
Q09ORklHX1BIWV9ISTYyMjBfVVNCIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX0hJMzY2MF9VU0Ig
aXMgbm90IHNldAojIENPTkZJR19QSFlfSEkzNjcwX1VTQiBpcyBub3Qgc2V0CiMgQ09ORklHX1BI
WV9ISTM2NzBfUENJRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9ISVNUQl9DT01CUEhZIGlzIG5v
dCBzZXQKIyBDT05GSUdfUEhZX0hJU0lfSU5OT19VU0IyIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZ
X0xBTlRJUV9WUlgyMDBfUENJRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9MQU5USVFfUkNVX1VT
QjIgaXMgbm90IHNldAojIENPTkZJR19BUk1BREEzNzVfVVNCQ0xVU1RFUl9QSFkgaXMgbm90IHNl
dApDT05GSUdfUEhZX0JFUkxJTl9TQVRBPXkKQ09ORklHX1BIWV9CRVJMSU5fVVNCPXkKQ09ORklH
X1BIWV9NVkVCVV9BMzcwMF9DT01QSFk9eQpDT05GSUdfUEhZX01WRUJVX0EzNzAwX1VUTUk9eQoj
IENPTkZJR19QSFlfTVZFQlVfQTM4WF9DT01QSFkgaXMgbm90IHNldAojIENPTkZJR19QSFlfTVZF
QlVfQ1AxMTBfQ09NUEhZIGlzIG5vdCBzZXQKQ09ORklHX1BIWV9NVkVCVV9TQVRBPXkKQ09ORklH
X1BIWV9QWEFfMjhOTV9IU0lDPXkKQ09ORklHX1BIWV9QWEFfMjhOTV9VU0IyPXkKIyBDT05GSUdf
UEhZX1BYQV9VU0IgaXMgbm90IHNldAojIENPTkZJR19QSFlfTU1QM19VU0IgaXMgbm90IHNldAoj
IENPTkZJR19QSFlfTU1QM19IU0lDIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX01US19UUEhZIGlz
IG5vdCBzZXQKIyBDT05GSUdfUEhZX01US19VRlMgaXMgbm90IHNldAojIENPTkZJR19QSFlfTVRL
X1hTUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX01US19IRE1JIGlzIG5vdCBzZXQKIyBDT05G
SUdfUEhZX01US19NSVBJX0RTSSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9TUEFSWDVfU0VSREVT
IGlzIG5vdCBzZXQKQ09ORklHX1BIWV9MQU45NjZYX1NFUkRFUz15CkNPTkZJR19QSFlfT0NFTE9U
X1NFUkRFUz15CiMgQ09ORklHX1BIWV9BVEg3OV9VU0IgaXMgbm90IHNldAojIENPTkZJR19QSFlf
UUNPTV9BUFE4MDY0X1NBVEEgaXMgbm90IHNldApDT05GSUdfUEhZX1FDT01fRURQPXkKIyBDT05G
SUdfUEhZX1FDT01fSVBRNDAxOV9VU0IgaXMgbm90IHNldApDT05GSUdfUEhZX1FDT01fSVBRODA2
WF9TQVRBPXkKQ09ORklHX1BIWV9RQ09NX1BDSUUyPXkKQ09ORklHX1BIWV9RQ09NX1FNUD15CkNP
TkZJR19QSFlfUUNPTV9RVVNCMj15CkNPTkZJR19QSFlfUUNPTV9VU0JfU05QU19GRU1UT19WMj15
CkNPTkZJR19QSFlfUUNPTV9VU0JfSFNfMjhOTT15CiMgQ09ORklHX1BIWV9RQ09NX1VTQl9TUyBp
cyBub3Qgc2V0CkNPTkZJR19QSFlfUUNPTV9JUFE4MDZYX1VTQj15CiMgQ09ORklHX1BIWV9NVDc2
MjFfUENJIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX1JBTElOS19VU0IgaXMgbm90IHNldAojIENP
TkZJR19QSFlfUkNBUl9HRU4yIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX1JDQVJfR0VOM19QQ0lF
IGlzIG5vdCBzZXQKQ09ORklHX1BIWV9SQ0FSX0dFTjNfVVNCMz15CiMgQ09ORklHX1BIWV9ST0NL
Q0hJUF9EUEhZX1JYMCBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9ST0NLQ0hJUF9JTk5PX0hETUkg
aXMgbm90IHNldAojIENPTkZJR19QSFlfUk9DS0NISVBfSU5OT19DU0lEUEhZIGlzIG5vdCBzZXQK
IyBDT05GSUdfUEhZX1JPQ0tDSElQX0lOTk9fRFNJRFBIWSBpcyBub3Qgc2V0CiMgQ09ORklHX1BI
WV9ST0NLQ0hJUF9QQ0lFIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX1JPQ0tDSElQX1RZUEVDIGlz
IG5vdCBzZXQKQ09ORklHX1BIWV9FWFlOT1NfRFBfVklERU89eQpDT05GSUdfUEhZX0VYWU5PU19N
SVBJX1ZJREVPPXkKQ09ORklHX1BIWV9FWFlOT1NfUENJRT15CkNPTkZJR19QSFlfU0FNU1VOR19V
RlM9eQpDT05GSUdfUEhZX1NBTVNVTkdfVVNCMj15CkNPTkZJR19QSFlfRVhZTk9TNFgxMl9VU0Iy
PXkKQ09ORklHX1BIWV9FWFlOT1M1MjUwX1VTQjI9eQojIENPTkZJR19QSFlfUzVQVjIxMF9VU0Iy
IGlzIG5vdCBzZXQKQ09ORklHX1BIWV9FWFlOT1M1MjUwX1NBVEE9eQojIENPTkZJR19QSFlfVU5J
UEhJRVJfVVNCMiBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9VTklQSElFUl9VU0IzIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUEhZX1VOSVBISUVSX1BDSUUgaXMgbm90IHNldAojIENPTkZJR19QSFlfVU5J
UEhJRVJfQUhDSSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9TVF9TUEVBUjEzMTBfTUlQSFkgaXMg
bm90IHNldAojIENPTkZJR19QSFlfU1RfU1BFQVIxMzQwX01JUEhZIGlzIG5vdCBzZXQKIyBDT05G
SUdfUEhZX1NUSUg0MDdfVVNCIGlzIG5vdCBzZXQKQ09ORklHX1BIWV9TVE0zMl9VU0JQSFlDPXkK
IyBDT05GSUdfUEhZX1RFR1JBMTk0X1AyVSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9EQThYWF9V
U0IgaXMgbm90IHNldAojIENPTkZJR19QSFlfQU02NTRfU0VSREVTIGlzIG5vdCBzZXQKIyBDT05G
SUdfUEhZX0o3MjFFX1dJWiBpcyBub3Qgc2V0CkNPTkZJR19PTUFQX0NPTlRST0xfUEhZPXkKQ09O
RklHX1RJX1BJUEUzPXkKIyBDT05GSUdfUEhZX0lOVEVMX0tFRU1CQVlfRU1NQyBpcyBub3Qgc2V0
CiMgQ09ORklHX1BIWV9JTlRFTF9LRUVNQkFZX1VTQiBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9J
TlRFTF9MR01fQ09NQk8gaXMgbm90IHNldAojIENPTkZJR19QSFlfSU5URUxfTEdNX0VNTUMgaXMg
bm90IHNldAojIENPTkZJR19QSFlfSU5URUxfVEhVTkRFUkJBWV9FTU1DIGlzIG5vdCBzZXQKIyBD
T05GSUdfUEhZX1hJTElOWF9aWU5RTVAgaXMgbm90IHNldAojIGVuZCBvZiBQSFkgU3Vic3lzdGVt
CgpDT05GSUdfUE9XRVJDQVA9eQpDT05GSUdfSURMRV9JTkpFQ1Q9eQojIENPTkZJR19EVFBNIGlz
IG5vdCBzZXQKQ09ORklHX01DQj15CkNPTkZJR19NQ0JfUENJPXkKQ09ORklHX01DQl9MUEM9eQoK
IwojIFBlcmZvcm1hbmNlIG1vbml0b3Igc3VwcG9ydAojCkNPTkZJR19BUk1fQ0NJX1BNVT15CkNP
TkZJR19BUk1fQ0NJNDAwX1BNVT15CkNPTkZJR19BUk1fQ0NJNXh4X1BNVT15CiMgQ09ORklHX0FS
TV9DQ04gaXMgbm90IHNldAojIENPTkZJR19BUk1fQ01OIGlzIG5vdCBzZXQKQ09ORklHX0FSTV9Q
TVU9eQojIENPTkZJR19GU0xfSU1YOF9ERFJfUE1VIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJNX0RN
QzYyMF9QTVUgaXMgbm90IHNldAojIGVuZCBvZiBQZXJmb3JtYW5jZSBtb25pdG9yIHN1cHBvcnQK
CkNPTkZJR19SQVM9eQpDT05GSUdfVVNCND15CkNPTkZJR19VU0I0X0RFQlVHRlNfV1JJVEU9eQoj
IENPTkZJR19VU0I0X0RNQV9URVNUIGlzIG5vdCBzZXQKCiMKIyBBbmRyb2lkCiMKIyBDT05GSUdf
QU5EUk9JRCBpcyBub3Qgc2V0CiMgZW5kIG9mIEFuZHJvaWQKCiMgQ09ORklHX0RBWCBpcyBub3Qg
c2V0CkNPTkZJR19OVk1FTT15CkNPTkZJR19OVk1FTV9TWVNGUz15CiMgQ09ORklHX05WTUVNX0lN
WF9JSU0gaXMgbm90IHNldAojIENPTkZJR19OVk1FTV9JTVhfT0NPVFAgaXMgbm90IHNldAojIENP
TkZJR19KWjQ3ODBfRUZVU0UgaXMgbm90IHNldAojIENPTkZJR19OVk1FTV9MUEMxOFhYX0VFUFJP
TSBpcyBub3Qgc2V0CiMgQ09ORklHX05WTUVNX0xQQzE4WFhfT1RQIGlzIG5vdCBzZXQKIyBDT05G
SUdfTlZNRU1fTVhTX09DT1RQIGlzIG5vdCBzZXQKIyBDT05GSUdfTVRLX0VGVVNFIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTlZNRU1fTklOVEVORE9fT1RQIGlzIG5vdCBzZXQKQ09ORklHX1FDT01fUUZQ
Uk9NPXkKIyBDT05GSUdfTlZNRU1fU1BNSV9TREFNIGlzIG5vdCBzZXQKIyBDT05GSUdfUk9DS0NI
SVBfRUZVU0UgaXMgbm90IHNldAojIENPTkZJR19ST0NLQ0hJUF9PVFAgaXMgbm90IHNldAojIENP
TkZJR19OVk1FTV9CQ01fT0NPVFAgaXMgbm90IHNldApDT05GSUdfTlZNRU1fU1RNMzJfUk9NRU09
eQpDT05GSUdfTlZNRU1fU1VOWElfU0lEPXkKIyBDT05GSUdfVU5JUEhJRVJfRUZVU0UgaXMgbm90
IHNldAojIENPTkZJR19OVk1FTV9WRjYxMF9PQ09UUCBpcyBub3Qgc2V0CkNPTkZJR19NRVNPTl9N
WF9FRlVTRT15CiMgQ09ORklHX05WTUVNX1NOVlNfTFBHUFIgaXMgbm90IHNldAojIENPTkZJR19T
QzI3WFhfRUZVU0UgaXMgbm90IHNldAojIENPTkZJR19TUFJEX0VGVVNFIGlzIG5vdCBzZXQKIyBD
T05GSUdfTlZNRU1fUk1FTSBpcyBub3Qgc2V0CiMgQ09ORklHX05WTUVNX0JSQ01fTlZSQU0gaXMg
bm90IHNldAojIENPTkZJR19OVk1FTV9MQVlFUlNDQVBFX1NGUCBpcyBub3Qgc2V0CiMgQ09ORklH
X05WTUVNX1NVTlBMVVNfT0NPVFAgaXMgbm90IHNldAoKIwojIEhXIHRyYWNpbmcgc3VwcG9ydAoj
CkNPTkZJR19TVE09eQpDT05GSUdfU1RNX1BST1RPX0JBU0lDPXkKQ09ORklHX1NUTV9QUk9UT19T
WVNfVD15CkNPTkZJR19TVE1fRFVNTVk9eQojIENPTkZJR19TVE1fU09VUkNFX0NPTlNPTEUgaXMg
bm90IHNldAojIENPTkZJR19TVE1fU09VUkNFX0hFQVJUQkVBVCBpcyBub3Qgc2V0CkNPTkZJR19T
VE1fU09VUkNFX0ZUUkFDRT15CkNPTkZJR19JTlRFTF9USD15CkNPTkZJR19JTlRFTF9USF9QQ0k9
eQpDT05GSUdfSU5URUxfVEhfR1RIPXkKQ09ORklHX0lOVEVMX1RIX1NUSD15CiMgQ09ORklHX0lO
VEVMX1RIX01TVSBpcyBub3Qgc2V0CkNPTkZJR19JTlRFTF9USF9QVEk9eQpDT05GSUdfSU5URUxf
VEhfREVCVUc9eQojIGVuZCBvZiBIVyB0cmFjaW5nIHN1cHBvcnQKCiMgQ09ORklHX0ZQR0EgaXMg
bm90IHNldApDT05GSUdfRlNJPXkKQ09ORklHX0ZTSV9ORVdfREVWX05PREU9eQojIENPTkZJR19G
U0lfTUFTVEVSX0dQSU8gaXMgbm90IHNldApDT05GSUdfRlNJX01BU1RFUl9IVUI9eQojIENPTkZJ
R19GU0lfTUFTVEVSX0FTUEVFRCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZTSV9TQ09NIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRlNJX1NCRUZJRk8gaXMgbm90IHNldApDT05GSUdfVEVFPXkKCiMKIyBURUUg
ZHJpdmVycwojCkNPTkZJR19PUFRFRT15CiMgZW5kIG9mIFRFRSBkcml2ZXJzCgpDT05GSUdfTVVM
VElQTEVYRVI9eQoKIwojIE11bHRpcGxleGVyIGRyaXZlcnMKIwojIENPTkZJR19NVVhfQURHNzky
QSBpcyBub3Qgc2V0CiMgQ09ORklHX01VWF9HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfTVVYX01N
SU8gaXMgbm90IHNldAojIGVuZCBvZiBNdWx0aXBsZXhlciBkcml2ZXJzCgpDT05GSUdfUE1fT1BQ
PXkKQ09ORklHX1NJT1g9eQojIENPTkZJR19TSU9YX0JVU19HUElPIGlzIG5vdCBzZXQKQ09ORklH
X1NMSU1CVVM9eQojIENPTkZJR19TTElNX1FDT01fQ1RSTCBpcyBub3Qgc2V0CkNPTkZJR19JTlRF
UkNPTk5FQ1Q9eQojIENPTkZJR19JTlRFUkNPTk5FQ1RfSU1YIGlzIG5vdCBzZXQKIyBDT05GSUdf
SU5URVJDT05ORUNUX1FDT00gaXMgbm90IHNldAojIENPTkZJR19JTlRFUkNPTk5FQ1RfUUNPTV9P
U01fTDMgaXMgbm90IHNldApDT05GSUdfSU5URVJDT05ORUNUX1NBTVNVTkc9eQojIENPTkZJR19J
TlRFUkNPTk5FQ1RfRVhZTk9TIGlzIG5vdCBzZXQKQ09ORklHX0NPVU5URVI9eQojIENPTkZJR18x
MDRfUVVBRF84IGlzIG5vdCBzZXQKQ09ORklHX0lOVEVSUlVQVF9DTlQ9eQpDT05GSUdfU1RNMzJf
VElNRVJfQ05UPXkKIyBDT05GSUdfU1RNMzJfTFBUSU1FUl9DTlQgaXMgbm90IHNldAojIENPTkZJ
R19USV9FUUVQIGlzIG5vdCBzZXQKIyBDT05GSUdfRlRNX1FVQURERUMgaXMgbm90IHNldApDT05G
SUdfTUlDUk9DSElQX1RDQl9DQVBUVVJFPXkKIyBDT05GSUdfSU5URUxfUUVQIGlzIG5vdCBzZXQK
Q09ORklHX01PU1Q9eQpDT05GSUdfTU9TVF9DREVWPXkKQ09ORklHX1BFQ0k9eQpDT05GSUdfUEVD
SV9DUFU9eQojIENPTkZJR19QRUNJX0FTUEVFRCBpcyBub3Qgc2V0CiMgZW5kIG9mIERldmljZSBE
cml2ZXJzCgojCiMgRmlsZSBzeXN0ZW1zCiMKQ09ORklHX0RDQUNIRV9XT1JEX0FDQ0VTUz15CkNP
TkZJR19WQUxJREFURV9GU19QQVJTRVI9eQpDT05GSUdfRlNfSU9NQVA9eQojIENPTkZJR19FWFQy
X0ZTIGlzIG5vdCBzZXQKQ09ORklHX0VYVDNfRlM9eQpDT05GSUdfRVhUM19GU19QT1NJWF9BQ0w9
eQpDT05GSUdfRVhUM19GU19TRUNVUklUWT15CkNPTkZJR19FWFQ0X0ZTPXkKQ09ORklHX0VYVDRf
VVNFX0ZPUl9FWFQyPXkKQ09ORklHX0VYVDRfRlNfUE9TSVhfQUNMPXkKQ09ORklHX0VYVDRfRlNf
U0VDVVJJVFk9eQpDT05GSUdfRVhUNF9ERUJVRz15CkNPTkZJR19KQkQyPXkKIyBDT05GSUdfSkJE
Ml9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19GU19NQkNBQ0hFPXkKQ09ORklHX1JFSVNFUkZTX0ZT
PXkKQ09ORklHX1JFSVNFUkZTX0NIRUNLPXkKIyBDT05GSUdfUkVJU0VSRlNfUFJPQ19JTkZPIGlz
IG5vdCBzZXQKIyBDT05GSUdfUkVJU0VSRlNfRlNfWEFUVFIgaXMgbm90IHNldApDT05GSUdfSkZT
X0ZTPXkKQ09ORklHX0pGU19QT1NJWF9BQ0w9eQpDT05GSUdfSkZTX1NFQ1VSSVRZPXkKQ09ORklH
X0pGU19ERUJVRz15CiMgQ09ORklHX0pGU19TVEFUSVNUSUNTIGlzIG5vdCBzZXQKQ09ORklHX1hG
U19GUz15CiMgQ09ORklHX1hGU19TVVBQT1JUX1Y0IGlzIG5vdCBzZXQKQ09ORklHX1hGU19RVU9U
QT15CiMgQ09ORklHX1hGU19QT1NJWF9BQ0wgaXMgbm90IHNldApDT05GSUdfWEZTX1JUPXkKQ09O
RklHX1hGU19PTkxJTkVfU0NSVUI9eQojIENPTkZJR19YRlNfT05MSU5FX1JFUEFJUiBpcyBub3Qg
c2V0CiMgQ09ORklHX1hGU19XQVJOIGlzIG5vdCBzZXQKIyBDT05GSUdfWEZTX0RFQlVHIGlzIG5v
dCBzZXQKIyBDT05GSUdfR0ZTMl9GUyBpcyBub3Qgc2V0CkNPTkZJR19CVFJGU19GUz15CiMgQ09O
RklHX0JUUkZTX0ZTX1BPU0lYX0FDTCBpcyBub3Qgc2V0CkNPTkZJR19CVFJGU19GU19DSEVDS19J
TlRFR1JJVFk9eQojIENPTkZJR19CVFJGU19GU19SVU5fU0FOSVRZX1RFU1RTIGlzIG5vdCBzZXQK
Q09ORklHX0JUUkZTX0RFQlVHPXkKQ09ORklHX0JUUkZTX0FTU0VSVD15CiMgQ09ORklHX0JUUkZT
X0ZTX1JFRl9WRVJJRlkgaXMgbm90IHNldAojIENPTkZJR19OSUxGUzJfRlMgaXMgbm90IHNldApD
T05GSUdfRjJGU19GUz15CkNPTkZJR19GMkZTX1NUQVRfRlM9eQpDT05GSUdfRjJGU19GU19YQVRU
Uj15CkNPTkZJR19GMkZTX0ZTX1BPU0lYX0FDTD15CiMgQ09ORklHX0YyRlNfRlNfU0VDVVJJVFkg
aXMgbm90IHNldAojIENPTkZJR19GMkZTX0NIRUNLX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfRjJG
U19GQVVMVF9JTkpFQ1RJT04gaXMgbm90IHNldAojIENPTkZJR19GMkZTX0ZTX0NPTVBSRVNTSU9O
IGlzIG5vdCBzZXQKIyBDT05GSUdfRjJGU19JT1NUQVQgaXMgbm90IHNldApDT05GSUdfWk9ORUZT
X0ZTPXkKQ09ORklHX0ZTX1BPU0lYX0FDTD15CkNPTkZJR19FWFBPUlRGUz15CkNPTkZJR19FWFBP
UlRGU19CTE9DS19PUFM9eQpDT05GSUdfRklMRV9MT0NLSU5HPXkKQ09ORklHX0ZTX0VOQ1JZUFRJ
T049eQpDT05GSUdfRlNfRU5DUllQVElPTl9BTEdTPXkKIyBDT05GSUdfRlNfVkVSSVRZIGlzIG5v
dCBzZXQKQ09ORklHX0ZTTk9USUZZPXkKQ09ORklHX0ROT1RJRlk9eQojIENPTkZJR19JTk9USUZZ
X1VTRVIgaXMgbm90IHNldApDT05GSUdfRkFOT1RJRlk9eQpDT05GSUdfRkFOT1RJRllfQUNDRVNT
X1BFUk1JU1NJT05TPXkKIyBDT05GSUdfUVVPVEEgaXMgbm90IHNldApDT05GSUdfUVVPVEFDVEw9
eQpDT05GSUdfQVVUT0ZTNF9GUz15CkNPTkZJR19BVVRPRlNfRlM9eQpDT05GSUdfRlVTRV9GUz15
CiMgQ09ORklHX0NVU0UgaXMgbm90IHNldApDT05GSUdfVklSVElPX0ZTPXkKQ09ORklHX09WRVJM
QVlfRlM9eQojIENPTkZJR19PVkVSTEFZX0ZTX1JFRElSRUNUX0RJUiBpcyBub3Qgc2V0CkNPTkZJ
R19PVkVSTEFZX0ZTX1JFRElSRUNUX0FMV0FZU19GT0xMT1c9eQojIENPTkZJR19PVkVSTEFZX0ZT
X0lOREVYIGlzIG5vdCBzZXQKIyBDT05GSUdfT1ZFUkxBWV9GU19NRVRBQ09QWSBpcyBub3Qgc2V0
CgojCiMgQ2FjaGVzCiMKQ09ORklHX05FVEZTX1NVUFBPUlQ9eQpDT05GSUdfTkVURlNfU1RBVFM9
eQpDT05GSUdfRlNDQUNIRT15CiMgQ09ORklHX0ZTQ0FDSEVfU1RBVFMgaXMgbm90IHNldAojIENP
TkZJR19GU0NBQ0hFX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX0NBQ0hFRklMRVM9eQojIENPTkZJ
R19DQUNIRUZJTEVTX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FDSEVGSUxFU19FUlJPUl9J
TkpFQ1RJT04gaXMgbm90IHNldAojIGVuZCBvZiBDYWNoZXMKCiMKIyBDRC1ST00vRFZEIEZpbGVz
eXN0ZW1zCiMKQ09ORklHX0lTTzk2NjBfRlM9eQpDT05GSUdfSk9MSUVUPXkKIyBDT05GSUdfWklT
T0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfVURGX0ZTIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ0QtUk9N
L0RWRCBGaWxlc3lzdGVtcwoKIwojIERPUy9GQVQvRVhGQVQvTlQgRmlsZXN5c3RlbXMKIwpDT05G
SUdfRkFUX0ZTPXkKIyBDT05GSUdfTVNET1NfRlMgaXMgbm90IHNldApDT05GSUdfVkZBVF9GUz15
CkNPTkZJR19GQVRfREVGQVVMVF9DT0RFUEFHRT00MzcKQ09ORklHX0ZBVF9ERUZBVUxUX0lPQ0hB
UlNFVD0iaXNvODg1OS0xIgpDT05GSUdfRkFUX0RFRkFVTFRfVVRGOD15CiMgQ09ORklHX0VYRkFU
X0ZTIGlzIG5vdCBzZXQKQ09ORklHX05URlNfRlM9eQojIENPTkZJR19OVEZTX0RFQlVHIGlzIG5v
dCBzZXQKIyBDT05GSUdfTlRGU19SVyBpcyBub3Qgc2V0CkNPTkZJR19OVEZTM19GUz15CkNPTkZJ
R19OVEZTM19MWlhfWFBSRVNTPXkKQ09ORklHX05URlMzX0ZTX1BPU0lYX0FDTD15CiMgZW5kIG9m
IERPUy9GQVQvRVhGQVQvTlQgRmlsZXN5c3RlbXMKCiMKIyBQc2V1ZG8gZmlsZXN5c3RlbXMKIwpD
T05GSUdfUFJPQ19GUz15CkNPTkZJR19QUk9DX1NZU0NUTD15CkNPTkZJR19QUk9DX1BBR0VfTU9O
SVRPUj15CkNPTkZJR19QUk9DX0NISUxEUkVOPXkKQ09ORklHX0tFUk5GUz15CkNPTkZJR19TWVNG
Uz15CiMgQ09ORklHX1RNUEZTIGlzIG5vdCBzZXQKQ09ORklHX0NPTkZJR0ZTX0ZTPXkKIyBlbmQg
b2YgUHNldWRvIGZpbGVzeXN0ZW1zCgpDT05GSUdfTUlTQ19GSUxFU1lTVEVNUz15CiMgQ09ORklH
X09SQU5HRUZTX0ZTIGlzIG5vdCBzZXQKQ09ORklHX0FERlNfRlM9eQojIENPTkZJR19BREZTX0ZT
X1JXIGlzIG5vdCBzZXQKIyBDT05GSUdfQUZGU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX0VDUllQ
VF9GUyBpcyBub3Qgc2V0CkNPTkZJR19IRlNfRlM9eQojIENPTkZJR19IRlNQTFVTX0ZTIGlzIG5v
dCBzZXQKQ09ORklHX0JFRlNfRlM9eQpDT05GSUdfQkVGU19ERUJVRz15CiMgQ09ORklHX0JGU19G
UyBpcyBub3Qgc2V0CkNPTkZJR19FRlNfRlM9eQpDT05GSUdfSkZGUzJfRlM9eQpDT05GSUdfSkZG
UzJfRlNfREVCVUc9MAojIENPTkZJR19KRkZTMl9GU19XUklURUJVRkZFUiBpcyBub3Qgc2V0CkNP
TkZJR19KRkZTMl9TVU1NQVJZPXkKIyBDT05GSUdfSkZGUzJfRlNfWEFUVFIgaXMgbm90IHNldApD
T05GSUdfSkZGUzJfQ09NUFJFU1NJT05fT1BUSU9OUz15CiMgQ09ORklHX0pGRlMyX1pMSUIgaXMg
bm90IHNldAojIENPTkZJR19KRkZTMl9MWk8gaXMgbm90IHNldAojIENPTkZJR19KRkZTMl9SVElN
RSBpcyBub3Qgc2V0CiMgQ09ORklHX0pGRlMyX1JVQklOIGlzIG5vdCBzZXQKQ09ORklHX0pGRlMy
X0NNT0RFX05PTkU9eQojIENPTkZJR19KRkZTMl9DTU9ERV9QUklPUklUWSBpcyBub3Qgc2V0CiMg
Q09ORklHX0pGRlMyX0NNT0RFX1NJWkUgaXMgbm90IHNldAojIENPTkZJR19KRkZTMl9DTU9ERV9G
QVZPVVJMWk8gaXMgbm90IHNldApDT05GSUdfVUJJRlNfRlM9eQojIENPTkZJR19VQklGU19GU19B
RFZBTkNFRF9DT01QUiBpcyBub3Qgc2V0CkNPTkZJR19VQklGU19GU19MWk89eQpDT05GSUdfVUJJ
RlNfRlNfWkxJQj15CkNPTkZJR19VQklGU19GU19aU1REPXkKQ09ORklHX1VCSUZTX0FUSU1FX1NV
UFBPUlQ9eQpDT05GSUdfVUJJRlNfRlNfWEFUVFI9eQpDT05GSUdfVUJJRlNfRlNfU0VDVVJJVFk9
eQojIENPTkZJR19VQklGU19GU19BVVRIRU5USUNBVElPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0NS
QU1GUyBpcyBub3Qgc2V0CkNPTkZJR19TUVVBU0hGUz15CiMgQ09ORklHX1NRVUFTSEZTX0ZJTEVf
Q0FDSEUgaXMgbm90IHNldApDT05GSUdfU1FVQVNIRlNfRklMRV9ESVJFQ1Q9eQojIENPTkZJR19T
UVVBU0hGU19ERUNPTVBfU0lOR0xFIGlzIG5vdCBzZXQKQ09ORklHX1NRVUFTSEZTX0RFQ09NUF9N
VUxUST15CiMgQ09ORklHX1NRVUFTSEZTX0RFQ09NUF9NVUxUSV9QRVJDUFUgaXMgbm90IHNldApD
T05GSUdfU1FVQVNIRlNfWEFUVFI9eQojIENPTkZJR19TUVVBU0hGU19aTElCIGlzIG5vdCBzZXQK
IyBDT05GSUdfU1FVQVNIRlNfTFo0IGlzIG5vdCBzZXQKQ09ORklHX1NRVUFTSEZTX0xaTz15CiMg
Q09ORklHX1NRVUFTSEZTX1haIGlzIG5vdCBzZXQKQ09ORklHX1NRVUFTSEZTX1pTVEQ9eQpDT05G
SUdfU1FVQVNIRlNfNEtfREVWQkxLX1NJWkU9eQojIENPTkZJR19TUVVBU0hGU19FTUJFRERFRCBp
cyBub3Qgc2V0CkNPTkZJR19TUVVBU0hGU19GUkFHTUVOVF9DQUNIRV9TSVpFPTMKQ09ORklHX1ZY
RlNfRlM9eQpDT05GSUdfTUlOSVhfRlM9eQpDT05GSUdfT01GU19GUz15CiMgQ09ORklHX0hQRlNf
RlMgaXMgbm90IHNldApDT05GSUdfUU5YNEZTX0ZTPXkKQ09ORklHX1FOWDZGU19GUz15CkNPTkZJ
R19RTlg2RlNfREVCVUc9eQpDT05GSUdfUk9NRlNfRlM9eQojIENPTkZJR19ST01GU19CQUNLRURf
QllfQkxPQ0sgaXMgbm90IHNldAojIENPTkZJR19ST01GU19CQUNLRURfQllfTVREIGlzIG5vdCBz
ZXQKQ09ORklHX1JPTUZTX0JBQ0tFRF9CWV9CT1RIPXkKQ09ORklHX1JPTUZTX09OX0JMT0NLPXkK
Q09ORklHX1JPTUZTX09OX01URD15CkNPTkZJR19QU1RPUkU9eQpDT05GSUdfUFNUT1JFX0RFRkFV
TFRfS01TR19CWVRFUz0xMDI0MAojIENPTkZJR19QU1RPUkVfREVGTEFURV9DT01QUkVTUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1BTVE9SRV9MWk9fQ09NUFJFU1MgaXMgbm90IHNldAojIENPTkZJR19Q
U1RPUkVfTFo0X0NPTVBSRVNTIGlzIG5vdCBzZXQKQ09ORklHX1BTVE9SRV9MWjRIQ19DT01QUkVT
Uz15CiMgQ09ORklHX1BTVE9SRV84NDJfQ09NUFJFU1MgaXMgbm90IHNldApDT05GSUdfUFNUT1JF
X1pTVERfQ09NUFJFU1M9eQpDT05GSUdfUFNUT1JFX0NPTVBSRVNTPXkKQ09ORklHX1BTVE9SRV9M
WjRIQ19DT01QUkVTU19ERUZBVUxUPXkKIyBDT05GSUdfUFNUT1JFX1pTVERfQ09NUFJFU1NfREVG
QVVMVCBpcyBub3Qgc2V0CkNPTkZJR19QU1RPUkVfQ09NUFJFU1NfREVGQVVMVD0ibHo0aGMiCkNP
TkZJR19QU1RPUkVfQ09OU09MRT15CiMgQ09ORklHX1BTVE9SRV9QTVNHIGlzIG5vdCBzZXQKQ09O
RklHX1BTVE9SRV9SQU09eQojIENPTkZJR19QU1RPUkVfQkxLIGlzIG5vdCBzZXQKQ09ORklHX1NZ
U1ZfRlM9eQpDT05GSUdfVUZTX0ZTPXkKIyBDT05GSUdfVUZTX0ZTX1dSSVRFIGlzIG5vdCBzZXQK
Q09ORklHX1VGU19ERUJVRz15CkNPTkZJR19FUk9GU19GUz15CiMgQ09ORklHX0VST0ZTX0ZTX0RF
QlVHIGlzIG5vdCBzZXQKQ09ORklHX0VST0ZTX0ZTX1hBVFRSPXkKQ09ORklHX0VST0ZTX0ZTX1BP
U0lYX0FDTD15CiMgQ09ORklHX0VST0ZTX0ZTX1NFQ1VSSVRZIGlzIG5vdCBzZXQKQ09ORklHX0VS
T0ZTX0ZTX1pJUD15CiMgQ09ORklHX0VST0ZTX0ZTX1pJUF9MWk1BIGlzIG5vdCBzZXQKQ09ORklH
X05MUz15CkNPTkZJR19OTFNfREVGQVVMVD0iaXNvODg1OS0xIgojIENPTkZJR19OTFNfQ09ERVBB
R0VfNDM3IGlzIG5vdCBzZXQKQ09ORklHX05MU19DT0RFUEFHRV83Mzc9eQpDT05GSUdfTkxTX0NP
REVQQUdFXzc3NT15CkNPTkZJR19OTFNfQ09ERVBBR0VfODUwPXkKQ09ORklHX05MU19DT0RFUEFH
RV84NTI9eQpDT05GSUdfTkxTX0NPREVQQUdFXzg1NT15CkNPTkZJR19OTFNfQ09ERVBBR0VfODU3
PXkKQ09ORklHX05MU19DT0RFUEFHRV84NjA9eQojIENPTkZJR19OTFNfQ09ERVBBR0VfODYxIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg2MiBpcyBub3Qgc2V0CkNPTkZJR19OTFNf
Q09ERVBBR0VfODYzPXkKQ09ORklHX05MU19DT0RFUEFHRV84NjQ9eQpDT05GSUdfTkxTX0NPREVQ
QUdFXzg2NT15CiMgQ09ORklHX05MU19DT0RFUEFHRV84NjYgaXMgbm90IHNldAojIENPTkZJR19O
TFNfQ09ERVBBR0VfODY5IGlzIG5vdCBzZXQKQ09ORklHX05MU19DT0RFUEFHRV85MzY9eQpDT05G
SUdfTkxTX0NPREVQQUdFXzk1MD15CkNPTkZJR19OTFNfQ09ERVBBR0VfOTMyPXkKQ09ORklHX05M
U19DT0RFUEFHRV85NDk9eQpDT05GSUdfTkxTX0NPREVQQUdFXzg3ND15CiMgQ09ORklHX05MU19J
U084ODU5XzggaXMgbm90IHNldApDT05GSUdfTkxTX0NPREVQQUdFXzEyNTA9eQojIENPTkZJR19O
TFNfQ09ERVBBR0VfMTI1MSBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19BU0NJSSBpcyBub3Qgc2V0
CkNPTkZJR19OTFNfSVNPODg1OV8xPXkKQ09ORklHX05MU19JU084ODU5XzI9eQpDT05GSUdfTkxT
X0lTTzg4NTlfMz15CkNPTkZJR19OTFNfSVNPODg1OV80PXkKQ09ORklHX05MU19JU084ODU5XzU9
eQpDT05GSUdfTkxTX0lTTzg4NTlfNj15CiMgQ09ORklHX05MU19JU084ODU5XzcgaXMgbm90IHNl
dAojIENPTkZJR19OTFNfSVNPODg1OV85IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lTTzg4NTlf
MTMgaXMgbm90IHNldApDT05GSUdfTkxTX0lTTzg4NTlfMTQ9eQojIENPTkZJR19OTFNfSVNPODg1
OV8xNSBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19LT0k4X1IgaXMgbm90IHNldApDT05GSUdfTkxT
X0tPSThfVT15CiMgQ09ORklHX05MU19NQUNfUk9NQU4gaXMgbm90IHNldApDT05GSUdfTkxTX01B
Q19DRUxUSUM9eQpDT05GSUdfTkxTX01BQ19DRU5URVVSTz15CiMgQ09ORklHX05MU19NQUNfQ1JP
QVRJQU4gaXMgbm90IHNldApDT05GSUdfTkxTX01BQ19DWVJJTExJQz15CiMgQ09ORklHX05MU19N
QUNfR0FFTElDIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX01BQ19HUkVFSyBpcyBub3Qgc2V0CkNP
TkZJR19OTFNfTUFDX0lDRUxBTkQ9eQpDT05GSUdfTkxTX01BQ19JTlVJVD15CiMgQ09ORklHX05M
U19NQUNfUk9NQU5JQU4gaXMgbm90IHNldApDT05GSUdfTkxTX01BQ19UVVJLSVNIPXkKIyBDT05G
SUdfTkxTX1VURjggaXMgbm90IHNldAojIENPTkZJR19VTklDT0RFIGlzIG5vdCBzZXQKQ09ORklH
X0lPX1dRPXkKIyBlbmQgb2YgRmlsZSBzeXN0ZW1zCgojCiMgU2VjdXJpdHkgb3B0aW9ucwojCkNP
TkZJR19LRVlTPXkKIyBDT05GSUdfS0VZU19SRVFVRVNUX0NBQ0hFIGlzIG5vdCBzZXQKQ09ORklH
X1BFUlNJU1RFTlRfS0VZUklOR1M9eQojIENPTkZJR19UUlVTVEVEX0tFWVMgaXMgbm90IHNldApD
T05GSUdfRU5DUllQVEVEX0tFWVM9eQpDT05GSUdfVVNFUl9ERUNSWVBURURfREFUQT15CkNPTkZJ
R19LRVlfREhfT1BFUkFUSU9OUz15CkNPTkZJR19TRUNVUklUWV9ETUVTR19SRVNUUklDVD15CkNP
TkZJR19TRUNVUklUWT15CkNPTkZJR19TRUNVUklUWUZTPXkKIyBDT05GSUdfU0VDVVJJVFlfTkVU
V09SSyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFQ1VSSVRZX1BBVEggaXMgbm90IHNldApDT05GSUdf
SEFWRV9IQVJERU5FRF9VU0VSQ09QWV9BTExPQ0FUT1I9eQojIENPTkZJR19IQVJERU5FRF9VU0VS
Q09QWSBpcyBub3Qgc2V0CkNPTkZJR19GT1JUSUZZX1NPVVJDRT15CkNPTkZJR19TVEFUSUNfVVNF
Uk1PREVIRUxQRVI9eQpDT05GSUdfU1RBVElDX1VTRVJNT0RFSEVMUEVSX1BBVEg9Ii9zYmluL3Vz
ZXJtb2RlLWhlbHBlciIKQ09ORklHX1NFQ1VSSVRZX0xPQURQSU49eQojIENPTkZJR19TRUNVUklU
WV9MT0FEUElOX0VORk9SQ0UgaXMgbm90IHNldApDT05GSUdfU0VDVVJJVFlfWUFNQT15CkNPTkZJ
R19TRUNVUklUWV9TQUZFU0VUSUQ9eQojIENPTkZJR19TRUNVUklUWV9MT0NLRE9XTl9MU00gaXMg
bm90IHNldAojIENPTkZJR19TRUNVUklUWV9MQU5ETE9DSyBpcyBub3Qgc2V0CiMgQ09ORklHX0lO
VEVHUklUWSBpcyBub3Qgc2V0CkNPTkZJR19ERUZBVUxUX1NFQ1VSSVRZX0RBQz15CkNPTkZJR19M
U009ImxhbmRsb2NrLGxvY2tkb3duLHlhbWEsbG9hZHBpbixzYWZlc2V0aWQsaW50ZWdyaXR5LGJw
ZiIKCiMKIyBLZXJuZWwgaGFyZGVuaW5nIG9wdGlvbnMKIwoKIwojIE1lbW9yeSBpbml0aWFsaXph
dGlvbgojCkNPTkZJR19DQ19IQVNfQVVUT19WQVJfSU5JVF9QQVRURVJOPXkKQ09ORklHX0NDX0hB
U19BVVRPX1ZBUl9JTklUX1pFUk89eQojIENPTkZJR19JTklUX1NUQUNLX05PTkUgaXMgbm90IHNl
dAojIENPTkZJR19JTklUX1NUQUNLX0FMTF9QQVRURVJOIGlzIG5vdCBzZXQKQ09ORklHX0lOSVRf
U1RBQ0tfQUxMX1pFUk89eQojIENPTkZJR19JTklUX09OX0FMTE9DX0RFRkFVTFRfT04gaXMgbm90
IHNldApDT05GSUdfSU5JVF9PTl9GUkVFX0RFRkFVTFRfT049eQpDT05GSUdfQ0NfSEFTX1pFUk9f
Q0FMTF9VU0VEX1JFR1M9eQojIENPTkZJR19aRVJPX0NBTExfVVNFRF9SRUdTIGlzIG5vdCBzZXQK
IyBlbmQgb2YgTWVtb3J5IGluaXRpYWxpemF0aW9uCiMgZW5kIG9mIEtlcm5lbCBoYXJkZW5pbmcg
b3B0aW9ucwojIGVuZCBvZiBTZWN1cml0eSBvcHRpb25zCgpDT05GSUdfWE9SX0JMT0NLUz15CkNP
TkZJR19DUllQVE89eQoKIwojIENyeXB0byBjb3JlIG9yIGhlbHBlcgojCkNPTkZJR19DUllQVE9f
QUxHQVBJPXkKQ09ORklHX0NSWVBUT19BTEdBUEkyPXkKQ09ORklHX0NSWVBUT19BRUFEPXkKQ09O
RklHX0NSWVBUT19BRUFEMj15CkNPTkZJR19DUllQVE9fU0tDSVBIRVI9eQpDT05GSUdfQ1JZUFRP
X1NLQ0lQSEVSMj15CkNPTkZJR19DUllQVE9fSEFTSD15CkNPTkZJR19DUllQVE9fSEFTSDI9eQpD
T05GSUdfQ1JZUFRPX1JORz15CkNPTkZJR19DUllQVE9fUk5HMj15CkNPTkZJR19DUllQVE9fUk5H
X0RFRkFVTFQ9eQpDT05GSUdfQ1JZUFRPX0FLQ0lQSEVSMj15CkNPTkZJR19DUllQVE9fQUtDSVBI
RVI9eQpDT05GSUdfQ1JZUFRPX0tQUDI9eQpDT05GSUdfQ1JZUFRPX0tQUD15CkNPTkZJR19DUllQ
VE9fQUNPTVAyPXkKQ09ORklHX0NSWVBUT19NQU5BR0VSPXkKQ09ORklHX0NSWVBUT19NQU5BR0VS
Mj15CkNPTkZJR19DUllQVE9fTUFOQUdFUl9ESVNBQkxFX1RFU1RTPXkKQ09ORklHX0NSWVBUT19H
RjEyOE1VTD15CkNPTkZJR19DUllQVE9fTlVMTD15CkNPTkZJR19DUllQVE9fTlVMTDI9eQpDT05G
SUdfQ1JZUFRPX1BDUllQVD15CkNPTkZJR19DUllQVE9fQ1JZUFREPXkKQ09ORklHX0NSWVBUT19B
VVRIRU5DPXkKQ09ORklHX0NSWVBUT19FTkdJTkU9eQoKIwojIFB1YmxpYy1rZXkgY3J5cHRvZ3Jh
cGh5CiMKQ09ORklHX0NSWVBUT19SU0E9eQpDT05GSUdfQ1JZUFRPX0RIPXkKQ09ORklHX0NSWVBU
T19ESF9SRkM3OTE5X0dST1VQUz15CkNPTkZJR19DUllQVE9fRUNDPXkKQ09ORklHX0NSWVBUT19F
Q0RIPXkKQ09ORklHX0NSWVBUT19FQ0RTQT15CiMgQ09ORklHX0NSWVBUT19FQ1JEU0EgaXMgbm90
IHNldApDT05GSUdfQ1JZUFRPX1NNMj15CkNPTkZJR19DUllQVE9fQ1VSVkUyNTUxOT15CgojCiMg
QXV0aGVudGljYXRlZCBFbmNyeXB0aW9uIHdpdGggQXNzb2NpYXRlZCBEYXRhCiMKQ09ORklHX0NS
WVBUT19DQ009eQpDT05GSUdfQ1JZUFRPX0dDTT15CkNPTkZJR19DUllQVE9fQ0hBQ0hBMjBQT0xZ
MTMwNT15CkNPTkZJR19DUllQVE9fQUVHSVMxMjg9eQpDT05GSUdfQ1JZUFRPX0FFR0lTMTI4X1NJ
TUQ9eQpDT05GSUdfQ1JZUFRPX1NFUUlWPXkKQ09ORklHX0NSWVBUT19FQ0hBSU5JVj15CgojCiMg
QmxvY2sgbW9kZXMKIwpDT05GSUdfQ1JZUFRPX0NCQz15CiMgQ09ORklHX0NSWVBUT19DRkIgaXMg
bm90IHNldApDT05GSUdfQ1JZUFRPX0NUUj15CkNPTkZJR19DUllQVE9fQ1RTPXkKQ09ORklHX0NS
WVBUT19FQ0I9eQpDT05GSUdfQ1JZUFRPX0xSVz15CkNPTkZJR19DUllQVE9fT0ZCPXkKQ09ORklH
X0NSWVBUT19QQ0JDPXkKQ09ORklHX0NSWVBUT19YVFM9eQpDT05GSUdfQ1JZUFRPX0tFWVdSQVA9
eQojIENPTkZJR19DUllQVE9fQURJQU5UVU0gaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0VTU0lW
PXkKCiMKIyBIYXNoIG1vZGVzCiMKQ09ORklHX0NSWVBUT19DTUFDPXkKQ09ORklHX0NSWVBUT19I
TUFDPXkKIyBDT05GSUdfQ1JZUFRPX1hDQkMgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fVk1B
QyBpcyBub3Qgc2V0CgojCiMgRGlnZXN0CiMKQ09ORklHX0NSWVBUT19DUkMzMkM9eQpDT05GSUdf
Q1JZUFRPX0NSQzMyPXkKQ09ORklHX0NSWVBUT19YWEhBU0g9eQpDT05GSUdfQ1JZUFRPX0JMQUtF
MkI9eQojIENPTkZJR19DUllQVE9fQkxBS0UyUyBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fQ1JD
VDEwRElGPXkKQ09ORklHX0NSWVBUT19DUkM2NF9ST0NLU09GVD15CkNPTkZJR19DUllQVE9fR0hB
U0g9eQpDT05GSUdfQ1JZUFRPX1BPTFkxMzA1PXkKQ09ORklHX0NSWVBUT19NRDQ9eQpDT05GSUdf
Q1JZUFRPX01ENT15CkNPTkZJR19DUllQVE9fTUlDSEFFTF9NSUM9eQpDT05GSUdfQ1JZUFRPX1JN
RDE2MD15CkNPTkZJR19DUllQVE9fU0hBMT15CkNPTkZJR19DUllQVE9fU0hBMjU2PXkKQ09ORklH
X0NSWVBUT19TSEE1MTI9eQpDT05GSUdfQ1JZUFRPX1NIQTM9eQpDT05GSUdfQ1JZUFRPX1NNMz15
CiMgQ09ORklHX0NSWVBUT19TVFJFRUJPRyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19XUDUx
MiBpcyBub3Qgc2V0CgojCiMgQ2lwaGVycwojCkNPTkZJR19DUllQVE9fQUVTPXkKIyBDT05GSUdf
Q1JZUFRPX0FFU19USSBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fQkxPV0ZJU0g9eQpDT05GSUdf
Q1JZUFRPX0JMT1dGSVNIX0NPTU1PTj15CiMgQ09ORklHX0NSWVBUT19DQU1FTExJQSBpcyBub3Qg
c2V0CkNPTkZJR19DUllQVE9fQ0FTVF9DT01NT049eQpDT05GSUdfQ1JZUFRPX0NBU1Q1PXkKIyBD
T05GSUdfQ1JZUFRPX0NBU1Q2IGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19ERVM9eQpDT05GSUdf
Q1JZUFRPX0ZDUllQVD15CkNPTkZJR19DUllQVE9fQ0hBQ0hBMjA9eQpDT05GSUdfQ1JZUFRPX1NF
UlBFTlQ9eQpDT05GSUdfQ1JZUFRPX1NNND15CkNPTkZJR19DUllQVE9fVFdPRklTSD15CkNPTkZJ
R19DUllQVE9fVFdPRklTSF9DT01NT049eQoKIwojIENvbXByZXNzaW9uCiMKQ09ORklHX0NSWVBU
T19ERUZMQVRFPXkKQ09ORklHX0NSWVBUT19MWk89eQojIENPTkZJR19DUllQVE9fODQyIGlzIG5v
dCBzZXQKIyBDT05GSUdfQ1JZUFRPX0xaNCBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fTFo0SEM9
eQpDT05GSUdfQ1JZUFRPX1pTVEQ9eQoKIwojIFJhbmRvbSBOdW1iZXIgR2VuZXJhdGlvbgojCiMg
Q09ORklHX0NSWVBUT19BTlNJX0NQUk5HIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19EUkJHX01F
TlU9eQpDT05GSUdfQ1JZUFRPX0RSQkdfSE1BQz15CkNPTkZJR19DUllQVE9fRFJCR19IQVNIPXkK
IyBDT05GSUdfQ1JZUFRPX0RSQkdfQ1RSIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19EUkJHPXkK
Q09ORklHX0NSWVBUT19KSVRURVJFTlRST1BZPXkKQ09ORklHX0NSWVBUT19LREY4MDAxMDhfQ1RS
PXkKQ09ORklHX0NSWVBUT19IQVNIX0lORk89eQpDT05GSUdfQ1JZUFRPX0hXPXkKIyBDT05GSUdf
Q1JZUFRPX0RFVl9BTExXSU5ORVIgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fREVWX1NMMzUx
NiBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fREVWX0hJRk5fNzk1WD15CiMgQ09ORklHX0NSWVBU
T19ERVZfSElGTl83OTVYX1JORyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfT01BUCBp
cyBub3Qgc2V0CkNPTkZJR19DUllQVE9fREVWX0VYWU5PU19STkc9eQpDT05GSUdfQ1JZUFRPX0RF
Vl9TNVA9eQojIENPTkZJR19DUllQVE9fREVWX0FUTUVMX0FFUyBpcyBub3Qgc2V0CkNPTkZJR19D
UllQVE9fREVWX0FUTUVMX1RERVM9eQojIENPTkZJR19DUllQVE9fREVWX0FUTUVMX1NIQSBpcyBu
b3Qgc2V0CkNPTkZJR19DUllQVE9fREVWX0FUTUVMX0kyQz15CkNPTkZJR19DUllQVE9fREVWX0FU
TUVMX0VDQz15CiMgQ09ORklHX0NSWVBUT19ERVZfQVRNRUxfU0hBMjA0QSBpcyBub3Qgc2V0CkNP
TkZJR19DUllQVE9fREVWX01BUlZFTEw9eQpDT05GSUdfQ1JZUFRPX0RFVl9NQVJWRUxMX0NFU0E9
eQpDT05GSUdfQ1JZUFRPX0RFVl9RQ0U9eQpDT05GSUdfQ1JZUFRPX0RFVl9RQ0VfU0tDSVBIRVI9
eQojIENPTkZJR19DUllQVE9fREVWX1FDRV9FTkFCTEVfQUxMIGlzIG5vdCBzZXQKQ09ORklHX0NS
WVBUT19ERVZfUUNFX0VOQUJMRV9TS0NJUEhFUj15CiMgQ09ORklHX0NSWVBUT19ERVZfUUNFX0VO
QUJMRV9TSEEgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fREVWX1FDRV9FTkFCTEVfQUVBRCBp
cyBub3Qgc2V0CkNPTkZJR19DUllQVE9fREVWX1FDRV9TV19NQVhfTEVOPTUxMgpDT05GSUdfQ1JZ
UFRPX0RFVl9RQ09NX1JORz15CiMgQ09ORklHX0NSWVBUT19ERVZfSU1HVEVDX0hBU0ggaXMgbm90
IHNldAojIENPTkZJR19DUllQVE9fREVWX1pZTlFNUF9BRVMgaXMgbm90IHNldAojIENPTkZJR19D
UllQVE9fREVWX1pZTlFNUF9TSEEzIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19ERVZfVklSVElP
PXkKQ09ORklHX0NSWVBUT19ERVZfU1RNMzJfQ1JDPXkKQ09ORklHX0NSWVBUT19ERVZfU1RNMzJf
SEFTSD15CkNPTkZJR19DUllQVE9fREVWX1NUTTMyX0NSWVA9eQojIENPTkZJR19DUllQVE9fREVW
X1NBRkVYQ0VMIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9BUlRQRUM2IGlzIG5vdCBz
ZXQKQ09ORklHX0NSWVBUT19ERVZfQ0NSRUU9eQojIENPTkZJR19DUllQVE9fREVWX0hJU0lfU0VD
IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9BTUxPR0lDX0dYTCBpcyBub3Qgc2V0CiMg
Q09ORklHX0NSWVBUT19ERVZfU0EyVUwgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fREVWX0tF
RU1CQVlfT0NTX0FFU19TTTQgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fREVWX0tFRU1CQVlf
T0NTX0VDQyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfS0VFTUJBWV9PQ1NfSENVIGlz
IG5vdCBzZXQKQ09ORklHX0FTWU1NRVRSSUNfS0VZX1RZUEU9eQojIENPTkZJR19BU1lNTUVUUklD
X1BVQkxJQ19LRVlfU1VCVFlQRSBpcyBub3Qgc2V0CgojCiMgQ2VydGlmaWNhdGVzIGZvciBzaWdu
YXR1cmUgY2hlY2tpbmcKIwojIENPTkZJR19TWVNURU1fVFJVU1RFRF9LRVlSSU5HIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU1lTVEVNX0JMQUNLTElTVF9LRVlSSU5HIGlzIG5vdCBzZXQKIyBlbmQgb2Yg
Q2VydGlmaWNhdGVzIGZvciBzaWduYXR1cmUgY2hlY2tpbmcKCkNPTkZJR19CSU5BUllfUFJJTlRG
PXkKCiMKIyBMaWJyYXJ5IHJvdXRpbmVzCiMKQ09ORklHX1JBSUQ2X1BRPXkKIyBDT05GSUdfUkFJ
RDZfUFFfQkVOQ0hNQVJLIGlzIG5vdCBzZXQKQ09ORklHX0xJTkVBUl9SQU5HRVM9eQpDT05GSUdf
UEFDS0lORz15CkNPTkZJR19CSVRSRVZFUlNFPXkKQ09ORklHX0dFTkVSSUNfU1RSTkNQWV9GUk9N
X1VTRVI9eQpDT05GSUdfR0VORVJJQ19TVFJOTEVOX1VTRVI9eQpDT05GSUdfQ09SRElDPXkKIyBD
T05GSUdfUFJJTUVfTlVNQkVSUyBpcyBub3Qgc2V0CkNPTkZJR19SQVRJT05BTD15CkNPTkZJR19H
RU5FUklDX1BDSV9JT01BUD15CkNPTkZJR19BUkNIX1VTRV9DTVBYQ0hHX0xPQ0tSRUY9eQoKIwoj
IENyeXB0byBsaWJyYXJ5IHJvdXRpbmVzCiMKQ09ORklHX0NSWVBUT19MSUJfQUVTPXkKQ09ORklH
X0NSWVBUT19MSUJfQkxBS0UyU19HRU5FUklDPXkKQ09ORklHX0NSWVBUT19MSUJfQ0hBQ0hBX0dF
TkVSSUM9eQpDT05GSUdfQ1JZUFRPX0xJQl9DSEFDSEE9eQpDT05GSUdfQ1JZUFRPX0xJQl9DVVJW
RTI1NTE5X0dFTkVSSUM9eQpDT05GSUdfQ1JZUFRPX0xJQl9DVVJWRTI1NTE5PXkKQ09ORklHX0NS
WVBUT19MSUJfREVTPXkKQ09ORklHX0NSWVBUT19MSUJfUE9MWTEzMDVfUlNJWkU9OQpDT05GSUdf
Q1JZUFRPX0xJQl9QT0xZMTMwNV9HRU5FUklDPXkKQ09ORklHX0NSWVBUT19MSUJfUE9MWTEzMDU9
eQpDT05GSUdfQ1JZUFRPX0xJQl9DSEFDSEEyMFBPTFkxMzA1PXkKQ09ORklHX0NSWVBUT19MSUJf
U0hBMjU2PXkKQ09ORklHX0NSWVBUT19MSUJfU00zPXkKQ09ORklHX0NSWVBUT19MSUJfU000PXkK
IyBlbmQgb2YgQ3J5cHRvIGxpYnJhcnkgcm91dGluZXMKCkNPTkZJR19DUkNfQ0NJVFQ9eQpDT05G
SUdfQ1JDMTY9eQpDT05GSUdfQ1JDX1QxMERJRj15CkNPTkZJR19DUkM2NF9ST0NLU09GVD15CkNP
TkZJR19DUkNfSVRVX1Q9eQpDT05GSUdfQ1JDMzI9eQpDT05GSUdfQ1JDMzJfU0VMRlRFU1Q9eQoj
IENPTkZJR19DUkMzMl9TTElDRUJZOCBpcyBub3Qgc2V0CkNPTkZJR19DUkMzMl9TTElDRUJZND15
CiMgQ09ORklHX0NSQzMyX1NBUldBVEUgaXMgbm90IHNldAojIENPTkZJR19DUkMzMl9CSVQgaXMg
bm90IHNldApDT05GSUdfQ1JDNjQ9eQpDT05GSUdfQ1JDND15CkNPTkZJR19DUkM3PXkKQ09ORklH
X0xJQkNSQzMyQz15CkNPTkZJR19DUkM4PXkKQ09ORklHX1hYSEFTSD15CiMgQ09ORklHX1JBTkRP
TTMyX1NFTEZURVNUIGlzIG5vdCBzZXQKQ09ORklHX1pMSUJfSU5GTEFURT15CkNPTkZJR19aTElC
X0RFRkxBVEU9eQpDT05GSUdfTFpPX0NPTVBSRVNTPXkKQ09ORklHX0xaT19ERUNPTVBSRVNTPXkK
Q09ORklHX0xaNEhDX0NPTVBSRVNTPXkKQ09ORklHX0xaNF9ERUNPTVBSRVNTPXkKQ09ORklHX1pT
VERfQ09NUFJFU1M9eQpDT05GSUdfWlNURF9ERUNPTVBSRVNTPXkKQ09ORklHX1haX0RFQz15CkNP
TkZJR19YWl9ERUNfWDg2PXkKQ09ORklHX1haX0RFQ19QT1dFUlBDPXkKQ09ORklHX1haX0RFQ19J
QTY0PXkKQ09ORklHX1haX0RFQ19BUk09eQpDT05GSUdfWFpfREVDX0FSTVRIVU1CPXkKQ09ORklH
X1haX0RFQ19TUEFSQz15CkNPTkZJR19YWl9ERUNfTUlDUk9MWk1BPXkKQ09ORklHX1haX0RFQ19C
Q0o9eQojIENPTkZJR19YWl9ERUNfVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19ERUNPTVBSRVNTX0da
SVA9eQpDT05GSUdfREVDT01QUkVTU19CWklQMj15CkNPTkZJR19ERUNPTVBSRVNTX1haPXkKQ09O
RklHX0RFQ09NUFJFU1NfTFpPPXkKQ09ORklHX0dFTkVSSUNfQUxMT0NBVE9SPXkKQ09ORklHX1JF
RURfU09MT01PTj15CkNPTkZJR19SRUVEX1NPTE9NT05fRU5DOD15CkNPTkZJR19SRUVEX1NPTE9N
T05fREVDOD15CkNPTkZJR19CQ0g9eQpDT05GSUdfSU5URVJWQUxfVFJFRT15CkNPTkZJR19BU1NP
Q0lBVElWRV9BUlJBWT15CkNPTkZJR19IQVNfSU9NRU09eQpDT05GSUdfSEFTX0RNQT15CkNPTkZJ
R19ETUFfT1BTPXkKQ09ORklHX05FRURfRE1BX01BUF9TVEFURT15CkNPTkZJR19ETUFfREVDTEFS
RV9DT0hFUkVOVD15CkNPTkZJR19BUkNIX0hBU19TRVRVUF9ETUFfT1BTPXkKQ09ORklHX0FSQ0hf
SEFTX1RFQVJET1dOX0RNQV9PUFM9eQpDT05GSUdfRE1BX05PTkNPSEVSRU5UX01NQVA9eQpDT05G
SUdfRE1BX0NNQT15CkNPTkZJR19ETUFfUEVSTlVNQV9DTUE9eQoKIwojIERlZmF1bHQgY29udGln
dW91cyBtZW1vcnkgYXJlYSBzaXplOgojCkNPTkZJR19DTUFfU0laRV9NQllURVM9MTYKQ09ORklH
X0NNQV9TSVpFX1BFUkNFTlRBR0U9MTAKIyBDT05GSUdfQ01BX1NJWkVfU0VMX01CWVRFUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NNQV9TSVpFX1NFTF9QRVJDRU5UQUdFIGlzIG5vdCBzZXQKIyBDT05G
SUdfQ01BX1NJWkVfU0VMX01JTiBpcyBub3Qgc2V0CkNPTkZJR19DTUFfU0laRV9TRUxfTUFYPXkK
Q09ORklHX0NNQV9BTElHTk1FTlQ9OApDT05GSUdfRE1BX0FQSV9ERUJVRz15CkNPTkZJR19ETUFf
QVBJX0RFQlVHX1NHPXkKIyBDT05GSUdfRE1BX01BUF9CRU5DSE1BUksgaXMgbm90IHNldApDT05G
SUdfU0dMX0FMTE9DPXkKQ09ORklHX0NQVU1BU0tfT0ZGU1RBQ0s9eQpDT05GSUdfR0xPQj15CiMg
Q09ORklHX0dMT0JfU0VMRlRFU1QgaXMgbm90IHNldApDT05GSUdfQ0xaX1RBQj15CkNPTkZJR19J
UlFfUE9MTD15CkNPTkZJR19NUElMSUI9eQpDT05GSUdfTElCRkRUPXkKQ09ORklHX0hBVkVfR0VO
RVJJQ19WRFNPPXkKQ09ORklHX0dFTkVSSUNfR0VUVElNRU9GREFZPXkKQ09ORklHX0dFTkVSSUNf
VkRTT18zMj15CkNPTkZJR19TR19QT09MPXkKQ09ORklHX1NUQUNLREVQT1Q9eQpDT05GSUdfU1RB
Q0tfSEFTSF9PUkRFUj0yMApDT05GSUdfUkVGX1RSQUNLRVI9eQpDT05GSUdfU0JJVE1BUD15CiMg
Q09ORklHX1BBUk1BTiBpcyBub3Qgc2V0CiMgQ09ORklHX09CSkFHRyBpcyBub3Qgc2V0CiMgZW5k
IG9mIExpYnJhcnkgcm91dGluZXMKCkNPTkZJR19HRU5FUklDX0xJQl9ERVZNRU1fSVNfQUxMT1dF
RD15CgojCiMgS2VybmVsIGhhY2tpbmcKIwoKIwojIHByaW50ayBhbmQgZG1lc2cgb3B0aW9ucwoj
CiMgQ09ORklHX1BSSU5US19USU1FIGlzIG5vdCBzZXQKIyBDT05GSUdfUFJJTlRLX0NBTExFUiBp
cyBub3Qgc2V0CiMgQ09ORklHX1NUQUNLVFJBQ0VfQlVJTERfSUQgaXMgbm90IHNldApDT05GSUdf
Q09OU09MRV9MT0dMRVZFTF9ERUZBVUxUPTcKQ09ORklHX0NPTlNPTEVfTE9HTEVWRUxfUVVJRVQ9
NApDT05GSUdfTUVTU0FHRV9MT0dMRVZFTF9ERUZBVUxUPTQKIyBDT05GSUdfQk9PVF9QUklOVEtf
REVMQVkgaXMgbm90IHNldAojIENPTkZJR19EWU5BTUlDX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05G
SUdfRFlOQU1JQ19ERUJVR19DT1JFIGlzIG5vdCBzZXQKIyBDT05GSUdfU1lNQk9MSUNfRVJSTkFN
RSBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19CVUdWRVJCT1NFPXkKIyBlbmQgb2YgcHJpbnRrIGFu
ZCBkbWVzZyBvcHRpb25zCgpDT05GSUdfREVCVUdfS0VSTkVMPXkKQ09ORklHX0RFQlVHX01JU0M9
eQoKIwojIENvbXBpbGUtdGltZSBjaGVja3MgYW5kIGNvbXBpbGVyIG9wdGlvbnMKIwpDT05GSUdf
REVCVUdfSU5GTz15CiMgQ09ORklHX0RFQlVHX0lORk9fTk9ORSBpcyBub3Qgc2V0CiMgQ09ORklH
X0RFQlVHX0lORk9fRFdBUkZfVE9PTENIQUlOX0RFRkFVTFQgaXMgbm90IHNldAojIENPTkZJR19E
RUJVR19JTkZPX0RXQVJGNCBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19JTkZPX0RXQVJGNT15CiMg
Q09ORklHX0RFQlVHX0lORk9fUkVEVUNFRCBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX0lORk9f
Q09NUFJFU1NFRCBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19JTkZPX1NQTElUPXkKQ09ORklHX1BB
SE9MRV9IQVNfU1BMSVRfQlRGPXkKIyBDT05GSUdfR0RCX1NDUklQVFMgaXMgbm90IHNldApDT05G
SUdfRlJBTUVfV0FSTj0xMDI0CkNPTkZJR19TVFJJUF9BU01fU1lNUz15CiMgQ09ORklHX1JFQURB
QkxFX0FTTSBpcyBub3Qgc2V0CiMgQ09ORklHX0hFQURFUlNfSU5TVEFMTCBpcyBub3Qgc2V0CkNP
TkZJR19ERUJVR19TRUNUSU9OX01JU01BVENIPXkKQ09ORklHX1NFQ1RJT05fTUlTTUFUQ0hfV0FS
Tl9PTkxZPXkKQ09ORklHX0RFQlVHX0ZPUkNFX1dFQUtfUEVSX0NQVT15CiMgZW5kIG9mIENvbXBp
bGUtdGltZSBjaGVja3MgYW5kIGNvbXBpbGVyIG9wdGlvbnMKCiMKIyBHZW5lcmljIEtlcm5lbCBE
ZWJ1Z2dpbmcgSW5zdHJ1bWVudHMKIwpDT05GSUdfTUFHSUNfU1lTUlE9eQpDT05GSUdfTUFHSUNf
U1lTUlFfREVGQVVMVF9FTkFCTEU9MHgxCkNPTkZJR19NQUdJQ19TWVNSUV9TRVJJQUw9eQpDT05G
SUdfTUFHSUNfU1lTUlFfU0VSSUFMX1NFUVVFTkNFPSIiCkNPTkZJR19ERUJVR19GUz15CiMgQ09O
RklHX0RFQlVHX0ZTX0FMTE9XX0FMTCBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19GU19ESVNBTExP
V19NT1VOVD15CiMgQ09ORklHX0RFQlVHX0ZTX0FMTE9XX05PTkUgaXMgbm90IHNldApDT05GSUdf
SEFWRV9BUkNIX0tHREI9eQpDT05GSUdfS0dEQj15CkNPTkZJR19LR0RCX1NFUklBTF9DT05TT0xF
PXkKQ09ORklHX0tHREJfVEVTVFM9eQpDT05GSUdfS0dEQl9URVNUU19PTl9CT09UPXkKQ09ORklH
X0tHREJfVEVTVFNfQk9PVF9TVFJJTkc9IlYxRjEwMCIKIyBDT05GSUdfS0dEQl9LREIgaXMgbm90
IHNldApDT05GSUdfVUJTQU49eQpDT05GSUdfQ0NfSEFTX1VCU0FOX0JPVU5EUz15CiMgQ09ORklH
X1VCU0FOX0JPVU5EUyBpcyBub3Qgc2V0CiMgQ09ORklHX1VCU0FOX1NISUZUIGlzIG5vdCBzZXQK
IyBDT05GSUdfVUJTQU5fRElWX1pFUk8gaXMgbm90IHNldApDT05GSUdfVUJTQU5fVU5SRUFDSEFC
TEU9eQpDT05GSUdfVUJTQU5fQk9PTD15CkNPTkZJR19VQlNBTl9FTlVNPXkKQ09ORklHX0hBVkVf
S0NTQU5fQ09NUElMRVI9eQojIGVuZCBvZiBHZW5lcmljIEtlcm5lbCBEZWJ1Z2dpbmcgSW5zdHJ1
bWVudHMKCiMKIyBOZXR3b3JraW5nIERlYnVnZ2luZwojCkNPTkZJR19ORVRfREVWX1JFRkNOVF9U
UkFDS0VSPXkKIyBDT05GSUdfTkVUX05TX1JFRkNOVF9UUkFDS0VSIGlzIG5vdCBzZXQKIyBlbmQg
b2YgTmV0d29ya2luZyBEZWJ1Z2dpbmcKCiMKIyBNZW1vcnkgRGVidWdnaW5nCiMKQ09ORklHX1BB
R0VfRVhURU5TSU9OPXkKIyBDT05GSUdfREVCVUdfUEFHRUFMTE9DIGlzIG5vdCBzZXQKQ09ORklH
X1BBR0VfT1dORVI9eQpDT05GSUdfUEFHRV9QT0lTT05JTkc9eQojIENPTkZJR19ERUJVR19QQUdF
X1JFRiBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1JPREFUQV9URVNUIGlzIG5vdCBzZXQKQ09O
RklHX0RFQlVHX1dYPXkKQ09ORklHX0RFQlVHX09CSkVDVFM9eQojIENPTkZJR19ERUJVR19PQkpF
Q1RTX1NFTEZURVNUIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX09CSkVDVFNfRlJFRT15CkNPTkZJ
R19ERUJVR19PQkpFQ1RTX1RJTUVSUz15CkNPTkZJR19ERUJVR19PQkpFQ1RTX1dPUks9eQojIENP
TkZJR19ERUJVR19PQkpFQ1RTX1JDVV9IRUFEIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfT0JK
RUNUU19QRVJDUFVfQ09VTlRFUiBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19PQkpFQ1RTX0VOQUJM
RV9ERUZBVUxUPTEKQ09ORklHX0RFQlVHX1NMQUI9eQpDT05GSUdfSEFWRV9ERUJVR19LTUVNTEVB
Sz15CiMgQ09ORklHX0RFQlVHX0tNRU1MRUFLIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfU1RB
Q0tfVVNBR0UgaXMgbm90IHNldApDT05GSUdfU0NIRURfU1RBQ0tfRU5EX0NIRUNLPXkKIyBDT05G
SUdfREVCVUdfVk0gaXMgbm90IHNldApDT05GSUdfQVJDSF9IQVNfREVCVUdfVklSVFVBTD15CiMg
Q09ORklHX0RFQlVHX1ZJUlRVQUwgaXMgbm90IHNldApDT05GSUdfREVCVUdfTUVNT1JZX0lOSVQ9
eQpDT05GSUdfREVCVUdfUEVSX0NQVV9NQVBTPXkKQ09ORklHX0RFQlVHX0tNQVBfTE9DQUw9eQpD
T05GSUdfREVCVUdfSElHSE1FTT15CkNPTkZJR19IQVZFX0FSQ0hfS0FTQU49eQpDT05GSUdfQ0Nf
SEFTX0tBU0FOX0dFTkVSSUM9eQpDT05GSUdfQ0NfSEFTX1dPUktJTkdfTk9TQU5JVElaRV9BRERS
RVNTPXkKQ09ORklHX0hBVkVfQVJDSF9LRkVOQ0U9eQojIENPTkZJR19LRkVOQ0UgaXMgbm90IHNl
dAojIGVuZCBvZiBNZW1vcnkgRGVidWdnaW5nCgojIENPTkZJR19ERUJVR19TSElSUSBpcyBub3Qg
c2V0CgojCiMgRGVidWcgT29wcywgTG9ja3VwcyBhbmQgSGFuZ3MKIwojIENPTkZJR19QQU5JQ19P
Tl9PT1BTIGlzIG5vdCBzZXQKQ09ORklHX1BBTklDX09OX09PUFNfVkFMVUU9MApDT05GSUdfUEFO
SUNfVElNRU9VVD0wCkNPTkZJR19MT0NLVVBfREVURUNUT1I9eQpDT05GSUdfU09GVExPQ0tVUF9E
RVRFQ1RPUj15CkNPTkZJR19CT09UUEFSQU1fU09GVExPQ0tVUF9QQU5JQz15CkNPTkZJR19CT09U
UEFSQU1fU09GVExPQ0tVUF9QQU5JQ19WQUxVRT0xCkNPTkZJR19ERVRFQ1RfSFVOR19UQVNLPXkK
Q09ORklHX0RFRkFVTFRfSFVOR19UQVNLX1RJTUVPVVQ9MTIwCkNPTkZJR19CT09UUEFSQU1fSFVO
R19UQVNLX1BBTklDPXkKQ09ORklHX0JPT1RQQVJBTV9IVU5HX1RBU0tfUEFOSUNfVkFMVUU9MQpD
T05GSUdfV1FfV0FUQ0hET0c9eQojIGVuZCBvZiBEZWJ1ZyBPb3BzLCBMb2NrdXBzIGFuZCBIYW5n
cwoKIwojIFNjaGVkdWxlciBEZWJ1Z2dpbmcKIwojIENPTkZJR19TQ0hFRF9ERUJVRyBpcyBub3Qg
c2V0CkNPTkZJR19TQ0hFRF9JTkZPPXkKQ09ORklHX1NDSEVEU1RBVFM9eQojIGVuZCBvZiBTY2hl
ZHVsZXIgRGVidWdnaW5nCgpDT05GSUdfREVCVUdfVElNRUtFRVBJTkc9eQoKIwojIExvY2sgRGVi
dWdnaW5nIChzcGlubG9ja3MsIG11dGV4ZXMsIGV0Yy4uLikKIwpDT05GSUdfTE9DS19ERUJVR0dJ
TkdfU1VQUE9SVD15CkNPTkZJR19QUk9WRV9MT0NLSU5HPXkKQ09ORklHX1BST1ZFX1JBV19MT0NL
X05FU1RJTkc9eQojIENPTkZJR19MT0NLX1NUQVQgaXMgbm90IHNldApDT05GSUdfREVCVUdfUlRf
TVVURVhFUz15CkNPTkZJR19ERUJVR19TUElOTE9DSz15CkNPTkZJR19ERUJVR19NVVRFWEVTPXkK
Q09ORklHX0RFQlVHX1dXX01VVEVYX1NMT1dQQVRIPXkKQ09ORklHX0RFQlVHX1JXU0VNUz15CkNP
TkZJR19ERUJVR19MT0NLX0FMTE9DPXkKQ09ORklHX0xPQ0tERVA9eQpDT05GSUdfTE9DS0RFUF9C
SVRTPTE1CkNPTkZJR19MT0NLREVQX0NIQUlOU19CSVRTPTE2CkNPTkZJR19MT0NLREVQX1NUQUNL
X1RSQUNFX0JJVFM9MTkKQ09ORklHX0xPQ0tERVBfU1RBQ0tfVFJBQ0VfSEFTSF9CSVRTPTE0CkNP
TkZJR19MT0NLREVQX0NJUkNVTEFSX1FVRVVFX0JJVFM9MTIKQ09ORklHX0RFQlVHX0xPQ0tERVA9
eQojIENPTkZJR19ERUJVR19BVE9NSUNfU0xFRVAgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19M
T0NLSU5HX0FQSV9TRUxGVEVTVFMgaXMgbm90IHNldApDT05GSUdfTE9DS19UT1JUVVJFX1RFU1Q9
eQpDT05GSUdfV1dfTVVURVhfU0VMRlRFU1Q9eQojIENPTkZJR19TQ0ZfVE9SVFVSRV9URVNUIGlz
IG5vdCBzZXQKQ09ORklHX1BST1ZFX0NYTF9MT0NLSU5HPXkKIyBlbmQgb2YgTG9jayBEZWJ1Z2dp
bmcgKHNwaW5sb2NrcywgbXV0ZXhlcywgZXRjLi4uKQoKQ09ORklHX1RSQUNFX0lSUUZMQUdTPXkK
Q09ORklHX0RFQlVHX0lSUUZMQUdTPXkKQ09ORklHX1NUQUNLVFJBQ0U9eQpDT05GSUdfV0FSTl9B
TExfVU5TRUVERURfUkFORE9NPXkKIyBDT05GSUdfREVCVUdfS09CSkVDVCBpcyBub3Qgc2V0CkNP
TkZJR19ERUJVR19LT0JKRUNUX1JFTEVBU0U9eQoKIwojIERlYnVnIGtlcm5lbCBkYXRhIHN0cnVj
dHVyZXMKIwojIENPTkZJR19ERUJVR19MSVNUIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX1BMSVNU
PXkKIyBDT05GSUdfREVCVUdfU0cgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19OT1RJRklFUlMg
aXMgbm90IHNldAojIENPTkZJR19CVUdfT05fREFUQV9DT1JSVVBUSU9OIGlzIG5vdCBzZXQKIyBl
bmQgb2YgRGVidWcga2VybmVsIGRhdGEgc3RydWN0dXJlcwoKQ09ORklHX0RFQlVHX0NSRURFTlRJ
QUxTPXkKCiMKIyBSQ1UgRGVidWdnaW5nCiMKQ09ORklHX1BST1ZFX1JDVT15CkNPTkZJR19UT1JU
VVJFX1RFU1Q9eQpDT05GSUdfUkNVX1NDQUxFX1RFU1Q9eQpDT05GSUdfUkNVX1RPUlRVUkVfVEVT
VD15CkNPTkZJR19SQ1VfUkVGX1NDQUxFX1RFU1Q9eQpDT05GSUdfUkNVX0NQVV9TVEFMTF9USU1F
T1VUPTIxCiMgQ09ORklHX1JDVV9UUkFDRSBpcyBub3Qgc2V0CkNPTkZJR19SQ1VfRVFTX0RFQlVH
PXkKIyBlbmQgb2YgUkNVIERlYnVnZ2luZwoKQ09ORklHX0RFQlVHX1dRX0ZPUkNFX1JSX0NQVT15
CiMgQ09ORklHX0NQVV9IT1RQTFVHX1NUQVRFX0NPTlRST0wgaXMgbm90IHNldApDT05GSUdfTEFU
RU5DWVRPUD15CkNPTkZJR19OT1BfVFJBQ0VSPXkKQ09ORklHX0hBVkVfRlVOQ1RJT05fVFJBQ0VS
PXkKQ09ORklHX0hBVkVfRlVOQ1RJT05fR1JBUEhfVFJBQ0VSPXkKQ09ORklHX0hBVkVfRFlOQU1J
Q19GVFJBQ0U9eQpDT05GSUdfSEFWRV9EWU5BTUlDX0ZUUkFDRV9XSVRIX1JFR1M9eQpDT05GSUdf
SEFWRV9GVFJBQ0VfTUNPVU5UX1JFQ09SRD15CkNPTkZJR19IQVZFX1NZU0NBTExfVFJBQ0VQT0lO
VFM9eQpDT05GSUdfSEFWRV9DX1JFQ09SRE1DT1VOVD15CkNPTkZJR19IQVZFX0JVSUxEVElNRV9N
Q09VTlRfU09SVD15CkNPTkZJR19UUkFDRV9DTE9DSz15CkNPTkZJR19SSU5HX0JVRkZFUj15CkNP
TkZJR19FVkVOVF9UUkFDSU5HPXkKQ09ORklHX0NPTlRFWFRfU1dJVENIX1RSQUNFUj15CkNPTkZJ
R19QUkVFTVBUSVJRX1RSQUNFUE9JTlRTPXkKQ09ORklHX1RSQUNJTkc9eQpDT05GSUdfVFJBQ0lO
R19TVVBQT1JUPXkKIyBDT05GSUdfRlRSQUNFIGlzIG5vdCBzZXQKIyBDT05GSUdfU0FNUExFUyBp
cyBub3Qgc2V0CiMgQ09ORklHX1NUUklDVF9ERVZNRU0gaXMgbm90IHNldAoKIwojIGFybSBEZWJ1
Z2dpbmcKIwpDT05GSUdfQVJNX1BURFVNUF9DT1JFPXkKQ09ORklHX0FSTV9QVERVTVBfREVCVUdG
Uz15CiMgQ09ORklHX1VOV0lOREVSX0ZSQU1FX1BPSU5URVIgaXMgbm90IHNldApDT05GSUdfVU5X
SU5ERVJfQVJNPXkKQ09ORklHX0FSTV9VTldJTkQ9eQojIENPTkZJR19ERUJVR19VU0VSIGlzIG5v
dCBzZXQKQ09ORklHX0RFQlVHX0xMPXkKIyBDT05GSUdfREVCVUdfQVQ5MV9TQU05MjYzX0RCR1Ug
aXMgbm90IHNldAojIENPTkZJR19ERUJVR19CRVJMSU5fVUFSVCBpcyBub3Qgc2V0CiMgQ09ORklH
X0RFQlVHX0RJR0lDT0xPUl9VQTAgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19ISTM2MjBfVUFS
VCBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX0hJR0hCQU5LX1VBUlQgaXMgbm90IHNldAojIENP
TkZJR19ERUJVR19LRVlTVE9ORV9VQVJUMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX0tFWVNU
T05FX1VBUlQxIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfTUVTT05fVUFSVEFPIGlzIG5vdCBz
ZXQKIyBDT05GSUdfREVCVUdfTVZFQlVfVUFSVDBfQUxURVJOQVRFIGlzIG5vdCBzZXQKIyBDT05G
SUdfREVCVUdfTVNUQVJWN19QTVVBUlQgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19PTUFQMlVB
UlQxIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfT01BUDJVQVJUMiBpcyBub3Qgc2V0CiMgQ09O
RklHX0RFQlVHX09NQVAyVUFSVDMgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19PTUFQM1VBUlQz
IGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfT01BUDRVQVJUMyBpcyBub3Qgc2V0CiMgQ09ORklH
X0RFQlVHX09NQVAzVUFSVDQgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19PTUFQNFVBUlQ0IGlz
IG5vdCBzZXQKIyBDT05GSUdfREVCVUdfVEk4MVhYVUFSVDEgaXMgbm90IHNldAojIENPTkZJR19E
RUJVR19USTgxWFhVQVJUMiBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1RJODFYWFVBUlQzIGlz
IG5vdCBzZXQKIyBDT05GSUdfREVCVUdfQU0zM1hYVUFSVDEgaXMgbm90IHNldApDT05GSUdfREVC
VUdfWk9PTV9VQVJUPXkKIyBDT05GSUdfREVCVUdfUUNPTV9VQVJURE0gaXMgbm90IHNldAojIENP
TkZJR19ERUJVR19SRUFMVklFV19TVERfUE9SVCBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1I3
UzkyMTBfU0NJRjIgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19SN1M5MjEwX1NDSUY0IGlzIG5v
dCBzZXQKIyBDT05GSUdfREVCVUdfUkNBUl9HRU4yX1NDSUYwIGlzIG5vdCBzZXQKIyBDT05GSUdf
REVCVUdfUkNBUl9HRU4yX1NDSUYyIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfUkNBUl9HRU4y
X1NDSUY0IGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfUkNBUl9HRU4yX1NDSUZBMiBpcyBub3Qg
c2V0CiMgQ09ORklHX0RFQlVHX1JNT0JJTEVfU0NJRkEwIGlzIG5vdCBzZXQKIyBDT05GSUdfREVC
VUdfUk1PQklMRV9TQ0lGQTEgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19STU9CSUxFX1NDSUZB
NCBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1MzQ19VQVJUMCBpcyBub3Qgc2V0CiMgQ09ORklH
X0RFQlVHX1MzQ19VQVJUMSBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1MzQ19VQVJUMiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0RFQlVHX1MzQ19VQVJUMyBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVH
X1NPQ0ZQR0FfVUFSVDAgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19TT0NGUEdBX0FSUklBMTBf
VUFSVDEgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19TT0NGUEdBX0NZQ0xPTkU1X1VBUlQxIGlz
IG5vdCBzZXQKIyBDT05GSUdfREVCVUdfU1VOOUlfVUFSVDAgaXMgbm90IHNldAojIENPTkZJR19E
RUJVR19TVU5YSV9VQVJUMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1NVTlhJX1VBUlQxIGlz
IG5vdCBzZXQKIyBDT05GSUdfU1RNMzJNUDFfREVCVUdfVUFSVCBpcyBub3Qgc2V0CiMgQ09ORklH
X0RFQlVHX1ZUODUwMF9VQVJUMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX0lDRURDQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0RFQlVHX1NFTUlIT1NUSU5HIGlzIG5vdCBzZXQKIyBDT05GSUdfREVC
VUdfTExfVUFSVF84MjUwIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfTExfVUFSVF9QTDAxWCBp
cyBub3Qgc2V0CkNPTkZJR19ERUJVR19PTUFQMlBMVVNfVUFSVD15CiMgQ09ORklHX0RFQlVHX1VB
UlRfRkxPV19DT05UUk9MIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX0xMX0lOQ0xVREU9ImRlYnVn
L29tYXAycGx1cy5TIgpDT05GSUdfVU5DT01QUkVTU19JTkNMVURFPSJkZWJ1Zy91bmNvbXByZXNz
LmgiCiMgQ09ORklHX0VBUkxZX1BSSU5USyBpcyBub3Qgc2V0CkNPTkZJR19QSURfSU5fQ09OVEVY
VElEUj15CkNPTkZJR19DT1JFU0lHSFQ9eQpDT05GSUdfQ09SRVNJR0hUX0xJTktTX0FORF9TSU5L
Uz15CkNPTkZJR19DT1JFU0lHSFRfTElOS19BTkRfU0lOS19UTUM9eQpDT05GSUdfQ09SRVNJR0hU
X0NBVFU9eQojIENPTkZJR19DT1JFU0lHSFRfU0lOS19UUElVIGlzIG5vdCBzZXQKQ09ORklHX0NP
UkVTSUdIVF9TSU5LX0VUQlYxMD15CiMgQ09ORklHX0NPUkVTSUdIVF9TT1VSQ0VfRVRNM1ggaXMg
bm90IHNldApDT05GSUdfQ09SRVNJR0hUX1NUTT15CkNPTkZJR19DT1JFU0lHSFRfQ1BVX0RFQlVH
PXkKIyBDT05GSUdfQ09SRVNJR0hUX0NQVV9ERUJVR19ERUZBVUxUX09OIGlzIG5vdCBzZXQKIyBD
T05GSUdfQ09SRVNJR0hUX0NUSSBpcyBub3Qgc2V0CiMgZW5kIG9mIGFybSBEZWJ1Z2dpbmcKCiMK
IyBLZXJuZWwgVGVzdGluZyBhbmQgQ292ZXJhZ2UKIwojIENPTkZJR19LVU5JVCBpcyBub3Qgc2V0
CkNPTkZJR19OT1RJRklFUl9FUlJPUl9JTkpFQ1RJT049eQpDT05GSUdfUE1fTk9USUZJRVJfRVJS
T1JfSU5KRUNUPXkKIyBDT05GSUdfT0ZfUkVDT05GSUdfTk9USUZJRVJfRVJST1JfSU5KRUNUIGlz
IG5vdCBzZXQKIyBDT05GSUdfRkFVTFRfSU5KRUNUSU9OIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hf
SEFTX0tDT1Y9eQpDT05GSUdfQ0NfSEFTX1NBTkNPVl9UUkFDRV9QQz15CkNPTkZJR19LQ09WPXkK
Q09ORklHX0tDT1ZfRU5BQkxFX0NPTVBBUklTT05TPXkKQ09ORklHX0tDT1ZfSU5TVFJVTUVOVF9B
TEw9eQpDT05GSUdfS0NPVl9JUlFfQVJFQV9TSVpFPTB4NDAwMDAKQ09ORklHX1JVTlRJTUVfVEVT
VElOR19NRU5VPXkKIyBDT05GSUdfTEtEVE0gaXMgbm90IHNldAojIENPTkZJR19URVNUX01JTl9I
RUFQIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9ESVY2NCBpcyBub3Qgc2V0CiMgQ09ORklHX0JB
Q0tUUkFDRV9TRUxGX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19URVNUX1JFRl9UUkFDS0VSIGlz
IG5vdCBzZXQKIyBDT05GSUdfUkJUUkVFX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19SRUVEX1NP
TE9NT05fVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19JTlRFUlZBTF9UUkVFX1RFU1Q9eQojIENPTkZJ
R19BVE9NSUM2NF9TRUxGVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfSEVYRFVNUCBpcyBu
b3Qgc2V0CkNPTkZJR19TVFJJTkdfU0VMRlRFU1Q9eQpDT05GSUdfVEVTVF9TVFJJTkdfSEVMUEVS
Uz15CkNPTkZJR19URVNUX1NUUlNDUFk9eQojIENPTkZJR19URVNUX0tTVFJUT1ggaXMgbm90IHNl
dAojIENPTkZJR19URVNUX1BSSU5URiBpcyBub3Qgc2V0CkNPTkZJR19URVNUX1NDQU5GPXkKIyBD
T05GSUdfVEVTVF9CSVRNQVAgaXMgbm90IHNldApDT05GSUdfVEVTVF9VVUlEPXkKQ09ORklHX1RF
U1RfWEFSUkFZPXkKIyBDT05GSUdfVEVTVF9SSEFTSFRBQkxFIGlzIG5vdCBzZXQKIyBDT05GSUdf
VEVTVF9TSVBIQVNIIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9JREEgaXMgbm90IHNldAojIENP
TkZJR19GSU5EX0JJVF9CRU5DSE1BUksgaXMgbm90IHNldAojIENPTkZJR19URVNUX0ZJUk1XQVJF
IGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9TWVNDVEwgaXMgbm90IHNldApDT05GSUdfVEVTVF9V
REVMQVk9eQpDT05GSUdfVEVTVF9NRU1DQVRfUD15CiMgQ09ORklHX1RFU1RfTUVNSU5JVCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RFU1RfRlJFRV9QQUdFUyBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX1VT
RV9NRU1URVNUPXkKQ09ORklHX01FTVRFU1Q9eQojIGVuZCBvZiBLZXJuZWwgVGVzdGluZyBhbmQg
Q292ZXJhZ2UKCiMgQ09ORklHX1dBUk5fTUlTU0lOR19ET0NVTUVOVFMgaXMgbm90IHNldAojIENP
TkZJR19XQVJOX0FCSV9FUlJPUlMgaXMgbm90IHNldAojIGVuZCBvZiBLZXJuZWwgaGFja2luZwo=

--===============2916515233722039086==--

