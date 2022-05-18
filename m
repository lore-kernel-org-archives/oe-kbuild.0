Content-Type: multipart/mixed; boundary="===============5350352867021557078=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/crypto/qat/qat_4xxx/adf_drv.c:66:3: warning: Value stored to 'instances' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 18 May 2022 14:15:03 +0800
Message-ID: <202205181417.mD5VBlsM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5350352867021557078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   210e04ff768142b96452030c4c2627512b30ad95
commit: 8893d27ffcaf6ec6267038a177cb87bcde4dd3de crypto: qat - disable regi=
stration of algorithms
date:   2 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 2 months ago
config: x86_64-randconfig-c007-20220516 (https://download.01.org/0day-ci/ar=
chive/20220518/202205181417.mD5VBlsM-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8=
ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8893d27ffcaf6ec6267038a177cb87bcde4dd3de
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8893d27ffcaf6ec6267038a177cb87bcde4dd3de
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   drivers/scsi/qla4xxx/ql4_nx.c:3052:3: note: Assuming 'ql4xextended_error=
_logging' is equal to 2
                   DEBUG2(ql4_printk(KERN_INFO, ha,
                   ^
   drivers/scsi/qla4xxx/ql4_dbg.h:25:31: note: expanded from macro 'DEBUG2'
   #define DEBUG2(x)      do {if(ql4xextended_error_logging =3D=3D 2) x;} w=
hile (0);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/qla4xxx/ql4_nx.c:3052:3: note: Taking true branch
                   DEBUG2(ql4_printk(KERN_INFO, ha,
                   ^
   drivers/scsi/qla4xxx/ql4_dbg.h:25:28: note: expanded from macro 'DEBUG2'
   #define DEBUG2(x)      do {if(ql4xextended_error_logging =3D=3D 2) x;} w=
hile (0);
                              ^
   drivers/scsi/qla4xxx/ql4_nx.c:3052:10: note: Loop condition is false.  E=
xiting loop
                   DEBUG2(ql4_printk(KERN_INFO, ha,
                          ^
   drivers/scsi/qla4xxx/ql4_def.h:118:2: note: expanded from macro 'ql4_pri=
ntk'
           dev_printk(level , &((ha)->pdev->dev) , format , ## arg)
           ^
   include/linux/dev_printk.h:128:3: note: expanded from macro 'dev_printk'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/scsi/qla4xxx/ql4_nx.c:3052:3: note: Loop condition is false.  Ex=
iting loop
                   DEBUG2(ql4_printk(KERN_INFO, ha,
                   ^
   drivers/scsi/qla4xxx/ql4_dbg.h:25:24: note: expanded from macro 'DEBUG2'
   #define DEBUG2(x)      do {if(ql4xextended_error_logging =3D=3D 2) x;} w=
hile (0);
                          ^
   drivers/scsi/qla4xxx/ql4_nx.c:3060:3: note: Control jumps to 'case 39:' =
 at line 3163
                   switch (entry_hdr->entry_type) {
                   ^
   drivers/scsi/qla4xxx/ql4_nx.c:3164:11: note: Calling 'qla4_84xx_minidump=
_process_rdmdio'
                           rval =3D qla4_84xx_minidump_process_rdmdio(ha, e=
ntry_hdr,
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/scsi/qla4xxx/ql4_nx.c:2747:21: note: Assuming 'loop_cnt' is < 'c=
ount'
           for (loop_cnt =3D 0; loop_cnt < count; loop_cnt++) {
                              ^~~~~~~~~~~~~~~~
   drivers/scsi/qla4xxx/ql4_nx.c:2747:2: note: Loop condition is true.  Ent=
ering loop body
           for (loop_cnt =3D 0; loop_cnt < count; loop_cnt++) {
           ^
   drivers/scsi/qla4xxx/ql4_nx.c:2748:10: note: Calling 'ql4_84xx_poll_wait=
_ipmdio_bus_idle'
                   rval =3D ql4_84xx_poll_wait_ipmdio_bus_idle(ha, addr1, a=
ddr2,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/scsi/qla4xxx/ql4_nx.c:1868:2: note: 'temp' declared without an i=
nitial value
           uint32_t temp;
           ^~~~~~~~~~~~~
   drivers/scsi/qla4xxx/ql4_nx.c:1873:3: note: Calling 'ql4_84xx_ipmdio_rd_=
reg'
                   ql4_84xx_ipmdio_rd_reg(ha, addr1, addr3, mask, addr2, &t=
emp);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/scsi/qla4xxx/ql4_nx.c:1843:6: note: Assuming 'rval' is not equal=
 to 0
           if (rval)
               ^~~~
   drivers/scsi/qla4xxx/ql4_nx.c:1843:2: note: Taking true branch
           if (rval)
           ^
   drivers/scsi/qla4xxx/ql4_nx.c:1844:3: note: Control jumps to line 1857
                   goto exit_ipmdio_rd_reg;
                   ^
   drivers/scsi/qla4xxx/ql4_nx.c:1857:2: note: Returning without writing to=
 '*data_ptr'
           return rval;
           ^
   drivers/scsi/qla4xxx/ql4_nx.c:1873:3: note: Returning from 'ql4_84xx_ipm=
dio_rd_reg'
                   ql4_84xx_ipmdio_rd_reg(ha, addr1, addr3, mask, addr2, &t=
emp);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/scsi/qla4xxx/ql4_nx.c:1874:13: note: The left operand of '&' is =
a garbage value
                   if ((temp & 0x1) !=3D 1)
                        ~~~~ ^
   drivers/scsi/qla4xxx/ql4_nx.c:2300:4: warning: Value stored to 'opcode' =
is never read [clang-analyzer-deadcode.DeadStores]
                           opcode &=3D ~QLA8XXX_DBG_OPCODE_MDSTATE;
                           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/qla4xxx/ql4_nx.c:2300:4: note: Value stored to 'opcode' is =
never read
                           opcode &=3D ~QLA8XXX_DBG_OPCODE_MDSTATE;
                           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/qla4xxx/ql4_nx.c:2593:2: warning: Value stored to 'poll_wai=
t' is never read [clang-analyzer-deadcode.DeadStores]
           poll_wait =3D le32_to_cpu(pollrd_hdr->poll_wait);
           ^
   drivers/scsi/qla4xxx/ql4_nx.c:2593:2: note: Value stored to 'poll_wait' =
is never read
   drivers/scsi/qla4xxx/ql4_nx.c:2739:2: warning: Value stored to 'stride2'=
 is never read [clang-analyzer-deadcode.DeadStores]
           stride2 =3D le32_to_cpu(rdmdio->stride_2);
           ^
   drivers/scsi/qla4xxx/ql4_nx.c:2739:2: note: Value stored to 'stride2' is=
 never read
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/crypto/qat/qat_common/adf_gen4_pfvf.c:46:9: warning: Although th=
e value stored to 'sou' is used in the enclosing expression, the value is n=
ever actually read from 'sou' [clang-analyzer-deadcode.DeadStores]
           return sou &=3D ~mask;
                  ^      ~~~~~
   drivers/crypto/qat/qat_common/adf_gen4_pfvf.c:46:9: note: Although the v=
alue stored to 'sou' is used in the enclosing expression, the value is neve=
r actually read from 'sou'
           return sou &=3D ~mask;
                  ^      ~~~~~
   2 warnings generated.
>> drivers/crypto/qat/qat_4xxx/adf_drv.c:66:3: warning: Value stored to 'in=
stances' is never read [clang-analyzer-deadcode.DeadStores]
                   instances =3D min(cpus, banks / 2);
                   ^
   drivers/crypto/qat/qat_4xxx/adf_drv.c:66:3: note: Value stored to 'insta=
nces' is never read
   drivers/crypto/qat/qat_4xxx/adf_drv.c:68:3: warning: Value stored to 'in=
stances' is never read [clang-analyzer-deadcode.DeadStores]
                   instances =3D 0;
                   ^           ~
   drivers/crypto/qat/qat_4xxx/adf_drv.c:68:3: note: Value stored to 'insta=
nces' is never read
                   instances =3D 0;
                   ^           ~
   2 warnings generated.
   drivers/fsi/fsi-sbefifo.c:176:4: warning: Value stored to 'w0' is never =
read [clang-analyzer-deadcode.DeadStores]
                           w0 =3D ffdc_sz;
                           ^    ~~~~~~~
   drivers/fsi/fsi-sbefifo.c:176:4: note: Value stored to 'w0' is never read
                           w0 =3D ffdc_sz;
                           ^    ~~~~~~~
   drivers/fsi/fsi-sbefifo.c:682:17: warning: Value stored to 'dev' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &sbefifo->fsi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~
   drivers/fsi/fsi-sbefifo.c:682:17: note: Value stored to 'dev' during its=
 initialization is never read
           struct device *dev =3D &sbefifo->fsi_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   drivers/tee/tee_core.c:202:9: warning: Value stored to 'grp' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
           kgid_t grp =3D INVALID_GID;
                  ^~~
   drivers/tee/tee_core.c:202:9: note: Value stored to 'grp' during its ini=
tialization is never read
           kgid_t grp =3D INVALID_GID;
                  ^~~
   drivers/tee/tee_core.c:447:11: warning: Access to field 'attr' results i=
n a dereference of a null pointer (loaded from variable 'p') [clang-analyze=
r-core.NullDereference]
                   switch (p->attr) {
                           ^
   drivers/tee/tee_core.c:826:2: note: Control jumps to 'case 2148574211:' =
 at line 835
           switch (cmd) {
           ^
   drivers/tee/tee_core.c:836:10: note: Calling 'tee_ioctl_invoke'
                   return tee_ioctl_invoke(ctx, uarg);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tee/tee_core.c:555:2: note: 'params' initialized to a null point=
er value
           struct tee_param *params =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tee/tee_core.c:557:6: note: Assuming field 'invoke_func' is non-=
null
           if (!ctx->teedev->desc->ops->invoke_func)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tee/tee_core.c:557:2: note: Taking false branch
           if (!ctx->teedev->desc->ops->invoke_func)
           ^
   drivers/tee/tee_core.c:560:6: note: Assuming the condition is false
           if (copy_from_user(&buf, ubuf, sizeof(buf)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tee/tee_core.c:560:2: note: Taking false branch
           if (copy_from_user(&buf, ubuf, sizeof(buf)))
           ^
   drivers/tee/tee_core.c:563:6: note: Assuming field 'buf_len' is <=3D TEE=
_MAX_ARG_SIZE
           if (buf.buf_len > TEE_MAX_ARG_SIZE ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tee/tee_core.c:563:6: note: Left side of '||' is false
   drivers/tee/tee_core.c:564:6: note: Assuming the condition is false
               buf.buf_len < sizeof(struct tee_ioctl_invoke_arg))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tee/tee_core.c:563:2: note: Taking false branch
           if (buf.buf_len > TEE_MAX_ARG_SIZE ||
           ^
   drivers/tee/tee_core.c:568:6: note: Calling 'copy_from_user'
           if (copy_from_user(&arg, uarg, sizeof(arg)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Value assigned to 'arg.num_params',=
 which participates in a condition later
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tee/tee_core.c:568:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&arg, uarg, sizeof(arg)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tee/tee_core.c:568:6: note: Assuming the condition is false
           if (copy_from_user(&arg, uarg, sizeof(arg)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tee/tee_core.c:568:2: note: Taking false branch
           if (copy_from_user(&arg, uarg, sizeof(arg)))
           ^
   drivers/tee/tee_core.c:571:6: note: Assuming the condition is false
           if (sizeof(arg) + TEE_IOCTL_PARAM_SIZE(arg.num_params) !=3D buf.=
buf_len)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/tee/tee_core.c:571:2: note: Taking false branch
           if (sizeof(arg) + TEE_IOCTL_PARAM_SIZE(arg.num_params) !=3D buf.=
buf_len)
           ^
   drivers/tee/tee_core.c:574:6: note: Assuming field 'num_params' is 0
           if (arg.num_params) {
               ^~~~~~~~~~~~~~
   drivers/tee/tee_core.c:574:2: note: Taking false branch
           if (arg.num_params) {
           ^
   drivers/tee/tee_core.c:586:6: note: Assuming 'rc' is 0
           if (rc)
               ^~
   drivers/tee/tee_core.c:586:2: note: Taking false branch
           if (rc)
           ^
   drivers/tee/tee_core.c:589:6: note: Assuming the condition is false
--
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/bcma/main.c:674:3: warning: Value stored to 'err' is never read =
[clang-analyzer-deadcode.DeadStores]
                   err =3D 0;
                   ^     ~
   drivers/bcma/main.c:674:3: note: Value stored to 'err' is never read
                   err =3D 0;
                   ^     ~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   sound/drivers/opl3/opl3_lib.c:502:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(hw->name, hw->id);
           ^~~~~~
   sound/drivers/opl3/opl3_lib.c:502:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(hw->name, hw->id);
           ^~~~~~
   sound/drivers/opl3/opl3_lib.c:529:3: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(opl3->seq_dev->name, hw->name);
                   ^~~~~~
   sound/drivers/opl3/opl3_lib.c:529:3: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
                   strcpy(opl3->seq_dev->name, hw->name);
                   ^~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   sound/soc/intel/atom/sst-atom-controls.c:145:2: warning: Call to functio=
n 'strcpy' is insecure as it does not provide bounding of the memory buffer=
. Replace unbounded copy functions with analogous functions that support le=
ngth arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecure=
API.strcpy]
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   sound/soc/intel/atom/sst-atom-controls.c:145:2: note: Call to function '=
strcpy' is insecure as it does not provide bounding of the memory buffer. R=
eplace unbounded copy functions with analogous functions that support lengt=
h arguments such as 'strlcpy'. CWE-119
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   sound/soc/intel/atom/sst-atom-controls.c:442:28: warning: Value stored t=
o 'component' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           struct snd_soc_component *component =3D snd_kcontrol_chip(kcontr=
ol);
                                     ^~~~~~~~~
   sound/soc/intel/atom/sst-atom-controls.c:442:28: note: Value stored to '=
component' during its initialization is never read
           struct snd_soc_component *component =3D snd_kcontrol_chip(kcontr=
ol);
                                     ^~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   sound/soc/intel/atom/sst/sst_acpi.c:315:2: warning: Call to function 'st=
rcpy' is insecure as it does not provide bounding of the memory buffer. Rep=
lace unbounded copy functions with analogous functions that support length =
arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.s=
trcpy]
           strcpy(ctx->firmware_name, mach->fw_filename);
           ^~~~~~
   sound/soc/intel/atom/sst/sst_acpi.c:315:2: note: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119
           strcpy(ctx->firmware_name, mach->fw_filename);
           ^~~~~~
   2 warnings generated.
>> drivers/crypto/qat/qat_common/qat_crypto.c:152:3: warning: Value stored =
to 'instances' is never read [clang-analyzer-deadcode.DeadStores]
                   instances =3D min(cpus, banks);
                   ^
   drivers/crypto/qat/qat_common/qat_crypto.c:152:3: note: Value stored to =
'instances' is never read
   drivers/crypto/qat/qat_common/qat_crypto.c:154:3: warning: Value stored =
to 'instances' is never read [clang-analyzer-deadcode.DeadStores]
                   instances =3D 0;
                   ^           ~
   drivers/crypto/qat/qat_common/qat_crypto.c:154:3: note: Value stored to =
'instances' is never read
                   instances =3D 0;
                   ^           ~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   sound/pci/oxygen/oxygen_pcm.c:758:3: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(pcm->name, outs ? "Front Panel" : "Analog 2");
                   ^~~~~~
   sound/pci/oxygen/oxygen_pcm.c:758:3: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
                   strcpy(pcm->name, outs ? "Front Panel" : "Analog 2");
                   ^~~~~~
   1 warning generated.
   sound/soc/codecs/cs35l33.c:1161:3: warning: Value stored to 'pdata' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   pdata =3D &cs35l33->pdata;
                   ^       ~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l33.c:1161:3: note: Value stored to 'pdata' is neve=
r read
                   pdata =3D &cs35l33->pdata;
                   ^       ~~~~~~~~~~~~~~~
   1 warning generated.
   sound/soc/codecs/cs35l34.c:260:3: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   ret =3D regmap_update_bits(priv->regmap, CS35L34_PWRCTL1,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l34.c:260:3: note: Value stored to 'ret' is never r=
ead
                   ret =3D regmap_update_bits(priv->regmap, CS35L34_PWRCTL1,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings generated.
   drivers/vme/bridges/vme_fake.c:560:5: warning: Value stored to 'done' is=
 never read [clang-analyzer-deadcode.DeadStores]
                                   done +=3D 1;
                                   ^       ~
   drivers/vme/bridges/vme_fake.c:560:5: note: Value stored to 'done' is ne=
ver read
                                   done +=3D 1;
                                   ^       ~
   drivers/vme/bridges/vme_fake.c:604:3: warning: Value stored to 'done' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   done +=3D 1;
                   ^       ~
   drivers/vme/bridges/vme_fake.c:604:3: note: Value stored to 'done' is ne=
ver read
                   done +=3D 1;
                   ^       ~
   drivers/vme/bridges/vme_fake.c:749:5: warning: Value stored to 'done' is=
 never read [clang-analyzer-deadcode.DeadStores]
                                   done +=3D 1;
                                   ^       ~
   drivers/vme/bridges/vme_fake.c:749:5: note: Value stored to 'done' is ne=
ver read
                                   done +=3D 1;
                                   ^       ~
   drivers/vme/bridges/vme_fake.c:794:3: warning: Value stored to 'done' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   done +=3D 1;
                   ^       ~
   drivers/vme/bridges/vme_fake.c:794:3: note: Value stored to 'done' is ne=
ver read
                   done +=3D 1;
                   ^       ~
   drivers/vme/bridges/vme_fake.c:1104:2: warning: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcp=
y]
           strcpy(fake_bridge->name, driver_name);
           ^~~~~~
   drivers/vme/bridges/vme_fake.c:1104:2: note: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119
           strcpy(fake_bridge->name, driver_name);
           ^~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/instances +66 drivers/crypto/qat/qat_4xxx/adf_drv.c

0cec19c761e5cc Tomasz Kowalik   2021-12-16   54  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13   55  static int adf_crypto_dev_=
config(struct adf_accel_dev *accel_dev)
8c8268166e8342 Giovanni Cabiddu 2020-11-13   56  {
8c8268166e8342 Giovanni Cabiddu 2020-11-13   57  	char key[ADF_CFG_MAX_KEY_=
LEN_IN_BYTES];
8c8268166e8342 Giovanni Cabiddu 2020-11-13   58  	int banks =3D GET_MAX_BAN=
KS(accel_dev);
8c8268166e8342 Giovanni Cabiddu 2020-11-13   59  	int cpus =3D num_online_c=
pus();
8c8268166e8342 Giovanni Cabiddu 2020-11-13   60  	unsigned long bank, val;
8c8268166e8342 Giovanni Cabiddu 2020-11-13   61  	int instances;
8c8268166e8342 Giovanni Cabiddu 2020-11-13   62  	int ret;
8c8268166e8342 Giovanni Cabiddu 2020-11-13   63  	int i;
8c8268166e8342 Giovanni Cabiddu 2020-11-13   64  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13   65  	if (adf_hw_dev_has_crypto=
(accel_dev))
8c8268166e8342 Giovanni Cabiddu 2020-11-13  @66  		instances =3D min(cpus, =
banks / 2);
8c8268166e8342 Giovanni Cabiddu 2020-11-13   67  	else
8c8268166e8342 Giovanni Cabiddu 2020-11-13   68  		instances =3D 0;
8c8268166e8342 Giovanni Cabiddu 2020-11-13   69  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13   70  	ret =3D adf_cfg_section_a=
dd(accel_dev, ADF_KERNEL_SEC);
8c8268166e8342 Giovanni Cabiddu 2020-11-13   71  	if (ret)
8c8268166e8342 Giovanni Cabiddu 2020-11-13   72  		goto err;
8c8268166e8342 Giovanni Cabiddu 2020-11-13   73  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13   74  	ret =3D adf_cfg_section_a=
dd(accel_dev, "Accelerator0");
8c8268166e8342 Giovanni Cabiddu 2020-11-13   75  	if (ret)
8c8268166e8342 Giovanni Cabiddu 2020-11-13   76  		goto err;
8c8268166e8342 Giovanni Cabiddu 2020-11-13   77  =

8893d27ffcaf6e Giovanni Cabiddu 2022-03-04   78  	/* Temporarily set the nu=
mber of crypto instances to zero to avoid
8893d27ffcaf6e Giovanni Cabiddu 2022-03-04   79  	 * registering the crypto=
 algorithms.
8893d27ffcaf6e Giovanni Cabiddu 2022-03-04   80  	 * This will be removed w=
hen the algorithms will support the
8893d27ffcaf6e Giovanni Cabiddu 2022-03-04   81  	 * CRYPTO_TFM_REQ_MAY_BAC=
KLOG flag
8893d27ffcaf6e Giovanni Cabiddu 2022-03-04   82  	 */
8893d27ffcaf6e Giovanni Cabiddu 2022-03-04   83  	instances =3D 0;
8893d27ffcaf6e Giovanni Cabiddu 2022-03-04   84  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13   85  	for (i =3D 0; i < instanc=
es; i++) {
8c8268166e8342 Giovanni Cabiddu 2020-11-13   86  		val =3D i;
8c8268166e8342 Giovanni Cabiddu 2020-11-13   87  		bank =3D i * 2;
8c8268166e8342 Giovanni Cabiddu 2020-11-13   88  		snprintf(key, sizeof(key=
), ADF_CY "%d" ADF_RING_ASYM_BANK_NUM, i);
8c8268166e8342 Giovanni Cabiddu 2020-11-13   89  		ret =3D adf_cfg_add_key_=
value_param(accel_dev, ADF_KERNEL_SEC,
8c8268166e8342 Giovanni Cabiddu 2020-11-13   90  						  key, &bank, ADF_DE=
C);
8c8268166e8342 Giovanni Cabiddu 2020-11-13   91  		if (ret)
8c8268166e8342 Giovanni Cabiddu 2020-11-13   92  			goto err;
8c8268166e8342 Giovanni Cabiddu 2020-11-13   93  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13   94  		bank +=3D 1;
8c8268166e8342 Giovanni Cabiddu 2020-11-13   95  		snprintf(key, sizeof(key=
), ADF_CY "%d" ADF_RING_SYM_BANK_NUM, i);
8c8268166e8342 Giovanni Cabiddu 2020-11-13   96  		ret =3D adf_cfg_add_key_=
value_param(accel_dev, ADF_KERNEL_SEC,
8c8268166e8342 Giovanni Cabiddu 2020-11-13   97  						  key, &bank, ADF_DE=
C);
8c8268166e8342 Giovanni Cabiddu 2020-11-13   98  		if (ret)
8c8268166e8342 Giovanni Cabiddu 2020-11-13   99  			goto err;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  100  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13  101  		snprintf(key, sizeof(key=
), ADF_CY "%d" ADF_ETRMGR_CORE_AFFINITY,
8c8268166e8342 Giovanni Cabiddu 2020-11-13  102  			 i);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  103  		ret =3D adf_cfg_add_key_=
value_param(accel_dev, ADF_KERNEL_SEC,
8c8268166e8342 Giovanni Cabiddu 2020-11-13  104  						  key, &val, ADF_DEC=
);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  105  		if (ret)
8c8268166e8342 Giovanni Cabiddu 2020-11-13  106  			goto err;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  107  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13  108  		snprintf(key, sizeof(key=
), ADF_CY "%d" ADF_RING_ASYM_SIZE, i);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  109  		val =3D 128;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  110  		ret =3D adf_cfg_add_key_=
value_param(accel_dev, ADF_KERNEL_SEC,
8c8268166e8342 Giovanni Cabiddu 2020-11-13  111  						  key, &val, ADF_DEC=
);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  112  		if (ret)
8c8268166e8342 Giovanni Cabiddu 2020-11-13  113  			goto err;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  114  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13  115  		val =3D 512;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  116  		snprintf(key, sizeof(key=
), ADF_CY "%d" ADF_RING_SYM_SIZE, i);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  117  		ret =3D adf_cfg_add_key_=
value_param(accel_dev, ADF_KERNEL_SEC,
8c8268166e8342 Giovanni Cabiddu 2020-11-13  118  						  key, &val, ADF_DEC=
);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  119  		if (ret)
8c8268166e8342 Giovanni Cabiddu 2020-11-13  120  			goto err;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  121  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13  122  		val =3D 0;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  123  		snprintf(key, sizeof(key=
), ADF_CY "%d" ADF_RING_ASYM_TX, i);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  124  		ret =3D adf_cfg_add_key_=
value_param(accel_dev, ADF_KERNEL_SEC,
8c8268166e8342 Giovanni Cabiddu 2020-11-13  125  						  key, &val, ADF_DEC=
);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  126  		if (ret)
8c8268166e8342 Giovanni Cabiddu 2020-11-13  127  			goto err;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  128  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13  129  		val =3D 0;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  130  		snprintf(key, sizeof(key=
), ADF_CY "%d" ADF_RING_SYM_TX, i);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  131  		ret =3D adf_cfg_add_key_=
value_param(accel_dev, ADF_KERNEL_SEC,
8c8268166e8342 Giovanni Cabiddu 2020-11-13  132  						  key, &val, ADF_DEC=
);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  133  		if (ret)
8c8268166e8342 Giovanni Cabiddu 2020-11-13  134  			goto err;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  135  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13  136  		val =3D 1;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  137  		snprintf(key, sizeof(key=
), ADF_CY "%d" ADF_RING_ASYM_RX, i);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  138  		ret =3D adf_cfg_add_key_=
value_param(accel_dev, ADF_KERNEL_SEC,
8c8268166e8342 Giovanni Cabiddu 2020-11-13  139  						  key, &val, ADF_DEC=
);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  140  		if (ret)
8c8268166e8342 Giovanni Cabiddu 2020-11-13  141  			goto err;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  142  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13  143  		val =3D 1;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  144  		snprintf(key, sizeof(key=
), ADF_CY "%d" ADF_RING_SYM_RX, i);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  145  		ret =3D adf_cfg_add_key_=
value_param(accel_dev, ADF_KERNEL_SEC,
8c8268166e8342 Giovanni Cabiddu 2020-11-13  146  						  key, &val, ADF_DEC=
);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  147  		if (ret)
8c8268166e8342 Giovanni Cabiddu 2020-11-13  148  			goto err;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  149  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13  150  		val =3D ADF_COALESCING_D=
EF_TIME;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  151  		snprintf(key, sizeof(key=
), ADF_ETRMGR_COALESCE_TIMER_FORMAT, i);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  152  		ret =3D adf_cfg_add_key_=
value_param(accel_dev, "Accelerator0",
8c8268166e8342 Giovanni Cabiddu 2020-11-13  153  						  key, &val, ADF_DEC=
);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  154  		if (ret)
8c8268166e8342 Giovanni Cabiddu 2020-11-13  155  			goto err;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  156  	}
8c8268166e8342 Giovanni Cabiddu 2020-11-13  157  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13  158  	val =3D i;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  159  	ret =3D adf_cfg_add_key_v=
alue_param(accel_dev, ADF_KERNEL_SEC, ADF_NUM_CY,
8c8268166e8342 Giovanni Cabiddu 2020-11-13  160  					  &val, ADF_DEC);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  161  	if (ret)
8c8268166e8342 Giovanni Cabiddu 2020-11-13  162  		goto err;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  163  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13  164  	set_bit(ADF_STATUS_CONFIG=
URED, &accel_dev->status);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  165  	return 0;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  166  err:
8c8268166e8342 Giovanni Cabiddu 2020-11-13  167  	dev_err(&GET_DEV(accel_de=
v), "Failed to start QAT accel dev\n");
8c8268166e8342 Giovanni Cabiddu 2020-11-13  168  	return ret;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  169  }
8c8268166e8342 Giovanni Cabiddu 2020-11-13  170  =


:::::: The code at line 66 was first introduced by commit
:::::: 8c8268166e83425243789c5781c92e7fa33b703b crypto: qat - add qat_4xxx =
driver

:::::: TO: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5350352867021557078==--

