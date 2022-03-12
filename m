Content-Type: multipart/mixed; boundary="===============2233295200068846603=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tip:locking/core 8/9] drivers/md/raid5.c:7070:9: sparse: struct local_lock_t [usertype] **
Date: Sat, 12 Mar 2022 12:20:15 +0800
Message-ID: <202203121205.ECYBXvUy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2233295200068846603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
CC: x86(a)kernel.org
TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Waiman Long <longman@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking=
/core
head:   cd27ccfc727e99352321c0c75012ab9c5a90321e
commit: 9983a9d577db415c41099a20a5637ab25dd3c240 [8/9] locking/local_lock: =
Make the empty local_lock_*() function a macro.
:::::: branch date: 3 weeks ago
:::::: commit date: 4 weeks ago
config: nios2-randconfig-s032-20220310 (https://download.01.org/0day-ci/arc=
hive/20220312/202203121205.ECYBXvUy-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commi=
t/?id=3D9983a9d577db415c41099a20a5637ab25dd3c240
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/=
tip/tip.git
        git fetch --no-tags tip locking/core
        git checkout 9983a9d577db415c41099a20a5637ab25dd3c240
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dn=
ios2 SHELL=3D/bin/bash drivers/md/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/md/raid5.c: note: in included file:
   drivers/md/raid5.h:271:14: sparse: sparse: array of flexible structures
   drivers/md/raid5.c:641:40: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   drivers/md/raid5.c:641:40: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid5.c:641:40: sparse:    struct md_rdev *
   drivers/md/raid5.c:643:32: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   drivers/md/raid5.c:643:32: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid5.c:643:32: sparse:    struct md_rdev *
   drivers/md/raid5.c:667:40: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   drivers/md/raid5.c:667:40: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid5.c:667:40: sparse:    struct md_rdev *
   drivers/md/raid5.c:669:32: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
   drivers/md/raid5.c:669:32: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid5.c:669:32: sparse:    struct md_rdev *
   drivers/md/raid5.c:1101:25: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   drivers/md/raid5.c:1101:25: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid5.c:1101:25: sparse:    struct md_rdev *
   drivers/md/raid5.c:1103:24: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   drivers/md/raid5.c:1103:24: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid5.c:1103:24: sparse:    struct md_rdev *
   drivers/md/raid5.c:3563:32: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   drivers/md/raid5.c:3563:32: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid5.c:3563:32: sparse:    struct md_rdev *
   drivers/md/raid5.c:3689:48: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   drivers/md/raid5.c:3689:48: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid5.c:3689:48: sparse:    struct md_rdev *
   drivers/md/raid5.c:3696:32: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   drivers/md/raid5.c:3696:32: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid5.c:3696:32: sparse:    struct md_rdev *
   drivers/md/raid5.c:3718:16: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   drivers/md/raid5.c:3718:16: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid5.c:3718:16: sparse:    struct md_rdev *
   drivers/md/raid5.c:4646:24: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   drivers/md/raid5.c:4646:24: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid5.c:4646:24: sparse:    struct md_rdev *
   drivers/md/raid5.c:4657:32: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   drivers/md/raid5.c:4657:32: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid5.c:4657:32: sparse:    struct md_rdev *
   drivers/md/raid5.c:4704:49: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   drivers/md/raid5.c:4704:49: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid5.c:4704:49: sparse:    struct md_rdev *
   drivers/md/raid5.c:4717:49: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   drivers/md/raid5.c:4717:49: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid5.c:4717:49: sparse:    struct md_rdev *
   drivers/md/raid5.c:4726:49: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   drivers/md/raid5.c:4726:49: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid5.c:4726:49: sparse:    struct md_rdev *
   drivers/md/raid5.c:4748:40: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   drivers/md/raid5.c:4748:40: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid5.c:4748:40: sparse:    struct md_rdev *
   drivers/md/raid5.c:5419:16: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   drivers/md/raid5.c:5419:16: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid5.c:5419:16: sparse:    struct md_rdev *
   drivers/md/raid5.c:5422:24: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   drivers/md/raid5.c:5422:24: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid5.c:5422:24: sparse:    struct md_rdev *
   drivers/md/raid5.c:7070:9: sparse: sparse: cast removes address space '_=
_percpu' of expression
   drivers/md/raid5.c:7070:9: sparse: sparse: incompatible types in compari=
son expression (different address spaces):
>> drivers/md/raid5.c:7070:9: sparse:    struct local_lock_t [usertype] **
>> drivers/md/raid5.c:7070:9: sparse:    struct local_lock_t [noderef] __pe=
rcpu **
   drivers/md/raid5.c:7842:40: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   drivers/md/raid5.c:7842:40: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid5.c:7842:40: sparse:    struct md_rdev *
   drivers/md/raid5.c:8055:25: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   drivers/md/raid5.c:8055:25: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid5.c:8055:25: sparse:    struct md_rdev *
   drivers/md/raid5.c:8071:25: sparse: sparse: incompatible types in compar=
ison expression (different address spaces):
   drivers/md/raid5.c:8071:25: sparse:    struct md_rdev [noderef] __rcu *
   drivers/md/raid5.c:8071:25: sparse:    struct md_rdev *
   drivers/md/raid5.c:1476:16: sparse: sparse: dereference of noderef expre=
ssion
   drivers/md/raid5.c:1476:39: sparse: sparse: dereference of noderef expre=
ssion
   drivers/md/raid5.c:2208:54: sparse: sparse: dereference of noderef expre=
ssion
   drivers/md/raid5.c:2419:16: sparse: sparse: dereference of noderef expre=
ssion
   drivers/md/raid5.c:2421:9: sparse: sparse: dereference of noderef expres=
sion
   drivers/md/raid5.c:2422:9: sparse: sparse: dereference of noderef expres=
sion
   drivers/md/raid5.c:7046:23: sparse: sparse: dereference of noderef expre=
ssion
   drivers/md/raid5.c:7046:23: sparse: sparse: dereference of noderef expre=
ssion
   drivers/md/raid5.c:7047:9: sparse: sparse: dereference of noderef expres=
sion
   drivers/md/raid5.c:7048:16: sparse: sparse: dereference of noderef expre=
ssion
   drivers/md/raid5.c:7049:9: sparse: sparse: dereference of noderef expres=
sion
   drivers/md/raid5.c:7054:34: sparse: sparse: dereference of noderef expre=
ssion
   drivers/md/raid5.c:7055:17: sparse: sparse: dereference of noderef expre=
ssion
   drivers/md/raid5.c:7056:22: sparse: sparse: dereference of noderef expre=
ssion
   drivers/md/raid5.c:97:9: sparse: sparse: context imbalance in 'raid5_qui=
esce' - different lock contexts for basic block

vim +7070 drivers/md/raid5.c

789b5e03152844 Oleg Nesterov   2014-02-06  7051  =

789b5e03152844 Oleg Nesterov   2014-02-06  7052  static int alloc_scratch_b=
uffer(struct r5conf *conf, struct raid5_percpu *percpu)
789b5e03152844 Oleg Nesterov   2014-02-06  7053  {
b330e6a49dc3e9 Kent Overstreet 2019-03-11  7054  	if (conf->level =3D=3D 6 =
&& !percpu->spare_page) {
789b5e03152844 Oleg Nesterov   2014-02-06  7055  		percpu->spare_page =3D a=
lloc_page(GFP_KERNEL);
b330e6a49dc3e9 Kent Overstreet 2019-03-11  7056  		if (!percpu->spare_page)
b330e6a49dc3e9 Kent Overstreet 2019-03-11  7057  			return -ENOMEM;
b330e6a49dc3e9 Kent Overstreet 2019-03-11  7058  	}
b330e6a49dc3e9 Kent Overstreet 2019-03-11  7059  =

b330e6a49dc3e9 Kent Overstreet 2019-03-11  7060  	if (scribble_alloc(percpu,
b330e6a49dc3e9 Kent Overstreet 2019-03-11  7061  			   max(conf->raid_disks,
738a273806ee05 NeilBrown       2015-05-08  7062  			       conf->previous_r=
aid_disks),
738a273806ee05 NeilBrown       2015-05-08  7063  			   max(conf->chunk_sect=
ors,
738a273806ee05 NeilBrown       2015-05-08  7064  			       conf->prev_chunk=
_sectors)
c911c46c017c74 Yufen Yu        2020-07-18  7065  			   / RAID5_STRIPE_SECTO=
RS(conf))) {
789b5e03152844 Oleg Nesterov   2014-02-06  7066  		free_scratch_buffer(conf=
, percpu);
789b5e03152844 Oleg Nesterov   2014-02-06  7067  		return -ENOMEM;
789b5e03152844 Oleg Nesterov   2014-02-06  7068  	}
789b5e03152844 Oleg Nesterov   2014-02-06  7069  =

770b1d216d7371 Davidlohr Bueso 2021-11-15 @7070  	local_lock_init(&percpu->=
lock);
789b5e03152844 Oleg Nesterov   2014-02-06  7071  	return 0;
789b5e03152844 Oleg Nesterov   2014-02-06  7072  }
789b5e03152844 Oleg Nesterov   2014-02-06  7073  =


:::::: The code at line 7070 was first introduced by commit
:::::: 770b1d216d7371c94c88713824da4be4bc39a4e0 md/raid5: play nice with PR=
EEMPT_RT

:::::: TO: Davidlohr Bueso <dave@stgolabs.net>
:::::: CC: Song Liu <song@kernel.org>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2233295200068846603==--

