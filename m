Content-Type: multipart/mixed; boundary="===============7195621893607650448=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/dma/bestcomm/bestcomm.c:98:30: sparse: sparse: incorrect type in argument 1 (different address spaces)
Date: Tue, 09 Aug 2022 04:24:48 +0800
Message-ID: <202208090444.W5cGtaTc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7195621893607650448==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Anatolij Gustschin <agust@denx.de>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c8a684e2e110376c58f0bfa30fb3855d1e319670
commit: adec566b05288f2787a1f88dbaf77ed8b0c644fa dmaengine: bestcomm: fix s=
ystem boot lockups
date:   10 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 10 months ago
config: powerpc-randconfig-s031-20220808 (https://download.01.org/0day-ci/a=
rchive/20220809/202208090444.W5cGtaTc-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dadec566b05288f2787a1f88dbaf77ed8b0c644fa
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout adec566b05288f2787a1f88dbaf77ed8b0c644fa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dp=
owerpc SHELL=3D/bin/bash arch/powerpc/platforms/52xx/ drivers/dma/bestcomm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/dma/bestcomm/bestcomm.c:98:30: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@     expected void volatile [noder=
ef] __iomem *a @@     got struct bcom_bd *bd @@
   drivers/dma/bestcomm/bestcomm.c:98:30: sparse:     expected void volatil=
e [noderef] __iomem *a
   drivers/dma/bestcomm/bestcomm.c:98:30: sparse:     got struct bcom_bd *bd
>> drivers/dma/bestcomm/bestcomm.c:189:19: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void volatile [node=
ref] __iomem *a @@     got unsigned int [usertype] *[assigned] var @@
   drivers/dma/bestcomm/bestcomm.c:189:19: sparse:     expected void volati=
le [noderef] __iomem *a
   drivers/dma/bestcomm/bestcomm.c:189:19: sparse:     got unsigned int [us=
ertype] *[assigned] var
>> drivers/dma/bestcomm/bestcomm.c:190:19: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void volatile [node=
ref] __iomem *a @@     got unsigned int [usertype] *[assigned] inc @@
   drivers/dma/bestcomm/bestcomm.c:190:19: sparse:     expected void volati=
le [noderef] __iomem *a
   drivers/dma/bestcomm/bestcomm.c:190:19: sparse:     got unsigned int [us=
ertype] *[assigned] inc
>> drivers/dma/bestcomm/bestcomm.c:196:21: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void volatile [node=
ref] __iomem *d @@     got unsigned int [usertype] *[assigned] desc @@
   drivers/dma/bestcomm/bestcomm.c:196:21: sparse:     expected void volati=
le [noderef] __iomem *d
   drivers/dma/bestcomm/bestcomm.c:196:21: sparse:     got unsigned int [us=
ertype] *[assigned] desc
>> drivers/dma/bestcomm/bestcomm.c:197:25: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void volatile [node=
ref] __iomem *d @@     got unsigned int [usertype] * @@
   drivers/dma/bestcomm/bestcomm.c:197:25: sparse:     expected void volati=
le [noderef] __iomem *d
   drivers/dma/bestcomm/bestcomm.c:197:25: sparse:     got unsigned int [us=
ertype] *
>> drivers/dma/bestcomm/bestcomm.c:198:21: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void volatile [node=
ref] __iomem *d @@     got unsigned int [usertype] *[assigned] inc @@
   drivers/dma/bestcomm/bestcomm.c:198:21: sparse:     expected void volati=
le [noderef] __iomem *d
   drivers/dma/bestcomm/bestcomm.c:198:21: sparse:     got unsigned int [us=
ertype] *[assigned] inc
>> drivers/dma/bestcomm/bestcomm.c:305:27: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void volatile [node=
ref] __iomem *a @@     got struct bcom_tdt *tdt @@
   drivers/dma/bestcomm/bestcomm.c:305:27: sparse:     expected void volati=
le [noderef] __iomem *a
   drivers/dma/bestcomm/bestcomm.c:305:27: sparse:     got struct bcom_tdt =
*tdt
>> drivers/dma/bestcomm/bestcomm.c:306:27: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void volatile [node=
ref] __iomem *a @@     got unsigned int [usertype] *ctx @@
   drivers/dma/bestcomm/bestcomm.c:306:27: sparse:     expected void volati=
le [noderef] __iomem *a
   drivers/dma/bestcomm/bestcomm.c:306:27: sparse:     got unsigned int [us=
ertype] *ctx
>> drivers/dma/bestcomm/bestcomm.c:307:27: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void volatile [node=
ref] __iomem *a @@     got unsigned int [usertype] *var @@
   drivers/dma/bestcomm/bestcomm.c:307:27: sparse:     expected void volati=
le [noderef] __iomem *a
   drivers/dma/bestcomm/bestcomm.c:307:27: sparse:     got unsigned int [us=
ertype] *var
>> drivers/dma/bestcomm/bestcomm.c:308:27: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void volatile [node=
ref] __iomem *a @@     got unsigned int [usertype] *fdt @@
   drivers/dma/bestcomm/bestcomm.c:308:27: sparse:     expected void volati=
le [noderef] __iomem *a
   drivers/dma/bestcomm/bestcomm.c:308:27: sparse:     got unsigned int [us=
ertype] *fdt
   drivers/dma/bestcomm/bestcomm.c:311:35: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void volatile [node=
ref] __iomem *d @@     got unsigned int [usertype] * @@
   drivers/dma/bestcomm/bestcomm.c:311:35: sparse:     expected void volati=
le [noderef] __iomem *d
   drivers/dma/bestcomm/bestcomm.c:311:35: sparse:     got unsigned int [us=
ertype] *
--
   drivers/dma/bestcomm/gen_bd.c:169:25: sparse: sparse: function 'bcom_gen=
_bd_tx_init' with external linkage has definition
>> drivers/dma/bestcomm/gen_bd.c:145:22: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void volatile [nodere=
f] __iomem *a @@     got struct bcom_bd *bd @@
   drivers/dma/bestcomm/gen_bd.c:145:22: sparse:     expected void volatile=
 [noderef] __iomem *a
   drivers/dma/bestcomm/gen_bd.c:145:22: sparse:     got struct bcom_bd *bd
   drivers/dma/bestcomm/gen_bd.c:229:22: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void volatile [nodere=
f] __iomem *a @@     got struct bcom_bd *bd @@
   drivers/dma/bestcomm/gen_bd.c:229:22: sparse:     expected void volatile=
 [noderef] __iomem *a
   drivers/dma/bestcomm/gen_bd.c:229:22: sparse:     got struct bcom_bd *bd

vim +98 drivers/dma/bestcomm/bestcomm.c

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   48  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   49  struct bcom_task *
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   50  bcom_task_alloc(int bd_count, int bd_size, int priv_size)
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   51  {
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   52  	int i, tasknum =3D -1;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   53  	struct bcom_task *tsk;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   54  =

9560aea4e9d17c arch/powerpc/sysdev/bestcomm/bestcomm.c Grant Likely       2=
008-03-22   55  	/* Don't try to do anything if bestcomm init failed */
9560aea4e9d17c arch/powerpc/sysdev/bestcomm/bestcomm.c Grant Likely       2=
008-03-22   56  	if (!bcom_eng)
9560aea4e9d17c arch/powerpc/sysdev/bestcomm/bestcomm.c Grant Likely       2=
008-03-22   57  		return NULL;
9560aea4e9d17c arch/powerpc/sysdev/bestcomm/bestcomm.c Grant Likely       2=
008-03-22   58  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   59  	/* Get and reserve a task num */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   60  	spin_lock(&bcom_eng->lock);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   61  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   62  	for (i=3D0; i<BCOM_MAX_TASKS; i++)
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   63  		if (!bcom_eng->tdt[i].stop) {	/* we use stop as a marker =
*/
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   64  			bcom_eng->tdt[i].stop =3D 0xfffffffful; /* dummy addr */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   65  			tasknum =3D i;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   66  			break;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   67  		}
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   68  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   69  	spin_unlock(&bcom_eng->lock);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   70  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   71  	if (tasknum < 0)
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   72  		return NULL;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   73  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   74  	/* Allocate our structure */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   75  	tsk =3D kzalloc(sizeof(struct bcom_task) + priv_size, GFP_=
KERNEL);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   76  	if (!tsk)
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   77  		goto error;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   78  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   79  	tsk->tasknum =3D tasknum;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   80  	if (priv_size)
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   81  		tsk->priv =3D (void*)tsk + sizeof(struct bcom_task);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   82  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   83  	/* Get IRQ of that task */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   84  	tsk->irq =3D irq_of_parse_and_map(bcom_eng->ofnode, tsk->t=
asknum);
aa570be6de67f3 drivers/dma/bestcomm/bestcomm.c         Michael Ellerman   2=
016-09-10   85  	if (!tsk->irq)
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   86  		goto error;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   87  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   88  	/* Init the BDs, if needed */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   89  	if (bd_count) {
6da2ec56059c3c drivers/dma/bestcomm/bestcomm.c         Kees Cook          2=
018-06-12   90  		tsk->cookie =3D kmalloc_array(bd_count, sizeof(void *),
6da2ec56059c3c drivers/dma/bestcomm/bestcomm.c         Kees Cook          2=
018-06-12   91  					    GFP_KERNEL);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   92  		if (!tsk->cookie)
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   93  			goto error;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   94  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   95  		tsk->bd =3D bcom_sram_alloc(bd_count * bd_size, 4, &tsk->=
bd_pa);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   96  		if (!tsk->bd)
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   97  			goto error;
adec566b05288f drivers/dma/bestcomm/bestcomm.c         Anatolij Gustschin 2=
021-10-14  @98  		memset_io(tsk->bd, 0x00, bd_count * bd_size);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16   99  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  100  		tsk->num_bd =3D bd_count;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  101  		tsk->bd_size =3D bd_size;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  102  	}
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  103  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  104  	return tsk;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  105  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  106  error:
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  107  	if (tsk) {
aa570be6de67f3 drivers/dma/bestcomm/bestcomm.c         Michael Ellerman   2=
016-09-10  108  		if (tsk->irq)
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  109  			irq_dispose_mapping(tsk->irq);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  110  		bcom_sram_free(tsk->bd);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  111  		kfree(tsk->cookie);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  112  		kfree(tsk);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  113  	}
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  114  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  115  	bcom_eng->tdt[tasknum].stop =3D 0;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  116  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  117  	return NULL;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  118  }
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  119  EXPORT_SYMBOL_GPL(bcom_task_alloc);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  120  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  121  void
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  122  bcom_task_free(struct bcom_task *tsk)
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  123  {
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  124  	/* Stop the task */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  125  	bcom_disable_task(tsk->tasknum);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  126  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  127  	/* Clear TDT */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  128  	bcom_eng->tdt[tsk->tasknum].start =3D 0;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  129  	bcom_eng->tdt[tsk->tasknum].stop  =3D 0;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  130  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  131  	/* Free everything */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  132  	irq_dispose_mapping(tsk->irq);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  133  	bcom_sram_free(tsk->bd);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  134  	kfree(tsk->cookie);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  135  	kfree(tsk);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  136  }
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  137  EXPORT_SYMBOL_GPL(bcom_task_free);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  138  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  139  int
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  140  bcom_load_image(int task, u32 *task_image)
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  141  {
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  142  	struct bcom_task_header *hdr =3D (struct bcom_task_header =
*)task_image;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  143  	struct bcom_tdt *tdt;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  144  	u32 *desc, *var, *inc;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  145  	u32 *desc_src, *var_src, *inc_src;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  146  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  147  	/* Safety checks */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  148  	if (hdr->magic !=3D BCOM_TASK_MAGIC) {
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  149  		printk(KERN_ERR DRIVER_NAME
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  150  			": Trying to load invalid microcode\n");
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  151  		return -EINVAL;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  152  	}
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  153  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  154  	if ((task < 0) || (task >=3D BCOM_MAX_TASKS)) {
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  155  		printk(KERN_ERR DRIVER_NAME
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  156  			": Trying to load invalid task %d\n", task);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  157  		return -EINVAL;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  158  	}
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  159  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  160  	/* Initial load or reload */
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  161  	tdt =3D &bcom_eng->tdt[task];
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  162  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  163  	if (tdt->start) {
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  164  		desc =3D bcom_task_desc(task);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  165  		if (hdr->desc_size !=3D bcom_task_num_descs(task)) {
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  166  			printk(KERN_ERR DRIVER_NAME
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  167  				": Trying to reload wrong task image "
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  168  				"(%d size %d/%d)!\n",
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  169  				task,
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  170  				hdr->desc_size,
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  171  				bcom_task_num_descs(task));
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  172  			return -EINVAL;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  173  		}
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  174  	} else {
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  175  		phys_addr_t start_pa;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  176  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  177  		desc =3D bcom_sram_alloc(hdr->desc_size * sizeof(u32), 4,=
 &start_pa);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  178  		if (!desc)
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  179  			return -ENOMEM;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  180  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  181  		tdt->start =3D start_pa;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  182  		tdt->stop =3D start_pa + ((hdr->desc_size-1) * sizeof(u32=
));
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  183  	}
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  184  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  185  	var =3D bcom_task_var(task);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  186  	inc =3D bcom_task_inc(task);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  187  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  188  	/* Clear & copy */
adec566b05288f drivers/dma/bestcomm/bestcomm.c         Anatolij Gustschin 2=
021-10-14 @189  	memset_io(var, 0x00, BCOM_VAR_SIZE);
adec566b05288f drivers/dma/bestcomm/bestcomm.c         Anatolij Gustschin 2=
021-10-14 @190  	memset_io(inc, 0x00, BCOM_INC_SIZE);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  191  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  192  	desc_src =3D (u32 *)(hdr + 1);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  193  	var_src =3D desc_src + hdr->desc_size;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  194  	inc_src =3D var_src + hdr->var_size;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  195  =

adec566b05288f drivers/dma/bestcomm/bestcomm.c         Anatolij Gustschin 2=
021-10-14 @196  	memcpy_toio(desc, desc_src, hdr->desc_size * sizeof(u32));
adec566b05288f drivers/dma/bestcomm/bestcomm.c         Anatolij Gustschin 2=
021-10-14 @197  	memcpy_toio(var + hdr->first_var, var_src, hdr->var_size *=
 sizeof(u32));
adec566b05288f drivers/dma/bestcomm/bestcomm.c         Anatolij Gustschin 2=
021-10-14 @198  	memcpy_toio(inc, inc_src, hdr->inc_size * sizeof(u32));
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  199  =

2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  200  	return 0;
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  201  }
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  202  EXPORT_SYMBOL_GPL(bcom_load_image);
2f9ea1bde0d12d arch/powerpc/sysdev/bestcomm/bestcomm.c Sylvain Munaut     2=
007-09-16  203  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7195621893607650448==--

