Content-Type: multipart/mixed; boundary="===============0874804491543042268=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 1/1] usb: gadget: f_fs: Support zerocopy transfers via mmap.
Date: Sun, 13 Feb 2022 02:17:19 +0800
Message-ID: <202202122302.z3tLgceb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0874804491543042268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220202172056.44722-2-ingo.rohloff@lauterbach.com>
References: <20220202172056.44722-2-ingo.rohloff@lauterbach.com>
TO: Ingo Rohloff <ingo.rohloff@lauterbach.com>
TO: gregkh(a)linuxfoundation.org
TO: balbi(a)kernel.org
CC: linux-usb(a)vger.kernel.org
CC: Ingo Rohloff <ingo.rohloff@lauterbach.com>

Hi Ingo,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on v5.17-rc3 next-20220211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Ingo-Rohloff/Zerocopy-for-=
USB-Gadget-FunctionFS/20220203-012919
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-=
testing
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: riscv-randconfig-c006-20220205 (https://download.01.org/0day-ci/arc=
hive/20220212/202202122302.z3tLgceb-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project dee058=
c670593b999fec19c458dbbd882ad9de56)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/dee77498ca5c303beb5ef64b9=
5072fea55d6267f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Ingo-Rohloff/Zerocopy-for-USB-Gadg=
et-FunctionFS/20220203-012919
        git checkout dee77498ca5c303beb5ef64b95072fea55d6267f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/w1/w1.c:997:2: warning: Value stored to 'search_bit' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           search_bit =3D 0;
           ^            ~
   drivers/w1/w1.c:997:2: note: Value stored to 'search_bit' is never read
           search_bit =3D 0;
           ^            ~
   drivers/w1/w1.c:999:2: warning: Value stored to 'last_rn' is never read =
[clang-analyzer-deadcode.DeadStores]
           last_rn =3D 0;
           ^         ~
   drivers/w1/w1.c:999:2: note: Value stored to 'last_rn' is never read
           last_rn =3D 0;
           ^         ~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/w1/slaves/w1_therm.c:159:8: warning: Excessive padding in 'struc=
