Content-Type: multipart/mixed; boundary="===============2634703766315219818=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [luxis1999-iommufd:iommufd-v5.19-rc5 84/104] drivers/iommu/iommufd/device.c:470:11: warning: Access to field 'hwpt' results in a dereference of an undefined pointer value (loaded from variable 'hdev') [clang-analyzer-core.NullDereference]
Date: Tue, 19 Jul 2022 16:05:49 +0800
Message-ID: <202207191507.KQtX8yKC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2634703766315219818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/i=
ommu/iommufd/device.c:470:11: warning: Access to field 'hwpt' results in a =
dereference of an undefined pointer value (loaded from variable 'hdev') [cl=
ang-analyzer-core.NullDereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Liu Yi L <yi.l.liu@intel.com>

tree:   https://github.com/luxis1999/iommufd iommufd-v5.19-rc5
head:   f200d9a1de755f3bb98e21535e22b9adf6ba83f7
commit: 4e9347bc44832ec0e1557796ed0b42674a960a4e [84/104] iommufd: Add driv=
er facing API for PASID support
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: s390-randconfig-c005-20220715 (https://download.01.org/0day-ci/arch=
ive/20220719/202207191507.KQtX8yKC-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 07022e=
6cf9b5b3baa642be53d0b3c3f1c403dbfd)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/luxis1999/iommufd/commit/4e9347bc44832ec0e1557=
796ed0b42674a960a4e
        git remote add luxis1999-iommufd https://github.com/luxis1999/iommu=
fd
        git fetch --no-tags luxis1999-iommufd iommufd-v5.19-rc5
        git checkout 4e9347bc44832ec0e1557796ed0b42674a960a4e
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/d_path.c:412:1: note: Calling '__do_sys_getcwd'
   SYSCALL_DEFINE2(getcwd, char __user *, buf, unsigned long, size)
   ^
   include/linux/syscalls.h:218:36: note: expanded from macro 'SYSCALL_DEFI=
NE2'
   #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:228:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/syscall_wrapper.h:157:14: note: expanded from macr=
o '__SYSCALL_DEFINEx'
                   long ret =3D __do_sys##name(SYSCALL_PT_ARGS(x, regs,    =
                  \
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   note: expanded from here
   fs/d_path.c:418:6: note: Assuming 'page' is non-null
           if (!page)
               ^~~~~
   fs/d_path.c:418:2: note: Taking false branch
           if (!page)
           ^
   fs/d_path.c:422:26: note: Dereference of null pointer
           get_fs_root_and_pwd_rcu(current->fs, &root, &pwd);
                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 43 warnings (42 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   drivers/iommu/iommufd/device.c:245:25: warning: Dereference of null poin=
ter (loaded from variable 'destroy_auto_domain') [clang-analyzer-core.NullD=
ereference]
                           *destroy_auto_domain =3D true;
                                                ^
   drivers/iommu/iommufd/device.c:568:9: note: Calling '__iommufd_device_at=
tach'
           return __iommufd_device_attach(idev, pt_id, &attach);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/device.c:441:2: note: Taking false branch
           if (IS_ERR(pt_obj))
           ^
   drivers/iommu/iommufd/device.c:445:2: note: Control jumps to 'case IOMMU=
FD_OBJ_HW_PAGETABLE:'  at line 446
           switch (pt_obj->type) {
           ^
   drivers/iommu/iommufd/device.c:450:8: note: Calling 'iommufd_device_do_a=
ttach'
                   rc =3D iommufd_device_do_attach(idev, hwpt, attach, &hde=
v);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/device.c:343:7: note: 'hdev' is non-null
           if (!hdev) {
                ^~~~
   drivers/iommu/iommufd/device.c:343:2: note: Taking false branch
           if (!hdev) {
           ^
   drivers/iommu/iommufd/device.c:349:6: note: 'rc' is 0
           if (rc)
               ^~
   drivers/iommu/iommufd/device.c:349:2: note: Taking false branch
           if (rc)
           ^
   drivers/iommu/iommufd/device.c:354:6: note: Assuming 'rc' is not equal t=
o 0
           if (rc)
               ^~
   drivers/iommu/iommufd/device.c:354:2: note: Taking true branch
           if (rc)
           ^
   drivers/iommu/iommufd/device.c:355:3: note: Control jumps to line 368
                   goto out_detach;
                   ^
   drivers/iommu/iommufd/device.c:368:50: note: Passing null pointer value =
via 3rd parameter 'destroy_auto_domain'
           iommufd_device_detach_hwpt(hdev, attach->pasid, NULL);
                                                           ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   drivers/iommu/iommufd/device.c:368:2: note: Calling 'iommufd_device_deta=
ch_hwpt'
           iommufd_device_detach_hwpt(hdev, attach->pasid, NULL);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/device.c:308:6: note: Assuming the condition is fa=
lse
           if (iommufd_hw_pagetable_has_group(hdev->hwpt, idev->group))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/device.c:308:2: note: Taking false branch
           if (iommufd_hw_pagetable_has_group(hdev->hwpt, idev->group))
           ^
   drivers/iommu/iommufd/device.c:311:38: note: Passing null pointer value =
via 3rd parameter 'destroy_auto_domain'
           device_detach_auto_hwpt(idev, hwpt, destroy_auto_domain);
                                               ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/device.c:311:2: note: Calling 'device_detach_auto_=
hwpt'
           device_detach_auto_hwpt(idev, hwpt, destroy_auto_domain);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/device.c:240:2: note: Taking true branch
           if (xa_empty(&hwpt->devices)) {
           ^
   drivers/iommu/iommufd/device.c:243:7: note: Assuming the condition is tr=
ue
                   if (!list_empty(&hwpt->auto_domains_item)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/device.c:243:3: note: Taking true branch
                   if (!list_empty(&hwpt->auto_domains_item)) {
                   ^
   drivers/iommu/iommufd/device.c:245:25: note: Dereference of null pointer=
 (loaded from variable 'destroy_auto_domain')
                           *destroy_auto_domain =3D true;
                            ~~~~~~~~~~~~~~~~~~~ ^
>> drivers/iommu/iommufd/device.c:470:11: warning: Access to field 'hwpt' r=
esults in a dereference of an undefined pointer value (loaded from variable=
 'hdev') [clang-analyzer-core.NullDereference]
           *pt_id =3D hdev->hwpt->obj.id;
                    ^
   drivers/iommu/iommufd/device.c:568:9: note: Calling '__iommufd_device_at=
tach'
           return __iommufd_device_attach(idev, pt_id, &attach);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/device.c:437:2: note: 'hdev' declared without an i=
nitial value
           struct iommufd_hwpt_device *hdev;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/device.c:441:2: note: Taking false branch
           if (IS_ERR(pt_obj))
           ^
   drivers/iommu/iommufd/device.c:445:2: note: Control jumps to 'case IOMMU=
FD_OBJ_IOAS:'  at line 455
           switch (pt_obj->type) {
           ^
   drivers/iommu/iommufd/device.c:459:8: note: Calling 'iommufd_device_auto=
_get_domain'
                   rc =3D iommufd_device_auto_get_domain(idev, ioas, attach=
, &hdev);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/iommu/iommufd/device.c:395:2: note: Loop condition is false. Exe=
cution continues on line 411
           list_for_each_entry (hwpt, &ioas->auto_domains, auto_domains_ite=
m) {
           ^
   include/linux/list.h:674:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/iommu/iommufd/device.c:412:2: note: Taking true branch
           if (IS_ERR(hwpt)) {
           ^
   drivers/iommu/iommufd/device.c:414:3: note: Control jumps to line 429
                   goto out_unlock;
                   ^
   drivers/iommu/iommufd/device.c:430:2: note: Returning without writing to=
 '*out_hdev'
           return rc;
           ^
   drivers/iommu/iommufd/device.c:430:2: note: Returning value (loaded from=
 'rc'), which participates in a condition later
           return rc;
           ^~~~~~~~~
   drivers/iommu/iommufd/device.c:459:8: note: Returning from 'iommufd_devi=
ce_auto_get_domain'
                   rc =3D iommufd_device_auto_get_domain(idev, ioas, attach=
, &hdev);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/iommu/iommufd/device.c:460:7: note: Assuming 'rc' is 0
                   if (rc)
                       ^~
   drivers/iommu/iommufd/device.c:460:3: note: Taking false branch
                   if (rc)
                   ^
   drivers/iommu/iommufd/device.c:462:3: note:  Execution continues on line=
 469
                   break;
                   ^
   drivers/iommu/iommufd/device.c:470:11: note: Access to field 'hwpt' resu=
lts in a dereference of an undefined pointer value (loaded from variable 'h=
dev')
           *pt_id =3D hdev->hwpt->obj.id;
                    ^~~~
   Suppressed 59 warnings (46 in non-user code, 13 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   96 warnings generated.
   fs/jffs2/readinode.c:69:3: warning: Dereference of null pointer [clang-a=
nalyzer-core.NullDereference]
                   JFFS2_WARNING("MTD point returned len too short: %zu ins=
tead of %u.\n", retlen, tn->csize);
                   ^
   fs/jffs2/debug.h:85:15: note: expanded from macro 'JFFS2_WARNING'
                   task_pid_nr(current), __func__, ##__VA_ARGS__)
                               ^~~~~~~
   include/linux/printk.h:517:37: note: expanded from macro 'pr_warn'
           printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                              ^~~~~~~~~~~
   include/linux/printk.h:464:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:436:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/jffs2/readinode.c:40:9: note: Assuming field 'csize' is not equal to 0
           BUG_ON(tn->csize =3D=3D 0);
                  ^
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   fs/jffs2/readinode.c:40:13: note: Field 'csize' is not equal to 0
           BUG_ON(tn->csize =3D=3D 0);
                      ^
   fs/jffs2/readinode.c:40:2: note: Taking false branch
           BUG_ON(tn->csize =3D=3D 0);
           ^
   include/asm-generic/bug.h:71:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/jffs2/readinode.c:40:2: note: Loop condition is false.  Exiting loop
           BUG_ON(tn->csize =3D=3D 0);
           ^
   include/asm-generic/bug.h:71:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)

vim +470 drivers/iommu/iommufd/device.c

6f915f4df4ae49 Jason Gunthorpe 2021-11-11  432  =

4e9347bc44832e Yi Liu          2022-06-22  433  static int __iommufd_device=
_attach(struct iommufd_device *idev, u32 *pt_id,
4e9347bc44832e Yi Liu          2022-06-22  434  				   struct iommufd_devic=
e_attach_data *attach)
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  435  {
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  436  	struct iommufd_object *pt_=
obj;
4e9347bc44832e Yi Liu          2022-06-22  437  	struct iommufd_hwpt_device=
 *hdev;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  438  	int rc;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  439  =

6f915f4df4ae49 Jason Gunthorpe 2021-11-11  440  	pt_obj =3D iommufd_get_obj=
ect(idev->ictx, *pt_id, IOMMUFD_OBJ_ANY);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  441  	if (IS_ERR(pt_obj))
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  442  		return PTR_ERR(pt_obj);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  443  =

4e9347bc44832e Yi Liu          2022-06-22  444  	mutex_lock(&idev->pasid_lo=
ck);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  445  	switch (pt_obj->type) {
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  446  	case IOMMUFD_OBJ_HW_PAGETA=
BLE: {
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  447  		struct iommufd_hw_pagetab=
le *hwpt =3D
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  448  			container_of(pt_obj, str=
uct iommufd_hw_pagetable, obj);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  449  =

4e9347bc44832e Yi Liu          2022-06-22  450  		rc =3D iommufd_device_do_=
attach(idev, hwpt, attach, &hdev);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  451  		if (rc)
4e9347bc44832e Yi Liu          2022-06-22  452  			goto out_unlock;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  453  		break;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  454  	}
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  455  	case IOMMUFD_OBJ_IOAS: {
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  456  		struct iommufd_ioas *ioas=
 =3D
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  457  			container_of(pt_obj, str=
uct iommufd_ioas, obj);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  458  =

4e9347bc44832e Yi Liu          2022-06-22  459  		rc =3D iommufd_device_aut=
o_get_domain(idev, ioas, attach, &hdev);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  460  		if (rc)
4e9347bc44832e Yi Liu          2022-06-22  461  			goto out_unlock;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  462  		break;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  463  	}
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  464  	default:
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  465  		rc =3D -EINVAL;
4e9347bc44832e Yi Liu          2022-06-22  466  		goto out_unlock;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  467  	}
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  468  =

6f915f4df4ae49 Jason Gunthorpe 2021-11-11  469  	refcount_inc(&idev->obj.us=
ers);
4e9347bc44832e Yi Liu          2022-06-22 @470  	*pt_id =3D hdev->hwpt->obj=
.id;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  471  	rc =3D 0;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  472  =

4e9347bc44832e Yi Liu          2022-06-22  473  out_unlock:
4e9347bc44832e Yi Liu          2022-06-22  474  	mutex_unlock(&idev->pasid_=
lock);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  475  	iommufd_put_object(pt_obj);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  476  	return rc;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  477  }
4e9347bc44832e Yi Liu          2022-06-22  478  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2634703766315219818==--

