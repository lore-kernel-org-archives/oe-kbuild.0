Content-Type: multipart/mixed; boundary="===============6545667510152358777=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [printk:for-5.15-printk-index 5/9] drivers/mmc/host/davinci_mmc.c:939:15: warning: Access to field 'error' results in a dereference of a null pointer (loaded from variable 'data') [clang-analyzer-core.NullDereference]
Date: Sat, 28 Aug 2021 12:41:44 +0800
Message-ID: <202108281234.olgYXZZ0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6545667510152358777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Chris Down <chris@chrisdown.name>
CC: Petr Mladek <pmladek@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git fo=
r-5.15-printk-index
head:   bc17bed5fd73ef1a9aed39f3b0ea26936dad60b8
commit: ad7d61f159db73974f1b0352f21afe04b0bbd920 [5/9] printk: index: Add i=
ndexing support to dev_printk
:::::: branch date: 14 hours ago
:::::: commit date: 6 weeks ago
config: riscv-randconfig-c006-20210827 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 107608=
2a0d97bd5c16a25ee7cf3dbb6ee4b5a9fe)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git/=
commit/?id=3Dad7d61f159db73974f1b0352f21afe04b0bbd920
        git remote add printk https://git.kernel.org/pub/scm/linux/kernel/g=
it/printk/linux.git
        git fetch --no-tags printk for-5.15-printk-index
        git checkout ad7d61f159db73974f1b0352f21afe04b0bbd920
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/ext4/resize.c:1232:13: note: Left side of '&&' is false
                           gdb_bh =3D sbi_array_rcu_deref(sbi, s_group_desc,
                                    ^
   fs/ext4/ext4.h:1729:21: note: expanded from macro 'sbi_array_rcu_deref'
           _v =3D ((typeof(_v)*)rcu_dereference((sbi)->field))[index];     =
     \
                              ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:528:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:390:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:318:11: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                           ^
   fs/ext4/resize.c:1232:13: note: Loop condition is false.  Exiting loop
                           gdb_bh =3D sbi_array_rcu_deref(sbi, s_group_desc,
                                    ^
   fs/ext4/ext4.h:1729:21: note: expanded from macro 'sbi_array_rcu_deref'
           _v =3D ((typeof(_v)*)rcu_dereference((sbi)->field))[index];     =
     \
                              ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:528:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:390:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:316:2: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
           do {                                                            \
           ^
   fs/ext4/resize.c:1234:4: note: Loop condition is false.  Exiting loop
                           BUFFER_TRACE(gdb_bh, "get_write_access");
                           ^
   include/linux/jbd2.h:1835:32: note: expanded from macro 'BUFFER_TRACE'
   #define BUFFER_TRACE(bh, info)  do {} while (0)
                                   ^
   fs/ext4/resize.c:1237:8: note: Assuming 'err' is 0
                           if (!err && reserved_gdb && ext4_bg_num_gdb(sb, =
group))
                               ^~~~
   fs/ext4/resize.c:1237:8: note: Left side of '&&' is true
   fs/ext4/resize.c:1237:16: note: Assuming 'reserved_gdb' is not equal to 0
                           if (!err && reserved_gdb && ext4_bg_num_gdb(sb, =
group))
                                       ^~~~~~~~~~~~
   fs/ext4/resize.c:1237:8: note: Left side of '&&' is true
                           if (!err && reserved_gdb && ext4_bg_num_gdb(sb, =
group))
                               ^
   fs/ext4/resize.c:1237:32: note: Assuming the condition is true
                           if (!err && reserved_gdb && ext4_bg_num_gdb(sb, =
group))
                                                       ^~~~~~~~~~~~~~~~~~~~=
~~~~~~
   fs/ext4/resize.c:1237:4: note: Taking true branch
                           if (!err && reserved_gdb && ext4_bg_num_gdb(sb, =
group))
                           ^
   fs/ext4/resize.c:1238:38: note: Passing null pointer value via 2nd param=
eter 'inode'
                                   err =3D reserve_backup_gdb(handle, resiz=
e_inode, group);
                                                                    ^~~~~~~=
~~~~~
   fs/ext4/resize.c:1238:11: note: Calling 'reserve_backup_gdb'
                                   err =3D reserve_backup_gdb(handle, resiz=
e_inode, group);
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
   fs/ext4/resize.c:988:27: note: Access to field 'i_sb' results in a deref=
erence of a null pointer (loaded from variable 'inode')
           struct super_block *sb =3D inode->i_sb;
                                    ^~~~~
   fs/ext4/resize.c:1921:3: warning: Value stored to 'err' is never read [c=
lang-analyzer-deadcode.DeadStores]
                   err =3D ret;
                   ^     ~~~
   fs/ext4/resize.c:1921:3: note: Value stored to 'err' is never read
                   err =3D ret;
                   ^     ~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   sound/sound_core.c:406:9: warning: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                                   strcat(_name, "-");
                                   ^~~~~~
   sound/sound_core.c:406:9: note: Call to function 'strcat' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcat'. CWE-119
                                   strcat(_name, "-");
                                   ^~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/mmc/host/mtk-sd.c:671:2: warning: Value stored to 'sg' is never =
read [clang-analyzer-deadcode.DeadStores]
           sg =3D data->sg;
           ^    ~~~~~~~~
   drivers/mmc/host/mtk-sd.c:671:2: note: Value stored to 'sg' is never read
           sg =3D data->sg;
           ^    ~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/mmc/host/davinci_mmc.c:939:15: warning: Access to field 'error' =
results in a dereference of a null pointer (loaded from variable 'data') [c=
lang-analyzer-core.NullDereference]
                   data->error =3D -ETIMEDOUT;
                   ~~~~        ^
   drivers/mmc/host/davinci_mmc.c:870:2: note: 'data' initialized here
           struct mmc_data *data =3D host->data;
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/davinci_mmc.c:872:6: note: Assuming field 'cmd' is not =
equal to NULL
           if (host->cmd =3D=3D NULL && host->data =3D=3D NULL) {
               ^~~~~~~~~~~~~~~~~
   drivers/mmc/host/davinci_mmc.c:872:24: note: Left side of '&&' is false
           if (host->cmd =3D=3D NULL && host->data =3D=3D NULL) {
                                 ^
   drivers/mmc/host/davinci_mmc.c:881:11: note: Loop condition is false.  E=
xiting loop
           status =3D readl(host->base + DAVINCI_MMCST0);
                    ^
   arch/riscv/include/asm/mmio.h:140:30: note: expanded from macro 'readl'
   #define readl(c)        ({ u32 __v; __io_br(); __v =3D readl_cpu(c); __i=
o_ar(__v); __v; })
                                       ^
   arch/riscv/include/asm/mmio.h:133:19: note: expanded from macro '__io_br'
   #define __io_br()       do {} while (0)
                           ^
   drivers/mmc/host/davinci_mmc.c:891:6: note: Assuming field 'bytes_left' =
is 0
           if (host->bytes_left && (status & (MMCST0_DXRDY | MMCST0_DRRDY))=
) {
               ^~~~~~~~~~~~~~~~
   drivers/mmc/host/davinci_mmc.c:891:23: note: Left side of '&&' is false
           if (host->bytes_left && (status & (MMCST0_DXRDY | MMCST0_DRRDY))=
) {
                                ^
   drivers/mmc/host/davinci_mmc.c:920:6: note: Assuming the condition is tr=
ue
           if (qstatus & MMCST0_DATDNE) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/davinci_mmc.c:920:2: note: Taking true branch
           if (qstatus & MMCST0_DATDNE) {
           ^
   drivers/mmc/host/davinci_mmc.c:922:7: note: Assuming 'data' is equal to =
NULL
                   if (data !=3D NULL) {
                       ^~~~~~~~~~~~
   drivers/mmc/host/davinci_mmc.c:922:3: note: Taking false branch
                   if (data !=3D NULL) {
                   ^
   drivers/mmc/host/davinci_mmc.c:932:4: note: Loop condition is false.  Ex=
iting loop
                           dev_err(mmc_dev(host->mmc),
                           ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:425:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:404:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/mmc/host/davinci_mmc.c:937:6: note: Assuming the condition is tr=
ue
           if (qstatus & MMCST0_TOUTRD) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/davinci_mmc.c:937:2: note: Taking true branch
           if (qstatus & MMCST0_TOUTRD) {
           ^
   drivers/mmc/host/davinci_mmc.c:939:15: note: Access to field 'error' res=
ults in a dereference of a null pointer (loaded from variable 'data')
                   data->error =3D -ETIMEDOUT;
                   ~~~~        ^
   drivers/mmc/host/davinci_mmc.c:951:15: warning: Access to field 'error' =
results in a dereference of a null pointer (loaded from variable 'data') [c=
lang-analyzer-core.NullDereference]
                   data->error =3D -EILSEQ;
                   ~~~~        ^
   drivers/mmc/host/davinci_mmc.c:870:2: note: 'data' initialized here
           struct mmc_data *data =3D host->data;
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/davinci_mmc.c:872:6: note: Assuming field 'cmd' is not =
equal to NULL
           if (host->cmd =3D=3D NULL && host->data =3D=3D NULL) {
               ^~~~~~~~~~~~~~~~~
   drivers/mmc/host/davinci_mmc.c:872:24: note: Left side of '&&' is false
           if (host->cmd =3D=3D NULL && host->data =3D=3D NULL) {
                                 ^
   drivers/mmc/host/davinci_mmc.c:881:11: note: Loop condition is false.  E=
xiting loop
           status =3D readl(host->base + DAVINCI_MMCST0);
                    ^
   arch/riscv/include/asm/mmio.h:140:30: note: expanded from macro 'readl'
   #define readl(c)        ({ u32 __v; __io_br(); __v =3D readl_cpu(c); __i=
o_ar(__v); __v; })
                                       ^
   arch/riscv/include/asm/mmio.h:133:19: note: expanded from macro '__io_br'
   #define __io_br()       do {} while (0)
                           ^
   drivers/mmc/host/davinci_mmc.c:891:6: note: Assuming field 'bytes_left' =
is 0
           if (host->bytes_left && (status & (MMCST0_DXRDY | MMCST0_DRRDY))=
) {
               ^~~~~~~~~~~~~~~~
   drivers/mmc/host/davinci_mmc.c:891:23: note: Left side of '&&' is false
           if (host->bytes_left && (status & (MMCST0_DXRDY | MMCST0_DRRDY))=
) {
                                ^
   drivers/mmc/host/davinci_mmc.c:920:6: note: Assuming the condition is tr=
ue
           if (qstatus & MMCST0_DATDNE) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/davinci_mmc.c:920:2: note: Taking true branch
           if (qstatus & MMCST0_DATDNE) {
           ^
   drivers/mmc/host/davinci_mmc.c:922:7: note: Assuming 'data' is equal to =
NULL
                   if (data !=3D NULL) {

vim +939 drivers/mmc/host/davinci_mmc.c

f9db92cb8084c7 Alagu Sankar        2011-01-03   863  =

b4cff4549b7a8c Vipin Bhandari      2009-12-14   864  static irqreturn_t mmc=
_davinci_irq(int irq, void *dev_id)
b4cff4549b7a8c Vipin Bhandari      2009-12-14   865  {
b4cff4549b7a8c Vipin Bhandari      2009-12-14   866  	struct mmc_davinci_ho=
st *host =3D (struct mmc_davinci_host *)dev_id;
b4cff4549b7a8c Vipin Bhandari      2009-12-14   867  	unsigned int status, =
qstatus;
b4cff4549b7a8c Vipin Bhandari      2009-12-14   868  	int end_command =3D 0;
b4cff4549b7a8c Vipin Bhandari      2009-12-14   869  	int end_transfer =3D =
0;
b4cff4549b7a8c Vipin Bhandari      2009-12-14   870  	struct mmc_data *data=
 =3D host->data;
b4cff4549b7a8c Vipin Bhandari      2009-12-14   871  =

b4cff4549b7a8c Vipin Bhandari      2009-12-14   872  	if (host->cmd =3D=3D =
NULL && host->data =3D=3D NULL) {
b4cff4549b7a8c Vipin Bhandari      2009-12-14   873  		status =3D readl(hos=
t->base + DAVINCI_MMCST0);
b4cff4549b7a8c Vipin Bhandari      2009-12-14   874  		dev_dbg(mmc_dev(host=
->mmc),
b4cff4549b7a8c Vipin Bhandari      2009-12-14   875  			"Spurious interrupt=
 0x%04x\n", status);
b4cff4549b7a8c Vipin Bhandari      2009-12-14   876  		/* Disable the inter=
rupt from mmcsd */
b4cff4549b7a8c Vipin Bhandari      2009-12-14   877  		writel(0, host->base=
 + DAVINCI_MMCIM);
b4cff4549b7a8c Vipin Bhandari      2009-12-14   878  		return IRQ_NONE;
b4cff4549b7a8c Vipin Bhandari      2009-12-14   879  	}
b4cff4549b7a8c Vipin Bhandari      2009-12-14   880  =

b4cff4549b7a8c Vipin Bhandari      2009-12-14   881  	status =3D readl(host=
->base + DAVINCI_MMCST0);
b4cff4549b7a8c Vipin Bhandari      2009-12-14   882  	qstatus =3D status;
b4cff4549b7a8c Vipin Bhandari      2009-12-14   883  =

b4cff4549b7a8c Vipin Bhandari      2009-12-14   884  	/* handle FIFO first =
when using PIO for data.
b4cff4549b7a8c Vipin Bhandari      2009-12-14   885  	 * bytes_left will de=
crease to zero as I/O progress and status will
b4cff4549b7a8c Vipin Bhandari      2009-12-14   886  	 * read zero over ite=
ration because this controller status
b4cff4549b7a8c Vipin Bhandari      2009-12-14   887  	 * register(MMCST0) r=
eports any status only once and it is cleared
b4cff4549b7a8c Vipin Bhandari      2009-12-14   888  	 * by read. So, it is=
 not unbouned loop even in the case of
b4cff4549b7a8c Vipin Bhandari      2009-12-14   889  	 * non-dma.
b4cff4549b7a8c Vipin Bhandari      2009-12-14   890  	 */
be7b5622e60818 Ido Yariv           2012-03-11   891  	if (host->bytes_left =
&& (status & (MMCST0_DXRDY | MMCST0_DRRDY))) {
be7b5622e60818 Ido Yariv           2012-03-11   892  		unsigned long im_val;
be7b5622e60818 Ido Yariv           2012-03-11   893  =

be7b5622e60818 Ido Yariv           2012-03-11   894  		/*
be7b5622e60818 Ido Yariv           2012-03-11   895  		 * If interrupts fir=
e during the following loop, they will be
be7b5622e60818 Ido Yariv           2012-03-11   896  		 * handled by the ha=
ndler, but the PIC will still buffer these.
be7b5622e60818 Ido Yariv           2012-03-11   897  		 * As a result, the =
handler will be called again to serve these
be7b5622e60818 Ido Yariv           2012-03-11   898  		 * needlessly. In or=
der to avoid these spurious interrupts,
be7b5622e60818 Ido Yariv           2012-03-11   899  		 * keep interrupts m=
asked during the loop.
be7b5622e60818 Ido Yariv           2012-03-11   900  		 */
be7b5622e60818 Ido Yariv           2012-03-11   901  		im_val =3D readl(hos=
t->base + DAVINCI_MMCIM);
be7b5622e60818 Ido Yariv           2012-03-11   902  		writel(0, host->base=
 + DAVINCI_MMCIM);
be7b5622e60818 Ido Yariv           2012-03-11   903  =

be7b5622e60818 Ido Yariv           2012-03-11   904  		do {
b4cff4549b7a8c Vipin Bhandari      2009-12-14   905  			davinci_fifo_data_t=
rans(host, rw_threshold);
b4cff4549b7a8c Vipin Bhandari      2009-12-14   906  			status =3D readl(ho=
st->base + DAVINCI_MMCST0);
b4cff4549b7a8c Vipin Bhandari      2009-12-14   907  			qstatus |=3D status;
be7b5622e60818 Ido Yariv           2012-03-11   908  		} while (host->bytes=
_left &&
be7b5622e60818 Ido Yariv           2012-03-11   909  			 (status & (MMCST0_=
DXRDY | MMCST0_DRRDY)));
be7b5622e60818 Ido Yariv           2012-03-11   910  =

be7b5622e60818 Ido Yariv           2012-03-11   911  		/*
be7b5622e60818 Ido Yariv           2012-03-11   912  		 * If an interrupt i=
s pending, it is assumed it will fire when
be7b5622e60818 Ido Yariv           2012-03-11   913  		 * it is unmasked. T=
his assumption is also taken when the MMCIM
be7b5622e60818 Ido Yariv           2012-03-11   914  		 * is first set. Oth=
erwise, writing to MMCIM after reading the
be7b5622e60818 Ido Yariv           2012-03-11   915  		 * status is race-pr=
one.
be7b5622e60818 Ido Yariv           2012-03-11   916  		 */
be7b5622e60818 Ido Yariv           2012-03-11   917  		writel(im_val, host-=
>base + DAVINCI_MMCIM);
b4cff4549b7a8c Vipin Bhandari      2009-12-14   918  	}
b4cff4549b7a8c Vipin Bhandari      2009-12-14   919  =

b4cff4549b7a8c Vipin Bhandari      2009-12-14   920  	if (qstatus & MMCST0_=
DATDNE) {
b4cff4549b7a8c Vipin Bhandari      2009-12-14   921  		/* All blocks sent/r=
eceived, and CRC checks passed */
b4cff4549b7a8c Vipin Bhandari      2009-12-14   922  		if (data !=3D NULL) {
b4cff4549b7a8c Vipin Bhandari      2009-12-14   923  			if ((host->do_dma =
=3D=3D 0) && (host->bytes_left > 0)) {
b4cff4549b7a8c Vipin Bhandari      2009-12-14   924  				/* if datasize < r=
w_threshold
b4cff4549b7a8c Vipin Bhandari      2009-12-14   925  				 * no RX ints are =
generated
b4cff4549b7a8c Vipin Bhandari      2009-12-14   926  				 */
b4cff4549b7a8c Vipin Bhandari      2009-12-14   927  				davinci_fifo_data_=
trans(host, host->bytes_left);
b4cff4549b7a8c Vipin Bhandari      2009-12-14   928  			}
b4cff4549b7a8c Vipin Bhandari      2009-12-14   929  			end_transfer =3D 1;
b4cff4549b7a8c Vipin Bhandari      2009-12-14   930  			data->bytes_xfered =
=3D data->blocks * data->blksz;
b4cff4549b7a8c Vipin Bhandari      2009-12-14   931  		} else {
b4cff4549b7a8c Vipin Bhandari      2009-12-14   932  			dev_err(mmc_dev(hos=
t->mmc),
b4cff4549b7a8c Vipin Bhandari      2009-12-14   933  					"DATDNE with no h=
ost->data\n");
b4cff4549b7a8c Vipin Bhandari      2009-12-14   934  		}
b4cff4549b7a8c Vipin Bhandari      2009-12-14   935  	}
b4cff4549b7a8c Vipin Bhandari      2009-12-14   936  =

b4cff4549b7a8c Vipin Bhandari      2009-12-14   937  	if (qstatus & MMCST0_=
TOUTRD) {
b4cff4549b7a8c Vipin Bhandari      2009-12-14   938  		/* Read data timeout=
 */
b4cff4549b7a8c Vipin Bhandari      2009-12-14  @939  		data->error =3D -ETI=
MEDOUT;
b4cff4549b7a8c Vipin Bhandari      2009-12-14   940  		end_transfer =3D 1;
b4cff4549b7a8c Vipin Bhandari      2009-12-14   941  =

b4cff4549b7a8c Vipin Bhandari      2009-12-14   942  		dev_dbg(mmc_dev(host=
->mmc),
b4cff4549b7a8c Vipin Bhandari      2009-12-14   943  			"read data timeout,=
 status %x\n",
b4cff4549b7a8c Vipin Bhandari      2009-12-14   944  			qstatus);
b4cff4549b7a8c Vipin Bhandari      2009-12-14   945  =

b4cff4549b7a8c Vipin Bhandari      2009-12-14   946  		davinci_abort_data(h=
ost, data);
b4cff4549b7a8c Vipin Bhandari      2009-12-14   947  	}
b4cff4549b7a8c Vipin Bhandari      2009-12-14   948  =

b4cff4549b7a8c Vipin Bhandari      2009-12-14   949  	if (qstatus & (MMCST0=
_CRCWR | MMCST0_CRCRD)) {
b4cff4549b7a8c Vipin Bhandari      2009-12-14   950  		/* Data CRC error */
b4cff4549b7a8c Vipin Bhandari      2009-12-14   951  		data->error =3D -EIL=
SEQ;
b4cff4549b7a8c Vipin Bhandari      2009-12-14   952  		end_transfer =3D 1;
b4cff4549b7a8c Vipin Bhandari      2009-12-14   953  =

b4cff4549b7a8c Vipin Bhandari      2009-12-14   954  		/* NOTE:  this contr=
oller uses CRCWR to report both CRC
b4cff4549b7a8c Vipin Bhandari      2009-12-14   955  		 * errors and timeou=
ts (on writes).  MMCDRSP values are
b4cff4549b7a8c Vipin Bhandari      2009-12-14   956  		 * only weakly docum=
ented, but 0x9f was clearly a timeout
b4cff4549b7a8c Vipin Bhandari      2009-12-14   957  		 * case and the two =
three-bit patterns in various SD specs
b4cff4549b7a8c Vipin Bhandari      2009-12-14   958  		 * (101, 010) aren't=
 part of it ...
b4cff4549b7a8c Vipin Bhandari      2009-12-14   959  		 */
b4cff4549b7a8c Vipin Bhandari      2009-12-14   960  		if (qstatus & MMCST0=
_CRCWR) {
b4cff4549b7a8c Vipin Bhandari      2009-12-14   961  			u32 temp =3D readb(=
host->base + DAVINCI_MMCDRSP);
b4cff4549b7a8c Vipin Bhandari      2009-12-14   962  =

b4cff4549b7a8c Vipin Bhandari      2009-12-14   963  			if (temp =3D=3D 0x9=
f)
b4cff4549b7a8c Vipin Bhandari      2009-12-14   964  				data->error =3D -E=
TIMEDOUT;
b4cff4549b7a8c Vipin Bhandari      2009-12-14   965  		}
b4cff4549b7a8c Vipin Bhandari      2009-12-14   966  		dev_dbg(mmc_dev(host=
->mmc), "data %s %s error\n",
b4cff4549b7a8c Vipin Bhandari      2009-12-14   967  			(qstatus & MMCST0_C=
RCWR) ? "write" : "read",
b4cff4549b7a8c Vipin Bhandari      2009-12-14   968  			(data->error =3D=3D=
 -ETIMEDOUT) ? "timeout" : "CRC");
b4cff4549b7a8c Vipin Bhandari      2009-12-14   969  =

b4cff4549b7a8c Vipin Bhandari      2009-12-14   970  		davinci_abort_data(h=
ost, data);
b4cff4549b7a8c Vipin Bhandari      2009-12-14   971  	}
b4cff4549b7a8c Vipin Bhandari      2009-12-14   972  =

b4cff4549b7a8c Vipin Bhandari      2009-12-14   973  	if (qstatus & MMCST0_=
TOUTRS) {
b4cff4549b7a8c Vipin Bhandari      2009-12-14   974  		/* Command timeout */
b4cff4549b7a8c Vipin Bhandari      2009-12-14   975  		if (host->cmd) {
b4cff4549b7a8c Vipin Bhandari      2009-12-14   976  			dev_dbg(mmc_dev(hos=
t->mmc),
b4cff4549b7a8c Vipin Bhandari      2009-12-14   977  				"CMD%d timeout, st=
atus %x\n",
b4cff4549b7a8c Vipin Bhandari      2009-12-14   978  				host->cmd->opcode,=
 qstatus);
b4cff4549b7a8c Vipin Bhandari      2009-12-14   979  			host->cmd->error =
=3D -ETIMEDOUT;
b4cff4549b7a8c Vipin Bhandari      2009-12-14   980  			if (data) {
b4cff4549b7a8c Vipin Bhandari      2009-12-14   981  				end_transfer =3D 1;
b4cff4549b7a8c Vipin Bhandari      2009-12-14   982  				davinci_abort_data=
(host, data);
b4cff4549b7a8c Vipin Bhandari      2009-12-14   983  			} else
b4cff4549b7a8c Vipin Bhandari      2009-12-14   984  				end_command =3D 1;
b4cff4549b7a8c Vipin Bhandari      2009-12-14   985  		}
b4cff4549b7a8c Vipin Bhandari      2009-12-14   986  	}
b4cff4549b7a8c Vipin Bhandari      2009-12-14   987  =

b4cff4549b7a8c Vipin Bhandari      2009-12-14   988  	if (qstatus & MMCST0_=
CRCRS) {
b4cff4549b7a8c Vipin Bhandari      2009-12-14   989  		/* Command CRC error=
 */
b4cff4549b7a8c Vipin Bhandari      2009-12-14   990  		dev_dbg(mmc_dev(host=
->mmc), "Command CRC error\n");
b4cff4549b7a8c Vipin Bhandari      2009-12-14   991  		if (host->cmd) {
b4cff4549b7a8c Vipin Bhandari      2009-12-14   992  			host->cmd->error =
=3D -EILSEQ;
b4cff4549b7a8c Vipin Bhandari      2009-12-14   993  			end_command =3D 1;
b4cff4549b7a8c Vipin Bhandari      2009-12-14   994  		}
b4cff4549b7a8c Vipin Bhandari      2009-12-14   995  	}
b4cff4549b7a8c Vipin Bhandari      2009-12-14   996  =

b4cff4549b7a8c Vipin Bhandari      2009-12-14   997  	if (qstatus & MMCST0_=
RSPDNE) {
b4cff4549b7a8c Vipin Bhandari      2009-12-14   998  		/* End of command ph=
ase */
8c7f51effd7387 Krzysztof Kozlowski 2020-09-02   999  		end_command =3D host=
->cmd ? 1 : 0;
b4cff4549b7a8c Vipin Bhandari      2009-12-14  1000  	}
b4cff4549b7a8c Vipin Bhandari      2009-12-14  1001  =

b4cff4549b7a8c Vipin Bhandari      2009-12-14  1002  	if (end_command)
b4cff4549b7a8c Vipin Bhandari      2009-12-14  1003  		mmc_davinci_cmd_done=
(host, host->cmd);
b4cff4549b7a8c Vipin Bhandari      2009-12-14  1004  	if (end_transfer)
b4cff4549b7a8c Vipin Bhandari      2009-12-14  1005  		mmc_davinci_xfer_don=
e(host, data);
b4cff4549b7a8c Vipin Bhandari      2009-12-14  1006  	return IRQ_HANDLED;
b4cff4549b7a8c Vipin Bhandari      2009-12-14  1007  }
b4cff4549b7a8c Vipin Bhandari      2009-12-14  1008  =


:::::: The code at line 939 was first introduced by commit
:::::: b4cff4549b7a8c5fc8b88e3493b6287555f0512c DaVinci: MMC: MMC/SD contro=
ller driver for DaVinci family

:::::: TO: Vipin Bhandari <vipin.bhandari@ti.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6545667510152358777==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICB1+KWEAAy5jb25maWcAlDxdc9u2su/nV2ial56Htpbkz3vHDxAJSqhIggFASc4LRrXlVPc4
VkaW0/bfn13wCwBBJbfTaaLdBbBYLPYLy37414cReT8dvmxP+8fty8s/o8+7191xe9o9jZ73L7v/
HcV8lHM1ojFTvwJxun99//u34/7t8dvo6tfx5a8Xvxwfx6Pl7vi6exlFh9fn/ed3GL8/vP7rw78i
nidsrqNIr6iQjOda0Y26/+nxZfv6efRtd3wDuhHO8uvF6OfP+9P//PYb/PfL/ng8HH97efn2RX89
Hv5v93gaXe7G2/H15dPNH09X0+ur6fPN3dPu8XE8GW+fdze3l0+T56fdxfbm3z81q867Ze8vLFaY
1FFK8vn9Py0Qf7a048sL+KfBEYkD5nnZkQOooZ1MbzrSNO6vBzAYnqZxNzy16Ny1gLkFTE5kpudc
cYtBF6F5qYpSBfEsT1lOe6ic60LwhKVUJ7kmSomOhImPes3FsoOohaAEOM8TDv/RikhEwoF+GM2N
fryM3nan96/dEbOcKU3zlSYCdsgypu6nk5YHnhW4sqLSYjrlEUkbQfzUHtusZCAgSVJlAWOakDJV
ZpkAeMGlyklG73/6+fXwugMd+DCqSeSaFKP92+j1cEKem5HyQa5YEXXc1AD8M1JpB18TFS30x5KW
KNR22khwKXVGMy4eUJwkWgRWKSVN2aybbEFWFCQEE5ISLhSuRdK0ES2cw+jt/Y+3f95Ouy+daOc0
p4JF5pjkgq+76WxMxuaCKBRlEB0tWOGeeMwzwnIXJlkWItILRgWy/eBiEyIV5axDwwbzOIUj7TOR
SYZjBhE9fqqpGg6cobIgQtIa1h6Jvd2Yzsp5Iu0j+TDavT6NDs+emIOyBJ1izV6se48HF4HaLiUv
RUQrbextSLGM6lV3th7aTEBXNFfSmxrvqWLRUs8EJ3FEZGBya7RD1krBrL4s8TridbMlYJRM7b+A
2Q3pmVma5xR0zFoYDMfiE97gzKhWuw4AC+CIxywKKH41ioH87DEVNCnTNDAE/kDnoJUg0ZI55tnD
6ISD9D0WHd7YfKEFlUYYIqwFPTm09qdIvAtLAaR/N0dtRAg/Q/JDqu7UW2YQXOaFYKvWXPEkCfLk
TtxNUQhKs0LBRnPqDvQIVjwtc0XEQ0C+NU23t2ZQxGFMD1xZErPfqCh/U9u3/4xOILPRFnh9O21P
b6Pt4+Ph/fW0f/3cCWHFBMxYlJpEZt7qIC3tBB1z0QFWA5PgBXCNj1F0ZxX7zGS0oLEmq7lvJWYy
Rk8YUTDfMFqF5SlZ8IB+QBKt0gL7TPKU2JIUUTmSgZsHIteA659NBWz5gp+abuDeqZBLc2Ywc3og
cOPSzFFbkwCqBypjGoLjXfQQOLFUoP2dtbAwOYXzkHQezVJWW6xaqK5Q2iNeVn+xDn3ZCodHNngB
sYrjc1KOYQTcxgVL1P34xobjuWRkY+MnndRZrpYQeyTUn2NqXzZDxfKYbgLH0FjqSgONvW6OXz7+
uXt6f9kdR8+77en9uHsz4FoOAazjHmRZFFyA3c/LjOgZgaA1cu1kFeoBd+PJrWUeffLOHjuY1jzR
nMxSGods9FzwsrAkXZA5rQyI7SghLIrm3k+9hD862Cxd1rNZ/Jvfei2YojNixNbFWxXOCHWQMV2w
WPbmE3FGAlMlcEE+URG8/zXJopxTlc7CJAUEd0qeGx7TFYvoMLcwBVqgAG/oCAaHZUxGvU2agMc6
cwiGIUoCK9fBSlQdaa+G8W4e3gJsTgzhQMpDKDieaFlwUEH0v4qLsL+qrXOpuOE+HJ8nEnYFhjAi
ilrpk4/Rq4ljImlKHoKLosrBkZioTcRhEs7RH+LfQ/KPNAfHmLFPFEMQjH/gjwxuj5saeGQS/hLe
oZNoVL/BvEfUeN/KxNoTD1p+E6/iiflS6gWhSRXUWheYS7ap4yTb/aCJs26rrVs0TUBGwppkRiAa
x7DOWqiEkM37CYrjeekKHGXFJlrYKxTcnkuyeU7SxNIBw68NMBGxDZALx9wQZmXTjOtSOJaTxCsG
W6jFZQkCJpkRIZgt2iWSPGSyD9GOrFuoEQ/qpWIr50DxyIzJTUI2bQlycY4/m9E4Dpo/I0xUR90m
Fsaz1GWZYnd8Phy/bF8fdyP6bfcKEQsBnxNhzAJBcBXk1SffTRKMgH5wxjaSy6rJGh9hW2eeFURB
EmPpmUzJzN6yTMuw9UVCOBwB3qf2WsNkaOgx5tACdJ9noavokC2IiMGHO8pUJgnkosbbwalyMDxc
2IxWtZVwNGvusbGJ0g573EJKQ3x9ObNzSgG2fuWliVlGwKnlsQZKCd4gvx/fniMgm/vJpTOhljPr
JmaZFcStiBl1P73rXHwFubp2nD7kMOD/7i/+fjb/7C6af9yYxWTqcIvqoMLbiqQpjVRTRsl4TFOP
Yk1AeUxIRdLGH/uTNHFRCacwsz0eRKPRsopUayI7PkYwJAdJSuayj2/COMf0WcD2QmtztMGaBxgT
NhPgpEBJwSsFCGSZ9aGLNYUE1uIlARNNiUgf4Ld27FoxVyhWncItA7s17SLdaAku0tpWFYAeItC3
l91jXZ/tLgqPQJMiCKwXDMIoSFtEwkTQbQGlZIlnyRCKWVvQZrirNinlaHc8bk9bhx9HSakA0RG4
byDcvLGdjS2scH1GHISOYDOXV9OgbehTjicXF0NpX59bs4/iZXtCQzg6/fN1ZwvUaKZYTScsIMMa
eX3JnLjB6D+cb5zydSj8aPEkt3QJ7nexeJB4xyDsn1u3Q2ZWcJ0LE7Let6ZiwVWRliaQtW5FmdN+
doh5gl1uiams86I2dQJXhr4DsyuTVSCRZpYNNfkfUJgEzLgyUGsB5jZalPnSs3iQORNtMZAUpW06
Xanbns7Jq5qNftJj/2A71ORqEDV1RznTXViRzKd7BFghaGNj9epiHHLsdEMj5+QFkQsdl1lxzud2
WaEpQh2A7PAVVfHNemnJYlP+70rkNGFgB0tLLQBiGRBQHXCMmQlSwJrfNla8K0rZC1VKf/gLklRw
/tvPuy/g+y02OoeYBbcyONSMTfbHL39tj7tRfNx/8wITIjJIGzKGrlbxiIdKiB0NX4OmtRVlb5Li
ByYphidRJQSE4Ff5Rou1ysKJRJRd3mw2Ol+BbEMxAaV6lm+UTuxyPudzfJ9hIlsTO76uERh0mwxF
ua60RmOazXPJz6LaSXo0qyJu3ARoyOhn+vdp9/q2/+Nl150Lw+juefu4+/dIvn/9ejieOtVDRaPS
dqEIWYH/14XJBAcRbeEhhmvv7AwJIYIgEEQngmc6ib3pBRb/MqrXghSF44MR25ZifP03iV7KsWxk
qsuCpy4+IoUs0a8aGhfnvmJBmktV9QK0BBeq2Lyp+HWeBhmN2KQ6t4A2IEG9d11E8Pe6YFFfmv/P
cTinUYcMVuaTbXQsnawCQTIq++8Eu8/H7ei5WerJ3Ei7XDVA0KB7d9l5PdweH//cn8CTgkH75Wn3
FQa5hsSxjG62acxnA2v38TtYTw1xPA3daZMfmdAawgnIJrH4EGEJ2MtHl34EWUEFVWFEBdUQlSVN
tu6mt3lkUnmINbjQLP+dRu4TXfcgaMYvOF96SNAFo6JsXvIyEGOCkzfvLPWbrRcbYz0wgQCQJQ+6
erQKEKACVyH4ADKGUBDDdFL4nMsMo/b6EdcXj6AQWEPOVcXhtcQ1CVQBajHh2/EglclMccoQ3JSr
qmXQjYYE3CnIeaydqffIJI0wbz2DAvOdOsXQ8BDDK3ohEKybSrqYgDKnipuXIG/GaPD9zKC/+6Zi
qL7/sJJxlHkZB8GZD25UO8dEEOsAmMJh/hhK8xCHc0Bs6bi/Vhex8lQl8exT8HiczPdc2uynzGb9
xg0pXsR8nVcjIG/jTqtFCqLXWJ4GHx075dS6ojGdoJ1BKQ5ZIrPkCmc3h23P0UGH8gZuqoOQDS8h
LUJ1XW+8nQYomr2FLrgCM6KCs51B+cPBCqC/7NNgYgDGRVDcGKq1vVtMU+0CkRzadJvjmzq3qUCY
OkwTscwjvvrlj+3b7mn0nypa/no8PO9fqrfJrkUAyOrtDK2EezJkTbtM85zblG3OrOQcMrYfYYLF
8mDZ5zsesA0vQLRYJLV9j6knygwZs7KO6gRCEqwx1ZNgCi7GfnSZ1Q9U7c8lhAMSAhb6sXQCne7F
Bk4ZNNRDYWV9JudBoNMD05XhFZ0Lph7OoLQaX9j60hB8gjsYqoM2ePCFXKnUe+7qY7WXaTukdS6l
TQkr/E6EZOtZuPZoyYvhMzDNo+F3ieZNKgLHV7CBxwl7wojLH1i2EIwPigkvUiK9o4fIiBck9cVW
dZVp2IN4MNalFy8W2+Npj7o7UpCUWyEciE+xyr3HK3wrsWMUiOLyjmIQoaMyI7nziudTUCp56DnW
p2ORPDcNif2uoQFCkx2Cj/6BJbEewGy7yDahPXOZBEWRQUoRRCgimIPobAGJOkTIIsiYy9Cc2B0B
mcjSi5MylgPPspwFhmCPA+bDm9vrMDMljMV8tps4FNTEWYgfBHtPm3LOQpTg3ERYrrLMw4wtIdUn
YTk5udt5CmwcvL79DpFlS0JUTXXEu0P2zcw+YmrY+Du41m27gFMmATLGq+fVGNIBXDTIkEW3fJgN
mLeGYpZ8DHfSOVx0Fz4G1bT0VOZj65zy2pbIguXwy3U/rrMnCiK9SIvMKpIYb1gNhqsFYZoda4Nj
otkQ0gQbA7jW9WcZ42vLW7W/q8LI37vH99MWk3Dsjh6ZN7CTcwAzlieZwlA1ZHgrpIwEK0KxWI1P
UuKESRZ4eFKvLQDS4zoT6uoIA9wb9rPdl8Pxn1EWquq1mcyZ15rupQcsdUlCmBAxZCwQGtIQagX/
waCxfTnqrpxPEzJxFZd2C1Y7OoX4vFBGH0xN/LKTGkTwXopuXrsERY10sqFAw22Vp+smMm0mwBIr
iWOhVfu819kgGSoPNpmI2T8YXzP8/vLirn2DO59ThbDA1po8OM4vSJZVj+FhM5ZS8OAEjELwfcK6
9PCjNdyWFSThzlwLbxoXwrPDPaEEUrf2afJTwbkTqnyalaGw8NM04XYH/icTPNtn1EC0G9g2RRZT
SQNzaLKYDg3HRIXAvjYlSrgZRn51U3BnROPm5bjJzEMcYlIZZ2Tq9LLUDyrIU1hgc4jy/C5fqxOG
QDCXA+NqUZhOlKBgW+NTKDTKNGLO5aWRoKq6vK0hGbYVVm8Z7fcex7tv+0e7um/nS5V3a3bu/ajL
8DIItB6sOtFFzFzZWRnaM2KJLDJ/BMLONhS0RCb8k8D3D5ChQ+sT90jD3USIh6MJWQkUQSY9QQ21
0yPuY8nE0pehG10hyC2XI4QobxSNSOZCZoLFoOM0K1OPfbg3qwHuIT9xZymINI+G3TNc/UoJyH7K
AbDHw+vpeHjBrsknX60M50RA1iGWPZFusF1jo/N1KBrFkYmC/47thz6EYmJKepOJiAjzEcrAAVcE
tHDnwgG9XtkWMaDUNeODatdsLPJf4Kz5Nzj3wLZXU7jzmXcsWOAFX5f2NdO8zpPBlcxO1KLM8aWl
oMMsOYSoXYOSBK/tfszigM1EQzjqj8pozCAz72tHg8BTmA6xMhNRJtXMV/eU83wuBxKBava208LX
mdpMvu0/v67x8QRVPDrAX3rPbWaieO1tKF6HBADQ3tYBVnhhpg0/q80Nja/QdPOQc89SsGxz7S0N
ToaI8XSz8SW3pA9SoSf0Fw9T0WKQJiUPoLIRKQbts0XiTWRrJZOsJ6GPER/UY6ztQgBF9G2oflsT
KHCyvkxqaOj0GlTvCLFMlur5usfhkgl2Rv1wV2DkZ0MuhUrPINHK7I3vLgfADdvuOi12SL4Us8Fi
UXVXumMbxJmxxHc0+JJ0cxlu4Tl3p6r85/AHuI/9C6J35+5cxmdsRVnqm5IaHDrBFhe8cZYigrW5
DLJ/hrsq+dw+7bAX06A7n4jfN4X2EJGY5vZboA0NH2aDDBqHM6SDd+v3m8nY5aAChZavMf6Fb9qz
vrv5tsASjhjaaIK+Pn097F9dcUECGpseP5+pBl53jA8kNYaySHpxuofOa0dicdpy0/L39tf+9Pjn
d4MeuYZ/mYoWqu4zsiYdnqLNtDapntlPzQhoMgAXpAVZmwiG5HE4zoa4J7YPOYP0wv9tuix0xNzH
NBjoBe+1GH553B6fRn8c90+f3UavB8hjSYiL+PpmcufkZLeTi7vJIMP4vIpJl90DJ0jBYruLvAZg
VbP65hOfCad2G1hNUNUvtNhotdGmsBVO15r5MCAPsNZNV5puLTc0bLDRAs7i7PwZsqCjmK56shXb
r/snLOpVOtLTrWYKJdnVzaYviqiQ2vXq9ojr27N84WCwf6FTaUjExpBMbZ0e4LnrNtk/1gnniPsF
LVJisEzEg6vvZfUiuaBpYdcIHTBkKmqBbXbtPkCgKiuCKTboUh6T1HmzL0Q1XdPtVX333hQa2+6Z
lwMYt2PHcrLu9SS1IFNliPGrtQ6J9TXStZR1fYHdKNM70W623U+QQCckTWfh1+luAJbRRNVd0+8H
qnfUjKpf3ld2xbI5njTl6wGcB7VOAZ+1YgH+NlzTrgnoStDwPawI0FrX02hBsbshbNwz/ZHLge+t
uymreYqhD7MbNeGRq4iCzp16U/Vbs0nUg8mUZYGxWO/uwdbjHgjL3P117G/uG9g0sHYBefYqswoC
2LRkmjiMNia2tiIqMeGB1zHV1NqqlhFe8JTPAy3zBl03JLuP6v2LXjXKvr+Nnkzhyb75IqtfmfFL
Dp3aXyaqsSaFk9UZ0CbUyZ3xjaJWuIehdcrgh07t/7kEpgyaztjEKh8vWH3Y3ZtMBep7gB4FOvla
IMGIyN5zK8BcuqupUKk0VhbbPLEHcPyOnakB5QUsfvobq5m0JzCPFth44ACremoQteSz3x1A/JCT
jDlcmXK4070HMEdbeWIaM8UKNNB5eagQPF25q8L9Fs4XGgBzu94LItwPRGoAKMbt7c3ddR8xntxe
9qE5V7pwXHfdltDzxvkqo/0cBKG95sems8EM6Z+NGWM+EjRey/4CGDGLdRZ8JTbIhMxE9WbuQCMP
oIiY2xfBAmJRT6qFKHsL1/iU83AmbxMlYU13hFQlcvu3x8CFj68mVxsNAbv97tYBa6PaPfdbKLBv
YbNeZtkD6l3YNSzAswU/N1MsybyeVgO62WwsywxCv5tO5OXF2OFLZZDzSxnqOwCrmnJZQiyBms+c
j38XYLpTy8QbixRB9hJR939XYRD4P3YRRbC3oYjl3e3FhNhfSTKZTu4uLqY+ZGIVTyXNJRcSIsF0
cnUVQMwW45sbp9unwZg17y7CNc9FFl1PrybhA5Lj69twmL+A87Gr3GiKQGKaRsW0zuccVrw2/m6J
td7gc7fJfIfSuyZPdDvH60KtjBNqP9xO7A+2KC0E6FAvi6/goA0Ty8R0wCub9xqc0jkZ6ECqKTKy
ub69uQppVkVwN41MMc8feDfdbC6vz03NYqVv7xYFleFTrMkoHV9chCsgniRacc1uxhfeZapg3sOG
BdRgj8rqf3HSfimrdn9v30bs9e10fP9ivmd9+xOi1afR6bh9fcMlRy/7193oCazL/r+UfVlz3Diy
7l/R042euKdvc18e+oFFsqpoEVUUwaqi/MLQ2JqxYmTJIclnes6vv0iAC5YEy6cj3Hbll8S+JBKJ
zB/wT9UW/n/9tTnM64r61rVGYWJrFTY1uSoeDhuN6nboclfqv7luBq6bRtP0tsxhC7yXDQrLfI8a
j+VkOMsWg/z30MmGfGCLwMqTwyP5XNGgcoQdgXv9RmeZ0NkmO2RDholb4C9BvYM4N9nBIgQpG4F4
/pjTaqSYU4pbPZKjpK1os6rgrtLkJ6W5fOHGv9HcS3AauCjRrluXEoxZ89drN7+xMfGv/7r5ePjx
+F83efE7G+R/k3wKjRs7lYqV71tB6xDaDqHle6N881aBHUOAIecaEMVHFaczoXynmVVyOs2zA5tX
94ccr3M3TYR3rcX54cFs44GCPzsLva427C+zDPwTTAM0w/yaiapHRgG2jcgOHUp6FbQmufDnt4qC
iSP8sZbNoGHqWp/tIOw/PtqMYu0bil+ucZR9mrJPbRVmsGgmmZiNGjk1pSzLIX9bSlmVM+FEMWHk
BLBro/xVp/B1Ivn8mzjE+yj+/nkg9M9QeSk5MYllWSjKsJVNYSPgjRBJhJ1GQavCFiLhv8LebvBF
am83BqeBVlsgmAYtoo8qMbhsyZEzNlg51arsk1jA31Iti9YjdiL6QsTta+m90eNwTdmaSwBL3MN1
JISJCnzxO5QXtl+s85hyhc5hDkK2+foo1YMag3smuiv/ZAco7Ks13MNSrXzS6qsIgVu1u8poldOW
7nPc/nrCmbAu7iNs/bYH0aLRi3HfbsxBcN9ahw09qBremTibbttLWZDed1N3pR7b0a+itgvLLFVj
jlowblJNyg08c9Fn06L4ilMYQbonoZ8nbHZ5VgR0RuORH4z2wfLwT9fGOz3iyXb0TzeycMEQ4hxR
YONQNGJjg+jDiFF0NdZMV/WVnHzHdk/Wf2zcOhpS5H4a/qVPXChLGgca+VLEbtobXWPXGgmJhCSO
+hpdxaddbLyTsfVgsddLvh/aIstNKjtx0otJLgnCm9UnRZ+HCWrzYizbFlM4eqk3rkBhouzmSEsh
3KqQ5juSJ9DwnhJXSdL14b+fPr6xRnj5nW63Ny8PH0///XjzND25lcQY7qViL1uscRLc+sITYm4G
Vle5IlzPH82SOLbv7YUBhaIAAFpenrEe4hg37pHqDLS7Y1vdacXblWDVrwwjIDNa7kYeujnyMvML
MqS6tKr5YVRSVTCi7uly2hswUWPU9GiaEXa8qKZHSvP3QIXXWejzFgAbVVAHFRNcWxh6qu2JKia8
4reqNp9o8tYy0uStaLk5EVjeYaZlI7jI0cKevyzLG9dPg5vftk9vjxf252/SEWVJumrLS2XxqjaB
w+FI71E5djUbRe9mSPHVy4+fH9bDU3VQ/FHzn0wykL3xCdp2C/rYWlHeCkQYdd8qFx4CIRk87RgR
XpjT++PbM7jfnKfju1YWNvtOtGRSqSKVKwgbI9kJG+caG83bsjwM/Z+us/hRwnnu/4yjRGX5dLwX
pVCo5RklCvFSam+bxaz44La83xw1cX6isQ0zR0eJxNCEYZIgDaCxpEtBF6S73RQI/a5zHVm7pwAx
DnhuhAF53dDYdXsEgnctt/AsPUpCBK5vReHMOpcN6KrWqrxr+L5vfgoALOS4Z8yZrcuzKHAjpFQM
SQI3QRAxwLGKkMT3fLQ4APmYaaKUah/7YYp+TXJcelwYmtb1cOc1Iwc9nNnR79IyAlJybdea6exE
0VlMI2eeY1MeYBPAROOZqSEVyGl4LjQj9HTApaGlQ491sa3oHnF3Z6TXHS/Zhd8PIZnxiQgKkPX8
WInYsFzNZi9SQrOp7ii+LS/txlbIAB14PpvE2PjqiDd0x1O+xzuxu9SB4ztocfpOq4zJkmcNm76r
Rd7kBJsP3S3vX8vajeY6r7YUfEyvsHAnLNgN5ghDc4jlXBJCFuKQJEyUjhxl4Ml4VtA4UbXhKFec
xDGeA8fSNUy/rUI4bIpklRXfIhSelm17rkXlrDDymynSd5aCn9jqWfV51doKvjl5ruNiS5rB5Vla
B2yqwTK4yg+JLy+1CtN9knckcwPHVhLBsXNd3DWYytp1tOEy6y/yBr/GDNfeTYuKtxLXPiMN3Vfq
bbDMUJbd9XFQ7rI6w+apyQRXi8oDIYWlz33FNZoMbk+fqo6ecHB3PBbyDqjUsSpK2fZZwbhLxP19
EPWWr6u6YgPGOlsZ3JWYNZPCpHoclyEa0fs4cm3J706Hz9f7urzttp7rxdd6oM4sa1JZH20luGRw
oXuxHv5NXm2qo5xMtnDdBPVup7DlNLQOCEKo6wYWrKy3oOmrmsBWMUJ3XuRj4qvCxX9Yhgbpo1M9
dNS6llaHssePmHIWt7Hr4TkwQYaM0RXwji/YiagLe+fadtFmtNmUbXvfVIrLOKUc1U5WdsgQ/3er
OhU18Ivm5k6uB1+4r4+fokvA6931zeLCpFfXOilJT4e61XYnlE+96VaHnuvHybXdhP+7YicQ39Iw
NEgc6z7BRg5fD6+NEMbnOU6vazYMDstkEGC4BsYrRQR4qK4WsskzyyLbkkG+B1SWv6pWnI6pGFVN
FRWwcz3fMmtoR7YdtdWIidHB9S2NntptlpfGhTrG2idRaGv6hkahE1v2ls9lF3meZeh81jSNiiRw
BMfA1XDehpbFsT3uySjrWNJn54HQtul95np6ZX6N8nOFWg61pAq00clJmpjJaTbBUoAEe1XEoa1s
HzRRxPTR6F4xmjvo/K5rUDyd4jsGJTAomVGrbajYvXAVzP7h7avws/jH8Ua/u1bLzX/C/1UbQUFu
slbTR4z0vGooZp4kYDZEGKwn1mYXM6XR9GMtNYYR4QBM/7bN9Q91jmazlvKxbsBtEW2M5oCZOiB1
EKoUqrx1P9kW0l1GSs0190gZDjQME4ReBwixJCfXuXURZEuS0chuVJNiHT+rUDE9qFDRfnt4e/jy
AS9qdOtDxTjmLNttjF5ZuScG4aiCypwTw0LbX0wa41vI4A+kUDxVgAOeNBmaTr4aFte2VuIYFcpb
vL7X/KELxOwAK/9JTUkf354ens2nIuKYILsgVQYVgxLN87KweX19+Z0D7yJdbidjmuqIFDKyYWO+
dlwHSX4Bp4axDGDghaMrlgY/0iKf44yN5TitMLGhgHpxGZmmx5f6x5z+K0WZtKb2LEblmDopF/pw
ysD3TrCO/xkYOU/4LxSSG97bS8jhoZODS+mIOQmmhsp633WwESGQlYYROkuDJmWlJwnoNMTt6UKD
wTHTSHwCrJWZGQ7t2Oyu3in7gSpXcTJ5+czDcVu+ewrvF3yvNxtkgaxfq4KERLR+UbFzp0H8RE0a
wWnWhM9dEjqOhbzSsUfcqdDUelPYAYy8kio7v3cVbi0+ctytrFI0zw99Y+bKydYWoLkbVTRWFeU6
Zj3zG4y4OD3NzoqwQ2qRoZXf5CTS7l6MFVKIMZ+6bAfD9hdYdTaVCcy8gcNolAlY6Ss4g2bXSjGa
cDfUKIiRHBN3rpSWCWJGQUE4s/UsYGyC8xelxrrQNp7xAaMtK4LvGWXcUjZEm/VCcp7qsK3LfmxZ
NJWF4/ruy36VPX8FWO3YQlBr7pBtTNcTpt2QUbNNBdk+YZrWkNVH8q9kSVQXTjL9+ufkXG5Og6Vh
BXg1jeOlNurEaCtDnc3YlSJV9aZkUt8Adgvm2iuj41A0JQOV62oNYMdDp+0EcLOLadwbi+zEhMoh
k4GRKrbqtcq7tp5uglVIvAw/FMqzdnLsM+GNo5Y/4WRuaagkdH/I+fX1Tunkw7AvauxsPl9TKocI
mTo+pzMG9OH4+SgbiR5OdT2mojcad9R7sjgwaHl8I6RoTaMZWICTcbyHFz1EQ+bQytglHMC3OR02
sp1YRhsIHwN0ziDApe2anMDmJONX0uYP4DlFUZLIHMaBdLFsEsXZdFdy24xm0XxscH2Uco4Trszl
/GeiiHBXHUmJ2YUtbJss8F0k0aHqG8WEWUKYzNoedjmGTcuXAWg+YRYgz87VyVIH0uH3sAuHcBh0
hQl69wrL5BJota1yNqsVd/Yz0lfNvlTdemVNA+94TTuo0Tzyi/2wP09w+dUkWM2R7DAEjno2WegB
bjXbekEv6yas+S9pskFHLK62GATrJq4+zdmfBhtvTMyp7+HdcV5nsuHWRDcp/DkcQh5fFE+OW8xK
jB9Ms6A9sd16CdYyaR1AXDVt0GRdM/sxcGMCJokcVbJw069Me6DysH+YozpAyamf8iY/nz+efjw/
/sWKDeXIvz39wEz14LOs3QhlF0u9rsvDzrImihw46xUGcsIl6Imj7vLAd/C3eBNPk2dpGODXgSrP
X+s81QE2ylWetsStcAAvyl9NhdR93tQFupWv9oea1OjDAnRYln6moxOFeZRlz/98fXv6+Pb9XRlo
7PyxO2quXCdyk2OufxdUsXTW8pjznVWQ8JR/GV3jEnTDysno317fP1adAYlMKzf0Q7OkjBxh92Mz
2vvqxMlIEYeRkRApEte1j6Z91Yf7AtcvA17h18gcovLVLVCaquoDvQQHftOCKag5eq6KKmNT56Qm
RSsahqnRLowc+bjdxwinEWo06kEExExPjpE0K45lAeMBz2/+Dr4aRMfd/Pad9ejzf24ev//98evX
x683f4xcv7++/P6FDey/6X3biX1LpnHhRKN1qWtSIO7puRRhhZm4cehUj2qcre/RtwB8ec2Jl5gD
C96DcoMJ+2fD7fGglXrxpSivybBlqGI4XzeYzHGQlV5iMYEwwdyTjqp/0kBeZys6GePbGYx8sUMr
AOXOc1AzM8BIefbUdIQoFKpEs+58NxEvXEQ4KTPjfbXb1xk40lyZkxS/xOOzjmAv0gTCNpjG2Ger
Y+PLsibQPn0O4sTRi3ZbEmMZl+C6yT3MFodvA6oEykldFKp6LUGNI29lcztHAf5mkqM9VfMYjxZ6
JkebfSoHhaW6+sHFvsOxLQF9BaIyETZBMJ0kBw9GCZsefzgKmHD+gL78AritKq2H21tf61/q517g
OhpxPz560Vda0pVaiqOWRaYYmyk/jWwD21bN0VhL5HSIqqHxLtosZTL53Ymdv1qVPHnz1UnDppEf
bwEd81Qp0wfbpi/7zpXIF9JpGQvnt0ZHmv5+ZbA2CtTXTWpRs/KuZCcOYzuC4IJvLw/PsC/9IWSL
h68PPz5sMsXiDEdJu8uOdCiRxyPHj29COhsTl/Y8NeFR0NMT3urLlSQ9oZKS0vfmij9ufNylBIaA
o47TodJ6SLy71H3vLAiId5Z+EgyTvyep9EaBZf9aeXGgQIEnz5069IqLBGAHx3OufjnSSdVUHFAf
cDXqQ7AGeU4oYWZxOLU0Ox6uC8jDOwyk5WUdFt6VuwEwfEkboH63tADFttbobeoHvV7IrNvHKa6o
599w571+jD9h5d/rV8WcyISpE7UozqevBrYCFUhLZ73wgsCOh7ZoLQCP4tY1PLMcEEcW/QrGRIc9
RQoJUtud5fIH4KrbZMqdMhBPHai96ns9sdFBrCWtyX2spbnWLrj5uJ1kNbUwbMLojjoE1fICWoDa
K2BB3HQukg44iSuq1nJxCP3L3x6pqW1ppRPgDgapNgBji1jS534Ibk+HptT8c0wY3bLdyN7/cIsI
tzbK20cANEU4LCAE/t5WOlWr3SdzttYkdoa6bjRqkySBO7Sy87m5NeTgcRPR0kArrSMMKNi/ci2P
GdjqwCReKjQQLnXa7XA4GsshSI7DtjrZWrvhr1TNeohLYt3Fl8JyBIezB8znAkfZEPSC3lj6umpt
BsNXENj8Vq3csdVi5zDpqsplJfFMGuidNiCYDOrpLSho6jkK6JJff6XULePE3xBz1F6hu5ORFhNa
Qfi3fEBzN2GHf0erGwi1tDpudaqR+J6tnDbvTYBz6wBb3oo4PFGGrNBaybxf5EQYLZiczFGwwjM+
ATnZXtRJWrbNpV5zTdGMgTE81+GLlOU74RBetvlfvnTY8lRndG/BQKGuQYu8LFOPTV5X2y1c8etF
nER1a717cGVtKbsQw9XMen0d67vyQDP217bZZSr0mbUpn396qQAgzbBbmZsZWeztQKCSNJ6mbRz0
z6KtBv7m7fXj9cvr8yiJvavM7I/yFpm3Yl1GXu8Yo6bGY9jwHXB20yl9QrAa7eU9b8/dJC16emF4
S2U37e+T3pOTn5/Av5oUOwicVe0zNYJAg/gN7xr28euXf+na1PKFR0Rr9vdsp7mBR+WHsrsc21sI
3MXv4WiXkQbiNn28svQeb9hhhh2PvvJIfezMxFN9/3+yPzgzs6m4o7Z7aYDJr+0IDDx0pxxDozqI
7jT5QTM+xc5Wv4B/4VkIQLoP4uF0TRW8Wlwmozaek6p5cDqTfJl0ECCIHAt6Im6Im8i+TyZ6kSWh
MzSnBvmmyFIn8kx63bD1WoshMkIkbzyfOri/8Ylp2nBWag3eZuRz+0zv3dDpEXpHtgi5yWqSUZPO
Ui81Jz9z4W4TBxf1J45jXtZHSxCGqRnmMDNUv1nSE5NtRubaKJZzMzVGqSlG1VXRKn3YYcNmhEI7
FGENxk8/rkXvoTD5mINLiSPSA9PIkIu9N1M4vAQZ9gBwS3U81Qi/HVF5ruccoTlwXbz9anFiy+93
hxMdCOoRY2LSlxlBawynCQvmXU2xGZT1ba5S2dbqg7RlHLDz+Vpj8C+HzS7IO7RQQqW7kgKTUZFZ
zATXEB0ZgMTrI4+gYR4nlOtjKd1Uxqv3eX4RNm7xW6llPcwo2OaacdLax5fH94f3mx9PL18+3mRj
fXPdYVsF7spuLsl+aOSTkkrXzooSCBuVBYXvtBsRGWqTLI7TFFkRFhRZSaRPHbTXJlzVB1lTWU8k
DdeGpMTmrpdlbZYvqfhr1XXXwGi1GSNkEZfQ1ZRXey+50nqrE3phy9aT0WM/Wfj8LFiXDD5n+P2R
xIB6lTbKE18p79pWtHB564n4v1TpOFiv9MKX/1orxkG53koLY4Zd8JtsG2R8tZ8PllFH97HnWCYC
YJFlTeAYIsqOWOxZ+4yj1zoemHx71nEYryWfrAt9Mxtu4KOx+dm1WcVr5K/W9/qoofteG4JTaB7L
vmPsDvODJCN900BQ/xbuIXtMFhe6HgRQVC0ydaB5mmBLoKF1UYBt4K3tICMPNuTGK8wgskLWr/Zs
3lsg0rhhbGIdBGLlfnixmmC6kTEu+Nenh+7xX4j0MCZRgmt70t2aWdqIA7bVc6c/WVshIibpvNhB
N06uj11fADkLfuWzsCTu6rEAGDykTaFgLlqXKI5CvMBRbLmAklnS+Hqd1g8NUOQI8ygiM8TIGAJ6
gq4JgKTXc02vtKSPySCMHrrIPGCN4adiyZyDT1sGpFmajjTnGL/LmxeYu1PF3+KfpItgEFOVa4eR
wONiQAiVoa5I1f0ZuvO7uuNWE26nT6r2Tg1XK1QuJjO3SJebfSYOZ2z/5PASJFim6nGjOJG7g3MW
M1YRw/v7w48fj19v+PHQmNn8uzhYvOGqZVuJ/StwfmC/hluVE4IH7mv16knOUMq+Mco1WZjZcwaO
fketdmqCSTdJEx2ih84UVMNXIScXFxFJSqaV1Wz9ohYKNfUX9l4d/OXI5jZy7yNWawJu9XM5J+vG
XwpWX8yCVZbwPBzkLo3P+F2VYBB6OluOxjtTMVg3SURjg9pMLv8U6nQnp+ZL+pVCkR5/dSA8E7BD
+NxNtnILHYH6oW5bo6HFyohkMlAWFh5bl46b0wqb7RJpRI+9USh6aOiQa3bYCoMiEAlS1wy95u9Q
APc0R586c1Qzp1pobhIZSQnXOvaqTvc7tswkgyyZfK6ghF2lk/skDI0yXPICjERsWXBXygPdGN+t
xGAXeI2plcWCRophK5s1iylWdL4X+MpLj5UVerYh5tTHv348vHw1V+7Rwau5bgu6HrlKZTno+8cO
gn7rA0VsKvq6xKmeORRH+lrG/N2Br0/xkTrGeNNmK2Co/mCEt0lorCRdU+VeojqOmEZlqo9KyVxL
a2+xk26LK/3QVp8Vg2exvRSxE8ra4onqJq45Ujndw280RgbWCi65YC9YxF6UpU4YatkJg1yNWDdJ
bHQBEMNI/x56lEm6ZjuKOw/rklN7iW7nJ5pfuCq1LjDyA3O1P8FPUxJhZM/VG5mTk8gcoBxIXetg
GnHP/PCO9AnmxE2gsx9VjRo5gdl0wjeaLa0L1wQr64Q5/uaA0ca41FaClbcbYlR1K1s3qfvNVh8Q
QPMMIpMh9CWvMRZBiJXG4/y65m4hAt4D6GGGDuMGy0QJV3stZ7TBfC1+pW2Y3OtG1ry4M5HUEPjE
eogII7nvJ4l9karokeo7Wd+Cj1Jfz2GKOLq8ZTbrwitzfnr7+PnwrMv22gjY7ZhoAEFQrTU95rej
Kc2YIZrw9A0PLsuzcX//99NolmsYHlzc0YiU+74+Ss24IAX1gsTDECba4R+4F+Up6gJZjhgLA91V
chWRsst1os8P//2oVmc0HN6Xshg+06kShHQmQxVlx34qkFgBdsLLCohnoNV24UH96KqpRJbkZYdz
MpA4oTU7HxvaKodr/xhX4Kg82MWIzBGqPl5lKEYnnsrhWupcOoEt2aR0Y1RQUAeJpJY4Xng0aYq6
nxYoPTWNajAr061W2QoTj+cqqVKKTODKqjSFUy7yYZOBnS5mTii2ogFG2kmSB0eykajYmwQdSY3H
1J4+Gmlj3rJX7REBo54dvNZk0qqjetidPsryLkmDEDMZn1jyi+e4oZkfdHrkYIlaB4zC4OJJyuvV
RK/LHTvcn30TQQxAJohuMOFpahO6UUM5Z4dsJK+Ue3PnxZrDfA2yOG7VufbFHdJNYCGEJi4QJF0B
mMMI6Ox4sj2V9bDLTjvsvDslDo6IYyFF4QjSIRzxXGSs2UchO0awUej7JsJSS1IHAQypbwJAlPaU
a6AJsWxTS1a8n5EUOz8KXYyeB27k1Wip3SCUPdBPSFF2/FmhYInCCP3YkPqV5rCor2eexrOp5CcW
YRJBNpg70YmHjcfAVU0yFCjFtQsyjxdiKnKZI1ZfuEpQyPJe/5gdZZDuB0C7EJehCBW455lPNn6A
9Np40omxCcjnEIwFLw0wTfLMN/qUMWdM24UONvbbji2/aPvQ3It9LLNlVnOeHu2+U05dx8GuWueW
KtI0DQN0vclhOQpRtb+2NfKfw1kNvCmI42MvzUBQOKkUocAQn5djvOqCVV3xnzjTA1cpsoJgEs7C
QCAMA5YmACGeKEDYoVTlSK0f+5Z4cRKPG2MTSOJIPXlxXoAu7l0L4OsOPRcoQM/mKgfaSgyQjUgV
ILaUI4hDBNh3luLpZmkIR64/TdY5+mrYZtzPJzsV1UjumkXlTO/6Bqk3vElqzp0VGLI6awk18Zz9
L6vaIW/aox1t6MkEi7Y6sy1Ei7E7gTTy1noQIraruvwZ4eqrlU+r8BacvpoFgsBiPdKT29hlR5ot
DiTedocVYxuHfhyiQTtHjp3qck4QR2/0IG4j+XXsCHrqMiYfm+CuDt1E9Xo5A56DAkywzbCyMwD3
4jzC/KpJDjExIftqH7k+MksquDJSl9QZ6pLYpH7KA2QWMgmwdT0PnVZ1dSgzVAScOfjGhnSwAJBS
jIDu3lyHbb4uJa4UaRQBINXk0liIjm6APNfyuFPmQe2PFI4A3Qw4FK1NPcGBlo5H+3DXFi7g8JCW
BnrkREjncMRNLYBqyixD6dp+w7VysYe0vUCwMcyQyLLmcMi3PBeWeYK1XuEcoS3nFG81VlhsbJG8
8R1LYeseImBvLWHIJrYuj0L0qdiEN9TzE8s4KA9bzwXfeHzSr7dLG7P1CdfsLJtsjr/Gm4YkiXxk
GhFsw2ZUnBefDmRVbmFwgiWW4EsUQeOMSLClDAl+TFoY0tUJS1IPTzddL04aej4qhnIIPSKoHMh0
bvIk9iO0eQAK0OBGE8ehy4XmtKKd7v115Mg7tiasVQs4YkxgY0CcOGhLAZQ6a7Nhcf+iAzTzPWQY
HvN8aBLbzsLRdKCbtf3smCMyAr/GVEy7yeRNQuckNkeestzuRdcOBh4+czbg6H67Vv5Nkw0tjXQf
7KOsQ5vBR18uT3LDhgz5dtsgolDR0NRzsg2WbnWgzamFmOXNeuWr1g+9VSGccUToWYsBiRMhB7uq
bWgYONgntI4SJvphi4kXOlGEACA+xOj+N0Jg33WqLXc2Eq+vXSTL22jo24KBqzv32uQQO7Vj2zo9
J0avBVSWEGk1sf8luNTgBwF2ogS9U5QgqzYBZSJOT/Eh3lQk8L2143hDojgKuhaZp33JxBqkfHdh
QD+5TpIhwgntmqLII+QrthsHToAJNAwJ/ShGBKhTXqQOPvsA8nDfJiNHXzSl66Gr5eeaVWz9hNtc
iC6AaByy7Z7l5EAX4wAd2XSKv4yJzI7kyFhhZGwWM7L/F0oO/sKqzYB8bblA/AjOCxYpmcy5tvOV
7GCo3PFKgOc6PpYqgyK41VgrE6F5EBOs9iOCiw4C3firQjbN96CkBD+qRI9VInGs7vicw4/Qj7uO
slVhtXYkwo4UTJx0vaRIXGS286isHrqqciheVcuwFk/QHeGQKc+iZboecWFG/PXtp8tjZIvp9iTH
zhAdaVwHWx6AjowrTkebgSHBlT0BWCyu9SSWEL17nhjOVRYlEaqfOHeuZzFGWVgSD1UrTwyXxI9j
f2dWHIDERRYVAFIr4NkAdGpyZP0Uz1hqtrWh8aZVnuiAV4PNrD2itRJIiUJGtEUZsbwrXUZsB3F9
XWdAD34jNxffVf+hI4lN6KyrICozVuWJqSRluysPEHwKrgOP2+3A36oMhP7p6MzTxmFkdcQ9xUzw
pa149OehayuLmDixFqVwsrk7nlkFyma4VJbA09gXW9CO0n3WYnIy9gFEPwNFpRIwcORTE8SqbS0k
wgduugbVV5cMKwWZMyrK87Yt7ybO1X48iTBmZvKqLy3ukWoZNSMVPIxixIQQbIjd+itFok2ZtWZq
9HRIkJwndxAIkmPJcCobsb4J3Vbt7eV4LEykOE42QjJ19DpncnPPFyYdXkotRGEL/PLx+AyOSd6+
K9HYOJjlTXXDprEfOD3CM9utrPMtAfCwrHg6m7fXh69fXr8jmYxFH99UYH0JbzIOFOtPhYW2OMtY
OmsReAG7x78e3lkN3j/efn4HPzL2knbVQI+52fgdMnbAd5aP1QmAYLVKwBGuchRtFofeaqWvV0sY
PT58f//58s+1IWBjmWoqmw1pQ/Du58Mza3is8+e68Fv9DnYWtB7WJJYp3RboOrBnEwi0oyd+fWZf
Ey5Zl++Lo7T4TRTNs+RMPhwv2f3x1CGQiGLCwxMM5QE2lgLhOjYQR7YiJSTiGDC9p1tFj7Mk3/Ig
IEPTluPnxk305eHjy7evr/+8ad4eP56+P77+/LjZvbIme3lVrC2nJJekYLFHCqsyMBmgRoumsR2O
R+y9g429yQ7ykzWMTd4bJ3a1xoWIwFkYl/DHbYd0s0KWclJWIGGRP7MhVeK3kJ6c/jJP+QXltY8j
HyncuNCbgLD4XidDHLD9AAF/86yWd4lZWY8MemHAh1VjtOHDqjHzjGHPVnk+V1ULhpKrTKTuIWg4
Ln+OaoC1Fp39tfY9UsuMktSLHAzpUrcloAqxgDQjKZakeKYVIMjktdREth2rIsQhRZITXrTx8XRZ
q7lwJop+yD05rjZ7c+gDx8EHujSeuZf9tUIw8YutUUi92kPYRW6CFo/JX/1qqlM0JzPZ0aIOT5ad
PH2wTmy7fC118ewMS5zGHporXNP5NiSOIw9LjcmsHgxthRKf6kYlQoiwtlNptINHkVgJuWtyk853
VZHEMrO4V9Ndv9lcmYGcb6W9SFlUWVfe4mN0Dsa3ksL4ABQbJsLbkFr9idh+zhT6+FoYmUQdPNh0
EWT2zY6Vve0K103xVUwWN8xkpyeG2Iigue/62CqQ1RWJXcfV+joPYfgo4yTyHaekG5UqHmppLSXe
u6hEJiMHfPZoRHB8pg+S6aG0vgYvcOz4iT6Mdw0T/vTh1kBFHEtCbCsaMs/VPzqRGm396fXS739/
eH/8umz5+cPbV9VrVV41+erwZjla/DuzBm6OlFYbJQQk3Sg/YAQokWnhq7zaH7khO/L1hOpEiNml
f7UsXQqLpbC0qI6rKUwMlu+5WRbYMVc8Ei9eepUJxcYn5csQydASAWD0KXdc+o+fL1/Ac+YUQ904
eZFtYTjZB9qKtT/AItr8rlFMrPh31I9d10iNUW0uNAg/4TRh6OGqMf591nlJ7PCSWkq0uIXXCsS9
wYOrbSXs8QLt69yoBAco0cismcPUkS+oOXV6C6qlMZnoGzT9vhoQAgHXbI2d0SpXfYRAm4Ec6+PP
ouGjUXi2OUmWWPB3CDNDqNZB9xA603y9Tozqoo7aAIS33rcbP5WNhDid+yAS/vVUZMc2RvAUqxn9
8dbLXV97bCGRLaZlMocSZYcD3Gheo/WsXK0x4pnsETJ5xqDvqyhgy7DuZHCEwrDnEGY23UHMj7HP
JRorpHJRB3JLJb/rBAJVPTFDbkKn3BB0swD8jkae0XifssPnISfHAn0kARz6c2ag8Tcd6nXoQsYM
Smc00ieL9GhCmypCDrR16fJcwqCqjhEWeopbTs0MSYBdsoxwkjpYGZPUs9V3fLVhlJARE43YRX6k
V2Vy0iPTpuPnQi4/87iCjV60HIjW6h66vsQ9eQDKDvKYh32ApCc7ksQgaKDAwtf+icHyFIcnTFQv
JLwc89tjmdgFiRyeVdDGpxRqNfKwC1H7Jo7eJuqdHSeKM5a1ZWiZG5uTylAFcdSvbWC0YtOpFDNS
X44o8oSf00mIXk1z7PY+YRNIW6rFM5BpVZrE5U0fOg4qB8BJz1piEf+pzbV9Vfgt0VPqwLW677N1
r6O5bUQAY934qcXPooCTOLH3RAdhL6yjVHMODQ95XEd91SS8G6BPHwQUawNPcoegloTTUavCGRaP
iLTiax4hJLLiE0JKJEGowuWCTk1dB6V6OBWTVWbMvq8yFrYLyLNx0iaooi7nHZHsVMjC7uiwAR2U
l9r1Yn9tMtXED+U3VKINTX8WnC7cYBjVtHmZANDwcMMzPeb7Q7bLMEsxLsfprkkkItbQE2Rv55wG
ce0FRvuQ0HVwcXuCXbuwfSHWN4UzbJ9/DA5Qo6cR9PV1e1SPGmveSFcC5Ex0fXsf9ahIG/LS4m41
xfJ2CRLU/wdf9Y97IpzBGDvQiKhOZdRvPHMXERg7L/TkhIWwG1dc32Oznd9HaAsrhzhAdYSrZQz2
rd7YwgeTftzJPUP8GolmvyzXP9oH00vAodS+4CozLhdqbaVYO/DGksMM286ui+5qNMxUFE0T0fp6
f+HYVn3JpvKx7rKdtCYsDOeq7U5ZDS/E6EnpjYUH7vD5Ff4qFxNxd8qCrECjyIxDkRNjGBzQE9Xt
pQQWoZ9iNpUSy4H91Vg+54f49c/nMYN9b3uEvrCYZ2kJm90y4ZA85TSot5RozWGTNGS0866KyKde
DfEtiCvbsSmI56I9zhEXr8M2O4R+GOIWTxqb5v4GYdNFboRFnGBXW0ywnEMfrU1Fa3bAt4xRsNb2
YhdTeixMIAvGlvbgGL7LyUxJ7K0PRV3eUpHQUvxRHLuWvRAu1vNnPFEcYQUwHQeoWJjYPuNHZDum
uhNQ0CQK8EdYGhf6vk3lSVJ0YiyHZhwK0Ym2nJotJUqvrHiSDsCCqXaGGpqgT+R1Ji+yJCHepF5r
WMaVpFfyyRuX9R/eRk0YuHgFmyQJUxuC70ykuYtTyyjqIt9F1zZAPLzbOz0ui4atTxNdF6IiKTqc
5vMekmWzqVCfeRJHnqWBbaboahSEQXdiImHbpHdsCW9Pn0sXFaElpjNb4fHW4FBih1IU4jJa25A9
XqjRQ0gBLFfGsGDFo5FpXCe6Gc7iZZXBIL9d6I6nfE/ztoSrrQ6iMaJfjIobE2BiN14t0BlZzLBV
JotzBpkJNE1XmSL3yrLJWJQnfzJCzvhkpB5pMgedjQBRfKLSkCRxhE4b4U8ERQylkoTVO3bstA1r
cXbZHI+WGMo657ktt5vTdi2x5nItoelQhCbBT37DmRBMCS8xsho7UYbW+D5JvMAicnIwxsy3Fx54
V+RGargDBeXaqSujCtg8/8q4EsoofGE21Vo6llh2NY66/vqGhXnLMdD1rVsw2Vp6Unf9QjtZ/I0a
TOgAl7RaWPJCj7WauulGWTpsgot8PGmrk1KVxbZV8bW2zjaV6uBp4TR11yOSj2rtpbxAORy7aqvU
AqiNGkBsJA1sCQdh//DJZu7COcGZ3lG+uuU572NffR0HVGFEk+GHl4Vh53qZxiXx6L7aeRlEZBS2
MGIbO+eQPV0LApGj8wJJc8stqrhUT7IFkoBhW9X4sjixbYr2PGSn7kjLuuSh1paAIZOC5OM/P2Q/
mWPrZgQithsNLNDskNXH3dCdbQxgdNRl9QpHm4GjWAtIi9YGTX70bTh3YCg3nBySQq2y1BRfXt8e
paCjc3Ofq6I8wtMKi2EWb6ojdwRUox1RnDeLLlopipIlz7N4+ufTx8PzTXe+ef0BKiypVyAddlQY
siJrOtDjuZFk4sXAMbbrQKrDscXfzXC2EiKS0pIHJB3qI4Sjww1hGfOpLoU+TC49Ukp5TBmWIqLX
8krqFLnhH358/FTa3gT/eHh5eH79J+T4C2x/fPvP39+evlq5vy7lB7Oj7Cv7WjOBh7pvTsWu7Oy3
c5zHy73RRqTRY9QrjE3NpiC23XGwk2QmQfBVArigLFVSUWzaqtipL4AkOsTDFvbu9gWUvw0djs0U
m5Y3Adj2g/KU96M5DimB17TZ4TiQopNsV85BvUxNYYakHKDERBoNcFfaSU0BNzpmi8Mao+hrkv8B
1lY3LNmbh6WP5WrAAsTWR70J+QqCFkBdSuRnG4L08PLl6fn54e0/+useAcOFTGYUJe8Lj52vRIDm
sTRKRspn2mJ3OvD9VAzen+8fr9+f/ucRhvbHzxdkGnL+8crYWDg51hWZm3jKRYmKJl66Biq3nEa6
sWtF00T2RaWAZRbGke1LDlq+JJ2n2l1pmOoLxUDRq36VyZO9Q2iY61vKfNe5SpwYGetzz1HuhhQs
dBzrd4EVI33NPgyptbIcj3GrUIktDwImyfqWTLLec9WLBbP/baYQEuM2dxz0EsFg8mx5cfRa540F
siZCkoQ7SHGuNUt3ylLHsXQ1rTwl0JuMVV3q+pbR2SaeY4o2U2/5jttuLWOLuIXL6i+7cDPwDatW
IC802NIhrynvj3wd3b69vnywT5Z1DS7c3j8eXr4+vH29+e394ePx+fnp4/FvN/+QWJXVlXYbJ0kx
nd2IggMLda+j3dlJnb8QomtyRq6LsDKqtsnCoFevfTg1SQrqu6pPLKyqX3hA+v97wxblt8f3j7en
h2e10vKe3Pa3aubTaph7RaGVtdJnES/WIUmC2CZACNSf9gFG+p1aO0OWS3svcFVHmTPZw+YPz6zz
5WMukD7XrMv8CCOmWu3CvRt4SPd6agicaSg4qD5z/ijVkxfdj40ex+iAxEl8s1ccJUDJxOpF2ug5
l9TtU/37cVoXrmPkxyHR4GauLP1e58/GeWB2jYsHFl1wzKnH0rF687AB1+u5U7YJaXxsWhi1gghg
mRoIZGlH1VvHPDK7m9+sc0bt/4ZJBJj2YqyKF+vFEUQPGXK+RmQzstBLXUdBnGAbz1KlQGunQ99F
ZqN0fohMED/09RyLagNtSnD1isyBW72NHDFwWMo9wo1W/WqTmkNUVDFRqdk2dVyj5GWO3zRM882X
JTLRNUzI9ZwWoQau6lkegLarvQRVii2o3s+wcGqF/1y4bKuEM++xQHLmtx3zwMzHRd26XMKcTzxj
Top2Qy+8JVib9GL5iqf8s46y7A/srPrtJvv++Pb05eHlj9vXt8eHl5tumS1/5HzXYQevlXnDBqXn
oGYUgB7b0NVMBSYyrpDl59yc+KG+rta7ovN9p0epIUqV1eGCzPpMX49gvjrawp6dktDzMNqgnELn
BMwasv0+Uq9IhVMGWqyvSXLKqecaEynBV0XPmU/UPAt1Q/4//6t8uxweXGjV55u+iEanKI+kBG9e
X57/M4pzfzR1rabayA+Rlz2KVYmt3ej2xaF0njS0zG++sAK/vT6PerX3m3+8vgn5w5CA/LS//6R1
/2Gz9wxZh1Nt8iEDG8/oW07FTToABpORAH1GMKN6xwqiNmnh7OvrI5gmu9qsA5BRt6k8nW7D5Ezf
XH+jKNRE16pnZ/HQUFHww4lnl45g1fa1ou6P7Yn62gzMaH7sPEOLtC/r8lAakyUXuiHwLvL2j4cv
jze/lYfQ8Tz3b9NAeH58M1WA04LrpKmeEW08VMViO3cIDyGvr8/vNx+vMOoen19/3Lw8/tu+HhYn
Qu6HbYnmY9Pb8ER2bw8/vj19eZf0iGO65102ZK30DnEkcBXtrjlx9ewIgbucqjmdfe1KpJCDULEf
A6lAA7SpMCqtlJYDxVfDVsCex1rQ1NMyEw+QQLSMBJWW9RZUXSp2Syj0fqPtyQypj1kxsJNkMWyr
llwym15UlC0vsetRALtOK865zciSp8qJ0nclGeBNI4ZB+W0YfEf3pMRTpfme+waZ43Y+vnx5/Qo6
0Lebb4/P/5+yK2l2G9fVf+XUXby6d9FVmm0vsqA1sq3piLItZ6NKp0+nU51OUklncf/9BSjJIinQ
J2+RwfggzgNAEsBX+N/7Pz9+Vcc1fAWMeOHkqJG6FrrgpRsFZjsiUg+tPPM67Onbxw2f6f9LCXdp
K+YkWHTVsjbr5S6SMk70IksSNFBzHWVU1+5cG0ORlTAUuWin+PRqqzdVmjD1REHNWK9Xx5LU4pca
YVYlMIEsY6duzpeUKS+IZwLGb2LxbYz7YXsvtPBMNxkhSV6cmbzxabiqiEwnCGZ7YfbxwoFBuUqe
F9QZ0jRaj3SDXvLUnCUnNQYEUiabx2XExl0fG308G0VmvEqoL8PA96EOcVNT6O4OaTWb06z4QF93
rSwXnvClcOk0Rr/DSvv70/Hbx98/mONx/ihpNwvdgpABsbVPqWrAqK5sSRp2lJNQ8+O3XwinSMpX
uUfFm1YYeNtaMoSesK2KM0fX9ObTdAUVMTNuGckCClsmzFztq5zlnia/4gRFr2nJdWk5EykviTEQ
n4dSJxybuDB4WlandzdUycfvXz+9++9T++7zy6dNO0vWkR378eaAfjE40Y567auw4vRIO8F6XqZE
tlDvsxjfOk4/9lXYhmMNKnp4iCjWY5OOBcd3od7ukNg4+ovruNczTPQyMvtq4oLhCvvQw2JvG3Ki
pyVP2HhK/LB3NSHuzpGlfOD1eEJXFbzyjkw79FDZbuhJMLuBQO8FCfci5jtkpXjJ0X8ILw++R6Z1
Z+CH/d6NSZa6bkoQSVpnd3gbM4rl14SPZQ+lqVJHv8tYeWZDkV44IY3zOp/XTGgk57BLnIDiK1OW
YJHL/gQpFb4bRNdX+KBIRQI6/oHiW955lMlBi2WnpATg0fHDZ7o7EM6DcEd2aY0PZMq9E+yLUjuq
Xjmai/TxIgevcWpLMUXRzns8bxTmg+OS06Fidc+HsSpZ5oS7axqSRWtKXqXDiOID/Lc+w+BsSL6O
C4xcV4xNj8YrB3KQNCLBPzC4ey/c78bQ78l5An8z0dQ8Hi+XwXUyxw9qx9IulmehD5unY7eEwxzv
qmjnHlxbwnemvWfxvK1wN/WxGbsjzIDEf435/rAoStwoIVU9gjf1C0YOP4Ul8n91Bt1xtYWv+uls
93vmgPAmgtBLM8fSWio/Yz+ZdpNBguSEEyk/NWPgXy+Zm1tyBP2oHctnGE2dKwbS7HnDLRx/d9kl
V4cc7XemwO/dMrUw8R46G6aO6He7n2Gx9YbKtD/Q75AU9qbG4HpD4AXsRL1H27KGUchOFVXAPmnG
voSxehWFT3ZA3wJH4nj7Hma1pc9nnsCv+pQ9bn7J2ub6Fc6KdufyNu/du/H6POTk8nHhgjd1M+CU
PHjGkcOdC5aoNoXRNbStE4axZ1oE3R87aZKKJuQs72+2EsKCaMLOempCCsBxUgtKz0d/t02djjyu
I4+8GJ+4YJSgVSTqoqbQEHcgFcL+wuphFxkXbaitz5spkGoZVdSSRwk54FJX9vuD6x31PFbwELmb
kaCj58EmoIKMAX+iSDOAkwmArAQFTFJD8qhQ74MWQpf0STugU5Y8HY/70Ln4Y2bs9/W1VI9TVAT0
7Lav/SAi9g9UWMdW7CMyrpfBY0oGguMc5vvI26QM5INDGpktqBECaCJLdw/TELOdsBS8RhfGceRD
u7mOt0mlb0TBj2yyYacjzhFshphloLtXMqGffmwZd+RBLbLB1p21wVb0QTfAdRRCr5LeOQwWQ87B
VNvE9YQWglpqS/KRKyy9MG8iP3iA7jRDbw01tVLts8gzEsUzH5ZcdqEpAioAHq0Z8xuXjqpI2n0Y
bNQRDRx/3XmubdisKp++PEzkkRXHydnC48/n4m1W0O3yp9WvGsx88dwUJ1ZZojo1rVG2ZQM9kl+M
tRiJZXLcErd67Rrje0vEs1uzaBffegTQ1+zCL3pKM5FyiizXsEFkVAhlOVy6uM3PRnfzrgN99jmt
zuZag2tD0mlWS2j2hGAx7P1wR5V74UDdzlNHpAr4gUsDgTqhFqDiIBP4zz1VkC5tWWs5xVh4QNgJ
SScaCsPOD40T3LZ0zXkDo2JzvgHKCjP7ADburKMd88lumPxa5tlmlFZxYl2GeSIMxWU6pjSKmGTG
4tG53maTrnJmXT8v3KbnCXZhtIwCqlha9zIKwPh85t3JLCk/gm5TJ9L5nZRjsm/v/n55+u3HH3+8
fJs9OysiTHYc4yrBQKBqyclxXVWtnM8q40KzPKbX+O6yYnExG2Vec8iiTt7v373/69PHD3/+8/R/
T6CuLvYAmwseVGXjkgmBb/+5HmgBsTIAlcQLvN4SPVHyVAImQZ6RN4+Sob/4ofOsrBZInabhsCVq
seyQCPK5F1Q67ZLnXuB7LNDJy3tpnQoalh8dsly9vJhLHjruKVPfeiJ9WkPMtmjQmsUjfT7ez7/N
xtzgpz7x9BcyKzZ55SHbeWWaHOzC8vewGKa3rxXZxl9ZMZagsTOtrxtcO0qpXXm2PutWbGv5qzVB
5B/o0rU4TUkvkCvP1gBzxbYepZQ6bfxyrpjF+5pS6EvoObuypRI+JpHr0Fl28RDXtWUo6P27hpR4
PK+XXKQVQgVqxHwDqCx6s1Qw33N//v7l08vT77PsMhtDUPZBubT/EQ1pZzFdPc+4sr6qZPi3PFe1
eLN3aLxrruKNFyp346+UbuHbXF8v6YvmXKshk/DniJZAptMsHUGP/DCNOXWqLbQE62Q03BAhqVUd
viGhuCZpq5M6dq2meyOFCAXAkDU6Ud5AIaQVeMoGyXQhJbqUTfvMbj+lMC12d00Ji2drFLPtmnjM
NuW5pN2xEamEM4tFi8bG6/5kyX81xjKJy/fW9OO+HC8MrxZwz7eyifT5jCY6ZNhKLOaAosGmCI/M
dWSra5d3cgYVyS/sx+8fv6ihTe40bZgkDIceKAIN3qm/Td9EgdYpm46Qfpp12mVom/iU9gZnIjWa
ODMrJJrt1WDBk62gAET1W/gJq1Xfp90NZNQurfO+IFoS2GCkqx+eMXWScYnnsixO4uvLe3zchR9s
ntogPwvwiN0sFYu7M3XWILFWsweSpDO2+KZqaXni1Kk5gnGBB+x6MnHB4dfNTCduzrS/OwQrhkEy
jIRg9iT8lN6Ekb60bTBoNxgtwmCE9s6bGu8fdMl6oY4ZHZYMv00rYcAqWKaah2hJewsl1Ul5Wh15
lxjETNfVJK0E0bw5UysQwqBHslJdIJEIuclLDTOt043alRC5snJy46UlnV7lfYpRyFu3BAvTEudo
zGdJnvfGcPqVHTujm/orrwtWmzWpBSje/Ta7MpZB5ywZamF9JkLdXBqD1uR8nhoEFX/oN/d3hOx8
RLtzdSxBn0084FFkZYDyQ+BsiNciTUsxkbXaVSzncQXdTi/gE0uJVwHWSXPLQMTeDIEunca4PVmO
x8NNRgd4kRx4styl1OGLhM9lz5fhp9DrnpuFga0zPVnzATkWT0hg/NtWwjbtWXmrBzPdFgNcxNav
SlbLS5RYbD4s2U309h1xWnnwOYAlbcHwWlyv+HxxZeYFMgx/VH15xAAKNLX3S7xP2Wa1ACIMKNge
UtuCAUVpy7OxGnbVpm9yvA9lgjxKkOlUrOt/bW56YipVG+1yhvNLY2YDq45ISSVNogVMfmMxPeNW
ObbC18lXzqvGXGYGXlfGpH+bdo1e5oWyKe/bWwK7ZGMsSVOMzbE4H0l6fBY9ei6Sv4w9tGynEbcE
biN27vtrQ126uLcZHvzKqUNvTys85g3skMZzQuWZoJq+Eo6Qi2KTtRZE0GSYnhVWyZPIJkBsCw3w
CPBoyDTr40Dq87sMqGa2SEfiODZFzEH27HvQidIadn1ti0COWTonj5yUTa29diDlwq5eaW5fZ/J0
iEqnMR5BBFVm+500aw1v9ooUidblZ9bR6yp+iY9vN0LmZLc+ma4XX77/g9re8rA62b5Lw3Q2Hks1
VCQFGVwFsSUAkX4St9CrQX788FvJo/tEkaAMmWQtk4x+VdDqAuKsjMlbSNlqPIPZluidMMfBMoth
8YCMiB9vmH2MnDv1G++e7Q3qo4ca0u/8jCYV04snQD+Km2KMhU7vK8jLcG09k80ECr6loMd0zCwm
IPSR29UYwXbCtSos/oQsdYiPO/2SDYkX6ZaF9nolu+BqdAms2WWfVWY6QD+W5zTjaUntAjPL/W2r
+W3B/d1hH1882ln0xHTyiS/pGEOywQr8h2ebZsKWjLqmtGUlw6Tp1Y6fi9ggFeLZ6N/5vrM1OecQ
UDqx6k9mwZorHYa0Ak2l5zElQdTpFYVkZQDir+lYVpN579RRypP06fbKJKU/GV6MEpGR79jhyV0N
GhlOrxhE/nx9Z4/neRslVn6mnJTq+bLad7zwQMkpEw7CUGlUk109w4pxKlpcRb5HX0yvDCHlZGxq
gs5x0NYsMLJLSzf0HN1eVgLyJNvZlEOSqUv4Fd0WHo+EA9ro6Y4fPNq+QDJMLjftuAx8SBoxTZVv
jqCRjM/nY7odQBPWsWfb1+gkM9Q92Kl02+Gy5NHDW02VxeAPZjcgMdxmUbahY68WoOEwzM5xNgmG
oW59tpIfNCTi5BuLGd2HDpWoeeWwaaZwMMo3U6kGQijyzQ8WZ/mgAp3NpcF0mC+JICC7XiCcfWgA
qld1bQYl3l59DjvVrfdD1ZJuGo6Tq1uDWgvz4zrthyPPzRmuBz6StD5m6KDQpJZxeHCH7cKyuDi2
tfkm/s59dqpWe5LY9J6zneb3cDv2ocKF72al7x4ezNuZx7OP4Tlay7Hs76eG60IrbTR/+/Tx81//
dv/zBHLzU5cfn+aLlR+f0ZSIUFSe/r3qZ/8xluojaq3VprpTPBfrCMbITvttG5UDDCXbR+g132hq
dJt0vKmK4NTLMp7LOo2JtZGOVTF9/ciF5tQJreX97jQal6AGDxaFXLtHma7YP737/qe0kem/fHv/
p7E73vux//bxwwdDEZiKDVttnpK3FyyOU4wAiO/4teNY5ro32KMZL8uUuspazpzf/fXjK1p5yqun
719fXt7/qeYv2pSdzkaEqFXvpb5eipbCokK5OkQ62X4YPVZKH/SLCAyKh9fMW6dgAB3PGeHU7FbH
6EtRjaZ4lVRNxZw/J+75JABazyWdvFyqTzwmbHNzM9MXK0xrXZCpSFlLuyIzanTv7fOwMStDS1HN
5q9IgmC3dzZb3UxXC8srjO0acz7Sx2xA9ZT9o2WdvCZrZ6OfO3l6ti/BNcz6TO4a2QOhTp7kRdQ2
hfaSpZ1tcZr+jv3rX2uB58rC0jQ25OmtyqA7IF2BjQCs5r0W5axutmfU6HimE1r0womvybpnHUjQ
GJUCmPrGDwmw8MWN0KRAmXLMl/shoqDIgdulUZrurMv8SKyyyAssSSSZUttLBpQLFDhLdKKaomSq
Gw4jizLllLCm/SwUUG9YS5BBnR1M8uZJiySz6sgsnGPMygFWlSEHnRgkFqFeB+qcrEqG/Jg+ZgLt
AJ0/yjdtW7YKVqGVBA0G21QrVSZWw3BV9jGMFzOSPhO7HhNKa7IRZaRZ3vSlaoeuB7adeDABkyZi
/an5RMWrADGfrs2P1bYnVB/ff/vy/csf/zwV//368u2Xy9OHHy/f/6FOEF9jXYqUd+lN8+ceoz2x
Vr6JYo3Oc4elFe8oV1b+FmOFvvGcYP+ADaQ6ldPZZFlxET+84J75uGA/w4ajmWAzmfAGWxkTOhwf
QRAXbqQdKC11YyCdU0CN2PO4w4h9VjThjRdY8JId29iCyYMsQXTY85nJKzRIvAUOe5X3XhhsUgZi
SBJHwTb00/Tv9DyBaBRrnSigVxf1ldw1557rdzszaN/EQbvK4Rui6nlTJhkXysXZQhlb3mpqNRp4
VOl97aEaskrLkqHhi7IyrkdDUq4ei6ZvS3IGzQxqtRuMDDs07k7pg4KBjBOXpy0F32jA3p5qzYYO
Zidutb1mKuGgfBIpP315/5eqraAzge7lj5dvL58xoNfL948fPmvSL4/Jp7uYh2j382Hm8nzq51JX
0yhEolWhrE6wVPj04YtSvyV0DD3qFa5DsA8tbSTDU7yWkYjJuBkaR2uup3eIh35AGRYZPKrtpw65
gQ0JrIjqYkhBjpW712VPBYyTON05rzQnMh28kEw9lk5zxrgl0UxMEb+FtamQQzDaz7PClqcVr1/p
kOlJua1LpvgbliE9x7gk68AGjv+CTKjAQH9uOv6s5QbEUriOt0ef6mXC6SskJekhN3wCUUxT6JzX
uJqhJoPoKCyX2DYjqqr1rJYo6lDaRnZTu1JG8asqSzgz2ZbSSTpZTkSlJc+R92K8dtCCQKy9faFt
J1gKxk/oCN81yL07xvFZ98KlAolqRSKBuPJ2rjsml9bsx/newFoRwMfIJ8+LVFjGSifSHk9NTR23
K63J8XUj9Wl8y2vyMdPCUHTepp5jLVqKSHCKTqcpht6Wji84rGRRfPEtpzMmK+WKzOAJD8yeWWR5
OG5wkQ/HdZ7l4suaV+SR8c2ldgKwavWozhOQ/FX9vxpifYeXHVwN+6oye1hS6aczd5iMirGAz8v5
JP/84eXzx/dP4kv8fXsjtNhixTl1pKeiv74NdgHd4CabF9KON00+8hTeZNo5j0q0fy2JQXcZq0Oa
q7gF6mGNWCSr+4MNog2JDsdnlNDjiqTW8/m0dk6SFsOks7T+5S/MQPFfr6zM+Bhzeg9FLty9t7OE
zTK43NdFqz7aWcIoGly7VyYw8qin+hsINglxM3Ubg4VXOfD8THGA+ZKk8f+DO61Nbop3Fxkxb0xw
TPviJ9OBtSJ7VGXJAzvwzyV3sLQtQnOhHnG8Upa961P2VQaPbp28AYnKPGDedraVtcryOMst1Zs4
Hg4uyfLT42Xv7uhrSIPLElBS5wpNP9M2/UlbFpSVYz7lmXSsvz99+QBL09dP7/6B339/V4+JfoZd
0WRBn+7g79h3/bEC+em1uqBlmHWLkoPMJmh3IPAKPRAkktMqvVgWKPzoLbOscQju0ImsRSBAfM92
PqMDjy+4bX9bcequeUV9Q2KSxJAi6pvaSn9UQclwtLaohGNLuukr6e6olxgreiDqcKCzOryS0+FB
/0qcOitfUao1D5GlKNFrZYnIBe4OW3rpYInlvDIcXmWwqxQTA+nCR8IARbmjP/BYgF3uBLb2EwWM
f8doPnQ7F7f5qB/tLQjIQx7CNORboLM4wlfy8aZIDR2se5t7JmlaCmQxKrHROjS0b2kUVLqI3ArW
F+MzJvw4Cu6vUO5y3oKG7QUWEQUlGnN2Buh7oWNJZuYIfiqdcJOOiUeP8cB9Bfce4qyrouAhA+zg
QrZmrGsHMw5Ic6afpMqHTq+158TkkUWQWOCTmOxfnnHVPcVKG9tOvQaTepH04yOaOGtVB0cbyPce
gKqvFtF2iW0kISTiwx47r6RtE1Yen1mZZI3wNSTVckjHMw2lSOeaX8bMxTACYobWDM916PCRYX/H
Z7pMM4uLh3kxdTumcnSWHIro8cdF5Eb2Tzv7x4HMmPqUP6pSBJ/5rj3ZPeCev2lJJPs+kRsCe79/
mGBBpnfxqV7Z482Z96gGwNEFmy5ROQ5YpoccmIYVVxZN0FlZYhX/gOHBK2eEy7xC/Xqt+sBLXg/j
Ra+3kuPbW/1MHmcUV9HyWrcNWGnyuTsJPOuWgyuAc44G5sih9+KpGI4gsjUKkVbjeW+8R1JEdfHl
xze8+zDPXaSl9NgozxkmSts1R309E10sD1PVss3HktM3RLMtR4umsfj8mn9rp41RReVb422SK891
ZO3xAUPW91XnwPS0FYsPLe69RqGkvUO0LVNzLR9k1iXsATotFQ9xWDEKYSupDBq7LdKlx6621q9u
42q3reAcm3Hs+9iEmKgOuL+bX/yPsmtpblzH1X8ly5nF3NHTj6UsybY6kqWIsuPujSqT+HS7Kolz
86g6Z379BUhKIijIfe6mOwYovgkCJPFBDXuyOmJxsJOZgERxXom564778SjGNd7BJK7TKz2Bmxu0
FcMSR9Vky3SFqgxMxHhrhepVPJAavsft75qvQoTn9hG7nN6V4K2CqNY9xpvoUa0hB/Au0uEUX0hx
mBd4BIev941+bwp8GZU1Nsl849FVXMNlVveGSJE3Wk1hj4G8fmnrSowGp7mdGORvCgHCrIrY6mbF
BUctmj0Jh6104FI05BS5T96wL4XSvuuabFQnBvO5mwFH09l44eNqKGry2rSnutx9ouZS6C9VE4QQ
Q8ebuOGnaj+RYBZxj7KiJoZudJ3RcqozER/GayOGXamZFlbdcbD9WceAqlq4VqMkPO6VdAxGbEUc
9VmwMk+a2V2j/zDK8lVpPNfCHisIpX9CVWxJD8NCiEBi+iie6nuYuPgZL1hhx5OVs1N0OWFg7Kgr
djg8UnUb+d519SrzqF6jKAI92mhI/71EGYqqGB8A849TcVOrkni65krCwOesJxUswLhI7qz+Usph
ITZWdaRuPtEDsqpYjDEQ+B6PApcokhWaeXN6xRhUN+r9XvXw8/QpA08JG/1CfY1v4jYNxhq28x04
sBgicrfIJuifw3Iz3f5ASk1xpUiVwAx0MmDj/KaFNE/56owiu3QM9ZAM3/U127rcb7j3ouVaJTcE
MDpATtLGj4X72T71olKbJV2WtvE7+mxoR4UFHgrBXfDiziVIJTtKF3AjadpVtktAkggmUZIJORD6
4ePqex9mw5zD/hLtgfsrlZRJounW46oZNV3N/6n+woXTfSLnfH16uXye3t4vjzdM/Ic6RWdzvORm
z8SZj1Wmby8fP8dqdV3BUjYEP/5sd8KmyBZs0LlimoMEMlMkX70c5atKqmT0MWI93Wc18/gfGv0P
8dfH5+nlpny9iX+d3/6Jb/gfz3/ACkqof0J3ci8uMdePyms4jnYH9v2HZsurxEjsiWOs9lVGyZzt
1tTluPdFVjy24VzNVJXlSxyrxr3mK4Ef8SEc7PfGmaDBELuyJPqi5lVeJD/ilUKV5mqFx/UadIil
K7eozDATe6JY9zHBV++Xh6fHy8vUeHQm2hS2CmYnnSDpOxpJBn1fNPwVuv5knC3dJu3Ilx2YG1dp
Wevdsfr3+v10+nh8AGF9d3nP7vhxu9tncdymu40FSJlUUeRxbi594b8rQtbj/D/FkS9YDgq+bDB3
m1Fy9eQB7Mw//+Sz0TboXbGhSp0i7yq+7kyOOvyO3Nzy8+dJ1WP1dX5GR69+FY99cLMmNb0F8ads
HBA0QKfZwr9fgnpDblwZjsvulCCyxIGWpIeIVaml/N+t60jdtZKPKgR1u68j7twG+SKuyAU00oY7
WTNMnF1f2ZK7r4dnmKr2AjP3IDxBihAkbTXanlD/bicwf1QCseKOVCUvz03dTpJA+m9HhSCxSqbL
AP41tihSDvFP8xK9AZnU+3gnRCcv+z5ke4qKFG0kck+YOgVoYwY+N9SiBNSnbGfLKG0Uc4JNHb/n
nv2JPGfwnPZQ5k20QZe4fTWFRtun96+mN1MbqvdeHpv0UlxOp+P5+fxqy4S+Czlu72T3t3bp3tDB
KICHdZ32D7D0z5vNBRK+Xkj8RsVqN+Whw58vd0mKk5rIViNZldZo30W7mMXFNFPiFiEigt5tsNHj
U1RRPMFGvVJdrZBGMEgpqJRqbXi1F10mkwc2aLNOpDNSqQO4oSdHvdumh3TXcL0kGV2NdmVcsVVh
U1cVq9PStP3aSNbGnEuPTSyvx9S+8Ofn4+VVIyQbnUYStxFYs9+i+NbOpV2LaBksnBGdup9rYhEd
3SCck3c4A8v3Q+6Se0hAPa81XT02HpObXeiGDlOSElqwJUivnukC62axnJuxUjVdFGHoeEzGCD80
AVkwpIDlD/8SGGeQraWJmaiP95I6MhGLFDU1Q4Nq7QsUmrWJp9y4INIQ69M8sW+jtKDoJkBDEjvl
pB26qSa81PFyER0Cp78vDmC94mRc7fnzUDyUxNPEXdq0MZ8HJsnWfA3Ue8p2l/JQNLilW0EMogXo
TElSQ7dwW4s+mawr4repjmnWRezpjh+kvj5pZctXEsEcvG5DSUdEnyO6XqCpw2jJHFyZmjsYMVcb
/EC3trV5sDjQ2njFkgliEaX3OvSYi3AuoEnvC7uw23W2lqkoWbung9nD1VD9uRbsN6OkslSB+0yf
xDP0ZPSYvddw43yXIZ/NfKhlJ7uVlfj4eHo+vV9eTp/UQkwy4c48M8RTR1qapGOuQogMu4wiIYQb
t7toLgG3lcS5NyKwqTBjs7xVEbnsO2RgeKZMgt+BM/qts6M0Uu6qiEHqSqSBnKfaeRgcK6fMWSzG
OQ3U1vLRSSJv4rlTEvl81KQiqhOHhkuRJDb0OHLMqFTrYy4Wy5kXrTkabadBt2ptwAiqVrFxReRk
bboU0TGzlkjPQzDAa3yEyrD4t0eRLK2fdCwUiTTo9hh/w9iTFGUr9j2fB8qK5kFIQK0kgebZEa0e
QvKMfYAPnAUBtAfCMgzdEYi5pvNZAIe24hjDvOZUEeDMiDeqiCON8DTsDECacisRze3Cd7mXmchZ
RSFxUrSkjZJArw/Pl58y7vn55/nz4RkBNUBjs+UR6OibArVSMEhMqTB3lm5tiaC5y3r9I2PpWUm9
2YxXl4G15PpXMoi0gt8L8juYz6xSZs4Mtn5Q+PvgP1OFDiktnD8z0XzGXe9JxqIlMntuYV4gZapZ
cxO9CH4vFnPye+lR/jJY0t/LIy0qk457oGlz5amjQmCSb/C0b+IDeRAYFVGYePqzjnOsPOc4pqFY
NWl4OidduuxSY3yx5YwKHtTh3SHNyyqF2deMYsnZtxJTmeATgbxGs2MqBeqHxdELJzpgmy0Cn8z0
7XHO7gLdFShpPdh+84SS8ipGX8IREVGYLGITe8HctQgELwsJZvRhRTBmENpKjkdMJSS5Lg96KFkL
+rlnxmtCgj/zCcEO01fEFVgm/JUl8gI2+h1yllZG2glI4svNnIkhMlOBVYiINaQb1ZG+wMB6JrXy
0CWE0HbRfr6gRhm+cJkoV5mMYN+QPKRdeMAZ13uXmZyqWGBkwWNJPlIvjL/XJa1Pb3jbldeoXJRW
pZCJtciEnHxtUSYKUo3dM9A6URW2YnZ0nMmvkrVICgt21OTYtZGPlGSHcfaOlFoOCQnd0cwXqh0t
EA5F0FMM13N93std850F+ipPVsD1FsIJR+W5M1fMvJlFhpzMWH+KNl+aYHeKtvCDYFRXsZgtrlRV
KHy8qZoK13dTE4sC4w/mcRDS+GptA7PFodH8mvs8cMBmLCZGAr3CgW1N7cN65jr2mOqnjseRfO3U
j2uqhqmMrN8vr5836euTeXcBOmedylj1RKUZfaEvDN+ez3+cLR1m4c+MUdsWceCFJLPhK3XI9/D2
8AgVRQSH3ypIc5cqW7//WJXx6/RyfgSGOL1+kAPSqMlBplTbEQq4YqQ/yhFnVaSzhWP/tg0kSSPq
eByLhRnkLovurJUcJ75jr25JI3ljfbIao7+JTUUhSUUlVGp2kh9+LGxwwq4b7f5RUVPOT5pwAxPj
Jr68vFxeacASbQIpy97CIqPswWAf4MLZ/M25WAidhdBdoG7fILGEzRhGc7hHs3nqHlxUXUl2K6SZ
Jaq+HNUM2w7rEygs+eHofpSxZb7R6vM8Mkssnp4NOhyxmt0w0R/UiuQXSejMiOwDij/hyY6sCesb
WAHrXoeMwNL9gcIZ38AIl17driJhzGlNtQh+bWUZ8g8uk3DmBbV9bhLOFnaVgDIBI47M5YyOCdDm
po0ofy/o75lrFTGf8f5+kjVlcoHO5HCKAXKW1K7xHWKMLBYkHHlVNojqalBEEHgmlK5WfROKIw5K
qzsFbYAK7YwFNC5mnm+qBaCIhq6t6IYLdsqArolO+8bHQFh6Rm5aizFb05MskdggKBToI57GsjU3
cWCE4Zz3ylPsuXWmZLNnrKGvtuKuH/v4uFfWYy+pnr5eXrpIb7akIjwdqvP0v1+n18e/bsRfr5+/
Th/n/yKEa5KIf1d53j3VUY845Uu4h8/L+7+T88fn+/k/XwglaUqCZej5ZLu89p3Mufr18HH6Vw7J
Tk83+eXydvMPKPefN3/09fow6kVu6ZI1WG6clSM5c9esyP+3mCE86NXuIWLy51/vl4/Hy9sJ6mLv
+vKY1zF3cUVyfesgQRGnlrI8LJ4UrcdaeEu+Q4AVhESH2Liz0W9bp5A0IvjWx0h4YFvSQ8uOZh9m
9nSSh7FRS5PIJ1fDRbX3nXBaqdD7lfoSTyg5U73Z+B34ibV2xoOkVI/Tw/PnL2OD76jvnzf1w+fp
pri8nj/pmK7TICDyUhICIrF8xzXPxzXFI1oJV4jBNOulavX1cn46f/7FTLPC810iopJtMyF+tmgp
OWywogTsCfMEm4S2wZiLFBZ42wjPmyik2bPyWWRzxzEPSOG3R8Zr1EgN/QLSDuGmX04PH1/vp5cT
GAhf0GmjtUauJTRpNibNw/HyCyauPjJrxWTMismYFVOKxdxxxhR7tWiqdax9Wxxn/HHUoc3iIgBx
QCBfBqqlA5ocqgECB1bdTK46ckFoMuy8OganTOaimCXiOEVnldOOdyW/NqOhWAbuMhEOa2hcmTBm
GTjw1GXcpA53kApXWwaP/TBsgX76fIOFwt8hRckeD+rMGZj7Do2dAhQQW3zw7qhKxHLqwkAyl+zd
RyTmvmdagautOyc7Afw296UYlCB3QRRPJLEqGjB8z7eSzpwJKABgzdjLlU3lRZVjQv8rCvSF45gX
w3di5rnQTWZUsc7eETnsfS7x26E8jztokSzX1BTNizazIINe1abDxTcRuZ5r+i9VtWPFfuhqciU8
dd7UocP1Tn6AaRJQxFTYR2CrmTriRZZxibArI1AzjCaWVQMziVSwgjbIMCS8tHZdGlUEKQF39SWa
W9+nsxpW6P6QCY+fFU0s/MDlDC/JMW+wu05sYMzCGamPJFGoGpNjWjlImM896+sg9LmW70XoLjwT
vTre5QHB31IUMxLPIS3k8ZpNoeAbh3zmTljCP2CAYDRcVqJR6aOeyD78fD19qgtARim4XSznhlYi
f5uG562ztM7l9XV7EW12k3qYmWbqUg2YIA25WWqsJswhbcoibdLa1gWL2A+9gEVEU7JfFs9fZHe1
v8Zmrrm7WbYt4nBhAuBYjPEZmcmkgYY1sy58og1SOp+h5pH8vkdFtI3gP9FFCOreHnMTQU2Rr+fP
89vz6U/6dByPvPZHkoWZUOtcj8/n19Hs4l4mZDv0QOyHklcJh+TqzU1bl1xYzX4DZ0qnKgA6bLXy
Cek4Rl4X/+LmXzcfnw+vT2A1v55oB2xr7VXKvfCRsdHqfdXw7M4F+EoOKsmVBA3GvMrLspr4/rtY
C+40k2+a1lBewaiQ0UEeXn9+PcPfb5ePM1rd3AjKfTVoq3IyMCiJX6nQQzC8Czm0/zuFEnv57fIJ
2tiZeSYVeqbcTwQISnojGQb2yVCwcG2CeUsaV4FD7j2B4PouJYQ2wSVmUFPltu020RS2mTBIppmS
F9XSdXgjlX6izkneTx+owLJ656pyZk7BvV1fFZVH7w7wt221SBoRMUm+hR3L2PiSSlj7OlGIUsHO
ncoh23QWV9ilrNpS5S41XRVl4s2bZpI6A813zdu6QoT2zbWkTO5pmj0RCxKY/txe3K0VQNyksnaO
4pCKN2FA+2lbec6Mr+KPKgJdnIfbG82RwVx5Pb/+ZKeO8Jc2GrCpaJDv9ES8/Hl+QcscV/rT+UNd
ho3UDqlZh+b5cZ4lUS3dg9oD0b+KlcvbF1VmIl3V6wQB7agbRr12+CNxcVz6E+h5wArZSYi5GUIC
VTuf2GyHPPRz59i/l+w7/mqfaKfRj8sz4iD+9s7RE0vrUNATrmebfr076dVs1SZ4ennDA9gJ8SHF
vxPBFpcWvGsBHtIvJ5AgQdZmRYvRuItSObRc30SwEDL4+XHpzFx+EBVzAj2/KcBo5J5sSYaxUuG3
65q/YU91XOu3RzXP6Oi7i5BfZ1x/Dp/uqKNjN3OKtFVxS2TXw8+b1fv56eeJc0DBxA3YWAFnsiJz
Hd2mJKvLw/sTn1OG6cHCD0e6EX448ucYLML7cdAxjHX7+Ov8ZgRw6eZQfYcPWczTjXadkdOabxIW
JMomAnXpp/WgXMSYGyz96+mgwKsJEFtzOhUIp0Vc5YksjzUbgwWq5GawJRNOmTC6IrcLVX/jk/qu
x5aCpidm5B90GwI+hmWnjptI3zWglzP1UsAftJAOHi6n/d3580MV4rJYZTvW0wwUz90G309VMUYS
MV+nmZyChgAqMJyQHfi409jtSWI0rYri23bFgrwr5HH4YbqMEl7UbFmAZs09CpeGgFV06V/MnlVo
flrn1BtQ06/4LJMU+gHLZAE6Igih4bPBcZFKsd7cXynzdgoRVrHzaNdkvKeaTqBuaCcrW8TbCpST
qD6Gdp3lM7txpdXrOxljoY1qTvSpdPjQbvx1j780+Z2CUSlNHctgVOQ5naRTWH/CwocaI5r0UhxR
bUxFTaZRnBWxR0QfN4/DlZtI0m7yPbd1qlSIJ2ec0SqguQ6sH+MGTDJnymFD6W7b7zfi6z8f0vVz
EN46KlwLbOMIdiC2RVZlYAFsybUPMroLf/RpKxvOAMFUMhqI/Wkc7cCqjXYiTjFyFdtDmE7j2XQ1
mChCg5qgz9zQBFl1hQXhepGEcb3G9DHgVsqliI6bqzxZO0ygI31cTcf1YweCALVgowhif8noGEw1
VGgL/JQc4XWAeRK81uo4u+x2J2S6iaJ3wpMjnJhIg/LTGsuOmmjUHmRgvFg+Q11l3RZrWmhoubKG
bZUHozLTXZkTXRIBq6uOaM17XpQfSsqSDoUy4ITuU3MosyNI6MlhVKvNbriVBFfrlb5RAT7s4VQc
3G1wL782nBi7A3aSXTkaUbpy5U7RHuqjh4B8MBIT9dEJa1B69AIaDBMJweXPQ+mxmu8FHvtdnWpy
r5UzZmpmqBTjjpeeolAWVHbfmFLc5C4kDDIRY8iujlHrLXYFbMVURSLMKwsA04yrVFT+BJUrR+Ll
TU9WZO8pblRHPorrn20T6sTa0dU0FdxZhhSZcpfHaKFJKmgjyjjNy4ZlSSWMm50aQ+wucNzllemt
dm2YbpYolvS7ouKoY8Et6SiSxK4S7TotmlKdKXBptkIOMFthmQenjppNWjizIzPSMhwAjU2K9DqS
YEtMFw0447jbTBQ6OOPLX0fHyr3HscAlzg09TRGL7IqIpGkTlXYywytSok/TfK/MeLTI04ZIUrUH
sIBKlinn6jSb2yk632pYNVMzvEsxmj8dLLot0ZDXK2RXBIKZxlI4ehZX58EW3MaT67JRrh6uDxWE
fhkPyJAi0Ckms8q2gTMfz111KQFk+GGNlvIsXwZt5e0pRznHj/KKilkYDLKC1PTb3HPT9j77wVRQ
ggdoe6+1WgkqNUa1nFojylC6TdNiFcEcKQqrDZQ/qrFiS1Bn2ExLu9IDG3Oe0mmVW4TCeSZngUTH
NnJG8JI44g/Yipg1nEzACmhFQH91WIPtfZ3RYGySewuTrZlCr1TfF1Gr0Q61o8bT++X8ZJxF7pK6
zMjBmCZJKD9EOLWhLXsPDpVVf30QEdM8SQ9IYiq2OxSpARIkf6o7MJsoz0myUVokl3HZkENGDQSR
rveCk2Dqy86YSRG8b5Rvxy3NkA2KhU6IXZHdgML+K0sbSGovW9O8e7lpJe7pTHGoPY9aqDtKrmsM
/8rhMPXSpyvM+lo9OpZZ87O0w84b9aNdjd1BQIdtKtYfTfm2WQ2WKIsWTWVWMxNC2he7Qx0V3dzd
3t98vj88yusK+3DSxhFuCnzCAyrDKhLZhPObToHovSZiMTCSfVF8t/MT5b6OUw4tbpxoC6K7WaVR
M5HJGsxiHopCCqbGiAHcUbQWMhy0dfRNs2XHqU8gGs7g7NmwgbL5Vg3/4qNPMIq+PbzsHI9UV6w+
culzkwgyxabujmPYIu1EGE+BewinUH4rlFnWA/8RS4IOD/y+hC6hdX9n8+NDxTBxq2jpoVLP07uJ
9fSzZ2dxGjgT15J9oiKKt8fSY6q2qrNkM27vuk7TH+mIq+tS4fsMjVBm5Venm8z0vCrXPL0DABq1
CUGBojUHTNWzd1kp9Gyqorjd+eTRVZ+MaN+kq4vK7mwzpiX8aHephH1pd2VChCHyikgasxM4TUYK
5Z81pvcxew2WIDEcJGWVIv4NJZYmVl+T9hc98CeH9GaS++1nnzcZjNxxeLVqPOxhYBT36Gy8mS89
o8M0UbiBeSmKVIrahZQ+nsP4GdGochVsX5WxQkRG8Kvhl4RTo4WIPCvU/Zlxh5MVGjbRgk41hFEN
f+/S2Lx3MaioLUxzrCimY/buN4UOgUv5TGTlSwHKBafpkqSjuE+Eq8wksxxYuZiAe8dQmiEB8Fcb
wzL4v8qebLmNXNdfceXp3qrMjC3LjnOr8kCx2VJHvbkXSfZLl2IrjmripbycMzlffwGy2c0FlHMe
Jh4BaK4gCIAg6IDqPmGfjkyxzwnV1aH9z92R0nMNVloxPOdvYBurMS1HbUkPmV6aWYqL2DSTjjTh
AHPamXpfD8BApQRYk6c+qha8rdT9hBEzdUuZYq5ADBmTtXu0gQqmByrw0nBL6KiCU/37OouMuvHX
UMw4XtmMg1y35FMlEhhVwJGj9lUijHKd/ow6sdEbcmNFAmIbNz/HwD18iILO3rbx2jigwGwJzPqs
qXQPRmd2Dxs7QoekajIYML7sHwJxeueSVi36I2GartQ8+dV6Q2BhWQ1zYaynsWAR46sTSWzpinmS
BnseT7yOSxCO8sEvug1rGnOZTZzR8op8b+olkRrFAxXLfPZJ/lXIx8+pStAbi/FOTnTnyN7KLhx/
kysP3xuwx0XDupl6NakkG5ngUwGAt6KIMBUpZsq4CuChUJHz6qpsbF3GBIMGNbfnqZZzTbJaXOdF
47BBpECk0JcYmczUqoEFP7lsCzN7U1nhIyAS2K1ZlVu9U2BHzFzGWdOtrEA5BaLcX7IElTVydAq0
TRHXU5pXFNJlbCmAadlQwFCm7MpB97kbbn7sjM0mF8gE45MUNhjWTW3OoJakNmCgM2ZTIfDApZiD
kUmvkZ4qLCI1RTHDJdKlCemKkTTIi+bTxgPM31kMXKCBQ64KOVhq4KI/qiL7K1pFctv2du2kLj7j
uZS1cxRpYgasXAORPYttFHuTqCunK1SRsUX9V8yav8QG/80bukmxlHrGwq3hO4eNVnFQNAJCP7nB
QcEvGdg409NPpgwJfpw3ziYqAc6qkbBqbWlJhzqmTuBfdm+3j0ffqQ7LJFrOERCClmiSUm5IRGLk
gZnCVQKxs6DGwa5m5hGRKL5I0qgShmRbiio3++o425qstNskAfRObFHoTcn5MEFz65x+2oov9FoG
3m7noklnZlPCINljg1VEFkcdrwRrTLMXy19gRqdkjoea3PlK/XFmHlbailV6WrSP15/Foeqk5nJn
wRe6RGaUVFQsnwuneBZ5orEHAWtRYxR79ELuSjQjLzxqgJRpG9TLZiKss81CKqfwauEgk0jS+rJl
9cIm1jC1IUvxduBLRRUllTLq/FLQawHGfw37Hu2JcwilrXyoJEmA6WN5GXhzRn8gWf4wyXWaUK7+
AZ9em8+xjtCCbOHm+p3a6oZKEzrgp/KlhJl8Y/ZakFWIbCaiSBwsJq7YPMNM4v2GimWdGlLaNwSG
1ZKDFLHZochC1IvSWT2X+Wbq8R4Az0MlVH3hYxEKMmN8ibmGr5RC6aJB43PgJWy8pgtR/R52nCW+
rDO7Aoviy8nxZHrsk6VoImv12BL5igRmfEBTsl9TTQ8XMl1wshiX8mI6+Y3qkJ3M+mxsEOF2l3ra
ieiQJjvUbqtF1Ad0E4cWfLjdff+5fd198AilI9/rSv8ak9sMRwUbd9KVw5xtWLyKqgixbW5eRIYf
Y/P3L48XF2ef/zj5YNiYaT2oPB2oPPRBjUn0ySYiSexMCRbugszC4pBM7B4YmLMg5lMIY8Y7OpiT
cDPPKXvGITkNFjwNYg6MDJlS1iH5HCj48+l5CHMW6v/n09A4q7yygWZ+ovQxJAGVH/mruwiUejIJ
NgVQJzaK1TxJ3EboGqjr1yZ+EvqQvpZiUrzXOYcBNficBn8KNYSKTbd6eBrs+3stPPFYbFkkFx35
ZK9GtnbzM8ZxN2O5WxIiuAAVhzoJHQnyRrRVQX5cFaxJGOXhGUiuqiRNzdsFGjNngoZXQiyp2hJo
K8spdWSgyFvz7Vmr8wnLfUzTVsukXtiItomtZBJtniBrUy6boltfmuaB5RhX+QB3N2/PeD/s8Qnv
wxpG31JcWRsE/u4qcdnipeaQLgy6aA2mP2pcQF/ZTyr2bipQZ4iyu2jRFfC5vHBNbTVIIz1NCVc0
hjbaewy7KBO1DExvqsQ8WfF94xoSU8XkolkXlTXJA65k5Ln0gq0E/FNFIof+oY+MF+VVx1LQzpgy
dkdLxyWjfTRgbKK/TZ2909o0erm5LCYDDliItAw98qSbnxYscm4wuSR4iZ8YlJrFGLhvB90Y5fJl
VKxzzHnzTgtgjSB18JQ+5BnXKuw422aOPKj3y4ef24dbTOz2Ef+5ffz3w8df2/st/NrePu0fPr5s
v++gwP3tx/3D6+4O+f7jt6fvH9RSWO6eH3Y/j35sn2938nbpuCT6997uH59/He0f9pi3Z/+frZ1j
jnNpwqNTsUPDPMETFuCWRlTGyiaproUtvyQQr58sgeNzeu4NGmAyXRHpt7UIybqk4xgmZRhj0iuu
SfF43qA0BUxgjDQ6PMRDGlFXHunKN0WlTB3TGYniBHujPInPv55eH49uHp93R4/PRz92P5/6PIMW
OZjppFO+x7J0br0tbIEnPlywiAT6pPWSJ+XCepbcRvifAKssSKBPWpnO9BFGEhpmjtPwYEtYqPHL
svSpl+Ypui4BTRyfFLY+NifK7eGWcmWjhpd5Q8eYDrnYNBUbztJsmnl8MrnI2tRD5G1KA6mGlfJv
uCXyD8EubbOAvdGDD68WKQft27ef+5s//t79OrqRnH73vH368csQQP381swrKfK5SHCiQk4SRkSJ
glcUuM78GQZpvRKTs7OTz7or7O31B6aRuAH79vZIPMj+YDaOf+9ffxyxl5fHm71ERdvXrddBbl/X
0zPIKUNXf7IAfYVNjssivbIzTg0rdp7UwAJ+h8RlsiJ6v2AgDVe6QzOZTfT+8dY8AtJ1z/yB5vHM
hzX+IuAEqwruf5tKb78NK+IZyaIzSpvusZumJr4BzSvw9qheD4vwwEag2DZt5ncD3zzU47fYvvwY
hs+tnoMmHK57kTF/fDdq0N2SVk5JOhvK7uXVn7aKn06ImUOwX9+GlNSzlC3FxJ8uBfenFgpvTo4j
8wU3zd1k+caoezIyoiy3AelPVJYAT8srZNTIVVl0Qmbx08tkwU78tQNL7uycAp+dENvjgp36wIyA
NaB/zIo50cx1eWYnLVbstH/6YQWVDYvenwKAWe+bDjNWrOOEnGKFGJO+e+zLMgEWJh0iOtDUTSA3
4UhAOWy0fCd6Esu/Po/1opCQdFWpnopzp2DqwcA8Ikejh4+Docb/8f4JE8DY6rJuufTA+hLNPlfo
oRdTMtmj/sRvqPQze1D0zerGVWAyPN4f5W/333bPOiG0aqlbO8vrpONlRb7Fq/tTzfCUL2+9SiWG
lFYKQy1wiaE2BkR4wK8J2gAC762UVx4WK+j6R+dNffnn/tvzFnT258e31/0DsYFhnlFqqcj8o0qS
6TvZxJQZVAemDogUYxolhUho1KBkvNOWkfBwc6glhXAtc0HPwsOkk0Mkh1uiyQ6t+7HXo/JyuN0B
obvwFQSMMAarb53kuR3RY+D7W24Oy1OU9dkBBUFWJd9/Dem6BgUx8CO2oeZlRNcEe4zYhNjQR6zS
iKm+DWVPjqfU/WCDlFsil62SNnNgIy2Y01a+Vg/V8Tw/O9vQJBkDRiaME8QVvBFF3myCVfctu058
Ow3Rl9yXyD1cW7zUOCFa5NImA8Z6j2MMam0B/zefLN6ZCbMxlJGuaPDpeMJyRmSSzRvBA4IZ8H0s
PxOUziyXBIvFhgsqEMWcCl4JerTlhflaBHg2S4t5wrv5Jg1x7UgRDBW1Wjsh7F/E6OuKBa+lfkRp
BAG63lqhmkdR80N2vPvRgre/UTRQyV1XLl/6ncj6KssEeoyljxnvCY/dM5BlO0t7mrqd2WSbs+PP
HRdV754WXoB5ueT1BUZArhCLZVAUn/AmW41nVANWbdWYK/y7tJdfjr4/Ph+97O8eVJqvmx+7m7/3
D3fGpTIZ39M1FaY9iLQffqzIx9dfPnxwsMpZYvTI+96jUNEV0+PP55bXt8gjVl25zaF9xKpkUBf4
EmMSaWIdx/cbY6KbPEtybIMMQI2/DNnSQ4pPxZLovCvNRFo9pJvB5gXsVBkRF2mS4/t3MojKjnVg
MoKXitAG8S5WojLvFOq0NmDe5Ly86uJKZgEwWcQkSUUewOKT5G2TmCfzvKgiU6eCgchEl7fZDNpg
9hIPVljql1nyZLggoSerAeGnEuWa0oCDQAM91AKdnNsUvpHLu6RpO/urU8fFBgDgpzR2Lw67JLBI
xeyKft3OIqEtZEnAqjWzby4rBEwc/dG5JRK5/euTySwz37PADb+T60oAtoqKzOj6iMKILdTobQPq
WmmvDtSM2rGhKpbMhU9JajNox6amSgkE5UgwRb+5RrD7u9tcnHsweWe99GkTZk5ED2RVRsGaBfC/
h8DkI365M/7Vg9mToVeKeeKn6VlVwW6kw/mGnaUueAIrbgUKChKMKDwhSgrrdrECYQBqZ61ChFsP
3+f4zC7en8ckBnhA6MaZIo5FUdU13fl0Zp5HR/LBZZ4yGWa0kKaksd7XSdGkM5ucm1UjoBQViBWN
UA623fft289XTP75ur97e3x7ObpXx0Tb5932CB8u+j/D6ISPcSPpsj5K7dzD1OimUlhzgZpojImE
1sNOSosBq6hAQkebiMwJgCQsTeY5xhh+uRi/lYOMSW6CIfh6ioYNhTqSnaeKn6x+ljC+9bIr4lie
6hHfzdPCmCf8RUgPnl53DTMfFqku0SY1pH9WJtbTI/AjjowiMN0CXq2F/cjg3pbXE9yiLKVDno/r
NbKK6sJfOXPRYDLyIo7MtRCDHePfo5DQi3/MjUWC8FwVumpdq6zxDn+a2JCyKFJnYcjRXLPU2Nol
KBJl0Tgw5U2BXRU24MkQRFnDcrJWZ4mJqCynYDH7yuYB7UcOWWCLG1IfOzqLO4hJUQmrCRqhdgWV
iKKWXLUWgxNsOJfVqqSEPj3vH17/VpmD73cvd36MiFSoljKHvKVcIJAzN1mmHDmZQqCbtQmmOKWC
ZbgKcOzAeElBR0qHw8pPQYrLFq+DTAe27XVor4SBYlYUjW5nJFKT36KrnGUJd+9UWGD/veKrbFag
cSCqCuioyBj1IfwHat+sqK0E9cGBHtyn+5+7P173971q+yJJbxT82Z+WuII2yCtWwJzTC5vFwGKt
MXFJRgd7VmArK6O5pg7UFoAW+HJNDrNpygrVv1rduMPLBhlruKHHuBjZvK7I0ytnGa4ZrGPVg7KQ
d4nNq1Im3K08LjBJxVqwJcp/FJTmIP/2MMpBl47g/Y1eGdHu29vdHUYsJA8vr89v+FqTdVaVMTS1
wYCxc8/a7bP2Kw1Ta9F1mLhEeNYt6TK8Pn2gHDdgxJS/cnyX82jmyOUB3l1uYkwQtbRqQAzJK+2s
JoPrwJJlOd4OWnWzqlgKK0Tkt0bW7j9eBBIer+GFFi3A+riToTBDRKEkAFsVnwo2r02qMhDr7bAO
SnuRDsRwYx3FOrfMeWnFF0ld9PccieLxKi6tHEiSqohYw0KJkoZLQ4p4vXH7ZkIGO66JWiuVnfzt
ybMe3KdxOtBEdYHwEEWdMupaieS7fnZhT0ph0brtfw+Ol6nkPq4cDyfnx8fHAcohWCmO/ZkYqGRQ
Vs0ZrQ723ZG7f1s7mqUWcnwB2reiEXmkLio78m2cshU0f94gb7ldXGU+RJ5e2/dEB1Q1I4DlHGxA
M/4yXKvbsKRqWpb6Q9UjgoIKRhLvL2OgmLfSlERGnbcmxQ+rzQhYB4Gd75epVgJUIJ3C+odGCotR
nKhT5YW8SY/KPJo+zp0UWcZhmRljTtaxePo3psIoQVDIzWkF43cyMmRPAbaRXjNfJmdn7veNvAKi
ng1Chq2/uAWMiRtMmeqJP2dXXqis8L05BkRHxePTy8cjfHb27Untg4vtw52p2jHMKA8bdlGYE2aB
MaVGa5yBKaRU4ttmbDpG7bUoTRrot2kY10XcBJGoo4H+zDKTTNbwOzRD0wwOxhq6BeZdbMCAIiZ8
fQnaB+gmUR9cMKQYOTRiKowaFIrbN9QizC1o1LukXAg54RW2P5o1YeP9bx0dSVTjrlEc/qUQZcjJ
2i/HSois9J+lwv4Ze/L/vDztHzC4Cbp+//a6+2cH/7N7vfnzzz//13gxCFMdyHLn0oJxrbWyKlZE
QgMFrthaFZADUztbpYTjKAQlDvpD2kZshCfnahgB+2pcL6No8vVaYWDDKtYY5O0SVOvaujWroLKF
jmiSsdCi9ADoPay/nJy5YBlMVvfYcxerdpPebJIknw+RSMNU0U29ipKKtymrwGASrS5t4rJGTx0c
ctYUaAnVqRClv0X0syy9H9qUpfUDOXSw5Ju2EiElZ5wVz39R89j62vKR1JEqfs2ShnLCaHP6v+B2
Xa8aZhCo5O7qw0erd4RJ2wejsdu8FiKC1a/cvJ6qo/YKW3T/rRTn2+3r9gg15hs88zAkdz8PSU2Y
CaWb6sFVbyj5pFDq7oWyxoavpA6Yd1JPBSUS36MLvZd3sPF2VbyCMcmbRD1zqsJ0eEtq90qEcCPc
xuEJbdbyFlW71OcVxIS40CLCvDljEdQdXiBCFUdaxsM2ODlx6nJzKFpYcUmmNtJvKlmj4E4ebF/K
BK6kqnVgmlVyGrCK0CVEnmhANxawt6ZK5ZVXZGU+XEOoATTnV01hpgGVbwVC/4x9XGpRcZsr8/8w
dl6xckHTaAdM7CwlAtmtk2aBjklX0ezRmUxBBgR4LOaQYNYKOXtIKf0MZsYJ+Tl3LmKjtBveYe6B
YoVXoJDe2vFwEHHUa2gh9zvab8roiA3Wb5XXA4wdd7w+FOYzpab6OWye9y83/7JWmekcbHYvrygk
UfPhj//aPW/vjPcqpV5qKMRSTe3tR0vXJnP/OmixUYr0O2RyngKx/1paoUdOvv855oLqKYpYckCY
2hpNO6PUIXMc3R6eIQIGBnpDFAOZ51Y99dgzJOsdDnhCxir0IJD34ZAS3XBVKzMcWN44hQQ+YpVQ
pxhfjv/B54GPDXEDiwCPgRuld8moxVDHMCkSGHe2TB0B7gUfkleszS9LasyD0UUFl803uFxtjrNE
TUZNFK/91P8Ps5BY1lU2AgA=
--===============6545667510152358777==--