t w1_therm_family_converter' (12 padding bytes, where 4 is optimal). =

   Optimal fields order: =

   f, =

   convert, =

   get_conversion_time, =

   set_resolution, =

   get_resolution, =

   write_data, =

   reserved, =

   broken, =

   bulk_read, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct w1_therm_family_converter {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:159:8: note: Excessive padding in 'struct w=
1_therm_family_converter' (12 padding bytes, where 4 is optimal). Optimal f=
ields order: f, convert, get_conversion_time, set_resolution, get_resolutio=
n, write_data, reserved, broken, bulk_read, consider reordering the fields =
or adding explicit padding members
   struct w1_therm_family_converter {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:1252:5: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                                   ret =3D -EIO;
                                   ^     ~~~~
   drivers/w1/slaves/w1_therm.c:1252:5: note: Value stored to 'ret' is neve=
r read
                                   ret =3D -EIO;
                                   ^     ~~~~
   drivers/w1/slaves/w1_therm.c:1799:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(p_args, buf);
           ^~~~~~
   drivers/w1/slaves/w1_therm.c:1799:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(p_args, buf);
           ^~~~~~
   drivers/w1/slaves/w1_therm.c:2089:22: warning: The right operand of '=3D=
=3D' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (sl->reg_num.id =3D=3D reg_num->id)
                                      ^  ~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:2066:6: note: Assuming the condition is fal=
se
           if (w1_reset_bus(sl->master))
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:2066:2: note: Taking false branch
           if (w1_reset_bus(sl->master))
           ^
   drivers/w1/slaves/w1_therm.c:2076:6: note: Assuming 'ack' is equal to W1=
_42_SUCCESS_CONFIRM_BYTE
           if (ack !=3D W1_42_SUCCESS_CONFIRM_BYTE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:2076:2: note: Taking false branch
           if (ack !=3D W1_42_SUCCESS_CONFIRM_BYTE)
           ^
   drivers/w1/slaves/w1_therm.c:2080:2: note: Loop condition is true.  Ente=
ring loop body
           for (i =3D 0; i <=3D 64; i++) {
           ^
   drivers/w1/slaves/w1_therm.c:2081:7: note: Assuming the condition is fal=
se
                   if (w1_reset_bus(sl->master))
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:2081:3: note: Taking false branch
                   if (w1_reset_bus(sl->master))
                   ^
   drivers/w1/slaves/w1_therm.c:2087:7: note: Assuming field 'family' is no=
t equal to W1_42_FINISHED_BYTE
                   if (reg_num->family =3D=3D W1_42_FINISHED_BYTE)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:2087:3: note: Taking false branch
                   if (reg_num->family =3D=3D W1_42_FINISHED_BYTE)
                   ^
   drivers/w1/slaves/w1_therm.c:2089:22: note: The right operand of '=3D=3D=
' is a garbage value
                   if (sl->reg_num.id =3D=3D reg_num->id)
                                      ^  ~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/usb/gadget/function/f_fs.c:866:2: warning: Value stored to 'ret'=
 is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   drivers/usb/gadget/function/f_fs.c:866:2: note: Value stored to 'ret' is=
 never read
           ret =3D 0;
           ^     ~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/usb/gadget/function/uvc_configfs.c:2037:30: warning: Value store=
d to 'u' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
                           struct uvcg_uncompressed *u =3D
                                                     ^
   drivers/usb/gadget/function/uvc_configfs.c:2037:30: note: Value stored t=
o 'u' during its initialization is never read
                           struct uvcg_uncompressed *u =3D
                                                     ^
   drivers/usb/gadget/function/uvc_configfs.c:2043:23: warning: Value store=
d to 'm' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
                           struct uvcg_mjpeg *m =3D
                                              ^
   drivers/usb/gadget/function/uvc_configfs.c:2043:23: note: Value stored t=
o 'm' during its initialization is never read
                           struct uvcg_mjpeg *m =3D
                                              ^
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/usb/gadget/legacy/ether.c:373:20: warning: Access to field 'boun=
d' results in a dereference of a null pointer (loaded from variable 'eem_op=
ts') [clang-analyzer-core.NullDereference]
                           eem_opts->bound =3D true;
                           ~~~~~~~~        ^
   drivers/usb/gadget/legacy/ether.c:307:2: note: 'eem_opts' initialized to=
 a null pointer value
           struct f_eem_opts       *eem_opts =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/ether.c:314:6: note: Assuming 'use_eem' is fal=
se
           if (use_eem) {
               ^~~~~~~
   drivers/usb/gadget/legacy/ether.c:314:2: note: Taking false branch
           if (use_eem) {
           ^
   drivers/usb/gadget/legacy/ether.c:327:13: note: Calling 'can_support_ecm'
           } else if (can_support_ecm(gadget)) {
                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/u_ether.h:268:7: note: Calling 'gadget_is_al=
tset_supported'
           if (!gadget_is_altset_supported(gadget))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/usb/gadget.h:523:9: note: Assuming field 'quirk_altset_not=
_supp' is 0, which participates in a condition later
           return !g->quirk_altset_not_supp;
                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/usb/gadget.h:523:2: note: Returning without writing to 'g-=
>quirk_altset_not_supp', which participates in a condition later
           return !g->quirk_altset_not_supp;
           ^
   include/linux/usb/gadget.h:523:2: note: Returning the value 1, which par=
ticipates in a condition later
           return !g->quirk_altset_not_supp;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/u_ether.h:268:7: note: Returning from 'gadge=
t_is_altset_supported'
           if (!gadget_is_altset_supported(gadget))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/u_ether.h:268:2: note: Taking false branch
           if (!gadget_is_altset_supported(gadget))
           ^
   drivers/usb/gadget/function/u_ether.h:275:2: note: Returning the value 1=
, which participates in a condition later
           return true;
           ^~~~~~~~~~~
   drivers/usb/gadget/legacy/ether.c:327:13: note: Returning from 'can_supp=
ort_ecm'
           } else if (can_support_ecm(gadget)) {
                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/legacy/ether.c:327:9: note: Taking true branch
           } else if (can_support_ecm(gadget)) {
                  ^
   drivers/usb/gadget/legacy/ether.c:331:7: note: Calling 'IS_ERR'
                   if (IS_ERR(fi_ecm))
                       ^~~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \

vim +/ret +866 drivers/usb/gadget/function/f_fs.c

dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  847  =

dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  848  static int ffs_epfile_mmap(struct file *file, struct vm_area_stru=
ct *vma)
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  849  {
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  850  	struct ffs_ep_listener *listener =3D file->private_data;
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  851  	struct ffs_memory *ffsm =3D NULL;
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  852  	size_t size =3D vma->vm_end - vma->vm_start;
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  853  	char *kmem;
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  854  	int rc, ret;
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  855  =

dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  856  	if (!IS_ALIGNED(size, PAGE_SIZE))
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  857  		return -EFAULT;
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  858  =

dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  859  	rc =3D ffsm_increase_mmap_mem_usage(
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  860  		listener->epfile->ffs,
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  861  		size + sizeof(struct ffs_memory)
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  862  	);
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  863  	if (rc)
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  864  		return -ENOMEM;
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  865  =

dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02 @866  	ret =3D 0;
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  867  	ffsm =3D kzalloc(sizeof(struct ffs_memory), GFP_KERNEL);
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  868  	if (!ffsm) {
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  869  		ret =3D -ENOMEM;
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  870  		goto error_decrease_mem;
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  871  	}
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  872  =

dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  873  	kmem =3D kzalloc(size, GFP_USER | __GFP_NOWARN);
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  874  	if (!kmem) {
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  875  		kfree(ffsm);
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  876  		ret =3D -ENOMEM;
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  877  		goto error_decrease_mem;
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  878  	}
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  879  =

dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  880  	rc =3D remap_pfn_range(
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  881  		vma,
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  882  		vma->vm_start,
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  883  		PHYS_PFN(virt_to_phys(kmem)),
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  884  		size,
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  885  		vma->vm_page_prot
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  886  	);
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  887  	if (rc < 0) {
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  888  		kfree(kmem);
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  889  		kfree(ffsm);
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  890  		ret =3D -EAGAIN;
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  891  		goto error_decrease_mem;
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  892  	}
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  893  =

dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  894  =

dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  895  	INIT_LIST_HEAD(&ffsm->memlist);
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  896  	ffsm->listener =3D listener;
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  897  	ffsm->kmem =3D kmem;
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  898  	ffsm->vm_start =3D vma->vm_start;
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  899  	ffsm->size =3D size;
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  900  	ffsm->vma_use_count =3D 1;
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  901  =

dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  902  	vma->vm_ops =3D &ffsm_vm_ops;
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  903  	vma->vm_private_data =3D ffsm;
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  904  =

dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  905  	spin_lock_irq(&listener->ffsm_lock);
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  906  	list_add_tail(&ffsm->memlist, &listener->ffsm_list);
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  907  	spin_unlock_irq(&listener->ffsm_lock);
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  908  	return 0;
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  909  =

dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  910  error_decrease_mem:
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  911  	ffsm_decrease_mmap_mem_usage(
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  912  		listener->epfile->ffs,
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  913  		size + sizeof(struct ffs_memory)
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  914  	);
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  915  	return ret;
dee77498ca5c30 drivers/usb/gadget/function/f_fs.c Ingo Rohloff      2022-02=
-02  916  }
ddf8abd2599491 drivers/usb/gadget/f_fs.c          Michal Nazarewicz 2010-05=
-05  917  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0874804491543042268==--

