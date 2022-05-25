Content-Type: multipart/mixed; boundary="===============3920358194911292872=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 11752/14193] sound/soc/intel/avs/ipc.c:87:5-24: atomic_dec_and_test variation before object free at line 88.
Date: Wed, 25 May 2022 22:01:35 +0800
Message-ID: <202205252157.zifyLOE4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3920358194911292872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Cezary Rojewski <cezary.rojewski@intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: "Amadeusz S=C5=82awi=C5=84ski" <amadeuszx.slawinski@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   8cb8311e95e3bb58bd84d6350365f14a718faa6d
commit: 335c4cbd201d4b74942ff37e6c644d56b9247df3 [11752/14193] ASoC: Intel:=
 avs: D0ix power state support
:::::: branch date: 7 hours ago
:::::: commit date: 8 days ago
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20220525=
/202205252157.zifyLOE4-lkp(a)intel.com/config)
compiler: mips-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> sound/soc/intel/avs/ipc.c:87:5-24: atomic_dec_and_test variation before =
object free at line 88.

vim +87 sound/soc/intel/avs/ipc.c

335c4cbd201d4b Cezary Rojewski 2022-05-16  82  =

335c4cbd201d4b Cezary Rojewski 2022-05-16  83  int avs_dsp_enable_d0ix(stru=
ct avs_dev *adev)
335c4cbd201d4b Cezary Rojewski 2022-05-16  84  {
335c4cbd201d4b Cezary Rojewski 2022-05-16  85  	struct avs_ipc *ipc =3D ade=
v->ipc;
335c4cbd201d4b Cezary Rojewski 2022-05-16  86  =

335c4cbd201d4b Cezary Rojewski 2022-05-16 @87  	if (atomic_dec_and_test(&ip=
c->d0ix_disable_depth))
335c4cbd201d4b Cezary Rojewski 2022-05-16 @88  		queue_delayed_work(system_=
power_efficient_wq, &ipc->d0ix_work,
335c4cbd201d4b Cezary Rojewski 2022-05-16  89  				   msecs_to_jiffies(AVS_=
D0IX_DELAY_MS));
335c4cbd201d4b Cezary Rojewski 2022-05-16  90  	return 0;
335c4cbd201d4b Cezary Rojewski 2022-05-16  91  }
2879516fcd6d7e Cezary Rojewski 2022-03-11  92  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3920358194911292872==--

