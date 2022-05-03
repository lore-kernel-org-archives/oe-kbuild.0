Content-Type: multipart/mixed; boundary="===============3589750084748406454=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [asahilinux:bits/130-cpufreq 3/4] drivers/cpufreq/apple-soc-cpufreq.c:279:54-55: attr: first occurrence line 284, second occurrence line 291
Date: Tue, 03 May 2022 19:37:32 +0800
Message-ID: <202205031934.CchZIQh3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3589750084748406454==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/130-cpufreq
head:   b7105141d60ddab11c03955ae5389fc7f2a369da
commit: 3580ed2b7ae9f66539990a47a90aa71308dab079 [3/4] cpufreq: apple-soc: =
Add new driver to control Apple SoC CPU P-states
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-c023-20220501 (https://download.01.org/0day-ci/arc=
hive/20220503/202205031934.CchZIQh3-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/cpufreq/apple-soc-cpufreq.c:279:54-55: attr: first occurrence li=
ne 284, second occurrence line 291

vim +279 drivers/cpufreq/apple-soc-cpufreq.c

3580ed2b7ae9f66 Hector Martin 2022-02-15  278  =

3580ed2b7ae9f66 Hector Martin 2022-02-15 @279  static struct cpufreq_driver=
 apple_soc_cpufreq_driver =3D {
3580ed2b7ae9f66 Hector Martin 2022-02-15  280  	.name		=3D "apple-cpufreq",
3580ed2b7ae9f66 Hector Martin 2022-02-15  281  	.flags		=3D CPUFREQ_HAVE_GO=
VERNOR_PER_POLICY |
3580ed2b7ae9f66 Hector Martin 2022-02-15  282  			  CPUFREQ_NEED_INITIAL_FR=
EQ_CHECK | CPUFREQ_IS_COOLING_DEV,
3580ed2b7ae9f66 Hector Martin 2022-02-15  283  	.verify		=3D cpufreq_generi=
c_frequency_table_verify,
3580ed2b7ae9f66 Hector Martin 2022-02-15 @284  	.attr		=3D cpufreq_generic_=
attr,
3580ed2b7ae9f66 Hector Martin 2022-02-15  285  	.get		=3D apple_soc_cpufreq=
_get_rate,
3580ed2b7ae9f66 Hector Martin 2022-02-15  286  	.init		=3D apple_soc_cpufre=
q_init,
3580ed2b7ae9f66 Hector Martin 2022-02-15  287  	.exit		=3D apple_soc_cpufre=
q_exit,
3580ed2b7ae9f66 Hector Martin 2022-02-15  288  	.target_index	=3D apple_soc=
_cpufreq_set_target,
3580ed2b7ae9f66 Hector Martin 2022-02-15  289  	.fast_switch	=3D apple_soc_=
cpufreq_fast_switch,
3580ed2b7ae9f66 Hector Martin 2022-02-15  290  	.register_em	=3D cpufreq_re=
gister_em_with_opp,
3580ed2b7ae9f66 Hector Martin 2022-02-15 @291  	.attr		=3D apple_soc_cpufre=
q_hw_attr,
3580ed2b7ae9f66 Hector Martin 2022-02-15  292  };
3580ed2b7ae9f66 Hector Martin 2022-02-15  293  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3589750084748406454==--

