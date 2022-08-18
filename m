Content-Type: multipart/mixed; boundary="===============5339345588411473483=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] vDPA: conditionally read fields in virtio-net dev
Date: Fri, 19 Aug 2022 04:42:03 +0800
Message-ID: <202208190409.A0Phl6Gz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5339345588411473483==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/v=
dpa/vdpa.c:854:2: warning: Value stored to 'val_u16' is never read [clang-a=
nalyzer-deadcode.DeadStores]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220815092638.504528-3-lingshan.zhu@intel.com>
References: <20220815092638.504528-3-lingshan.zhu@intel.com>
TO: Zhu Lingshan <lingshan.zhu@intel.com>
TO: jasowang(a)redhat.com
TO: mst(a)redhat.com
CC: virtualization(a)lists.linux-foundation.org
CC: netdev(a)vger.kernel.org
CC: kvm(a)vger.kernel.org
CC: parav(a)nvidia.com
CC: xieyongji(a)bytedance.com
CC: gautam.dawar(a)amd.com
CC: Zhu Lingshan <lingshan.zhu@intel.com>

Hi Zhu,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.0-rc1 next-20220818]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhu-Lingshan/allow-u=
serspace-to-query-device-features/20220815-173651
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
568035b01cfb107af8d2e4bd2fb9aea22cf5b868
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-c006-20220815 (https://download.01.org/0day-ci/arc=
hive/20220819/202208190409.A0Phl6Gz-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project aed5e3=
bea138ce581d682158eb61c27b3cfdd6ec)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/8b7e1bc13903c122a38=
69747ff3e01cef0f3964e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zhu-Lingshan/allow-userspace-to-qu=
ery-device-features/20220815-173651
        git checkout 8b7e1bc13903c122a3869747ff3e01cef0f3964e
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   drivers/dma/img-mdc-dma.c:437:18: warning: Access to field 'node_addr' r=
esults in a dereference of a null pointer (loaded from variable 'prev') [cl=
ang-analyzer-core.NullDereference]
           prev->node_addr =3D mdesc->list_phys;
           ~~~~            ^
   drivers/dma/img-mdc-dma.c:374:34: note: 'prev' initialized to a null poi=
nter value
           struct mdc_hw_list_desc *curr, *prev =3D NULL;
                                           ^~~~
   drivers/dma/img-mdc-dma.c:377:6: note: Assuming 'buf_len' is 0
           if (!buf_len && !period_len)
               ^~~~~~~~
   drivers/dma/img-mdc-dma.c:377:6: note: Left side of '&&' is true
   drivers/dma/img-mdc-dma.c:377:18: note: Assuming 'period_len' is not equ=
al to 0
           if (!buf_len && !period_len)
                           ^~~~~~~~~~~
   drivers/dma/img-mdc-dma.c:377:2: note: Taking false branch
           if (!buf_len && !period_len)
           ^
   drivers/dma/img-mdc-dma.c:380:2: note: Taking false branch
           if (!is_slave_direction(dir))
           ^
   drivers/dma/img-mdc-dma.c:383:2: note: Taking false branch
           if (mdc_check_slave_width(mchan, dir) < 0)
           ^
   drivers/dma/img-mdc-dma.c:386:10: note: Calling 'kzalloc'
           mdesc =3D kzalloc(sizeof(*mdesc), GFP_NOWAIT);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:733:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:588:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:605:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:733:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:733:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/img-mdc-dma.c:386:10: note: Returning from 'kzalloc'
           mdesc =3D kzalloc(sizeof(*mdesc), GFP_NOWAIT);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/img-mdc-dma.c:387:6: note: Assuming 'mdesc' is non-null
           if (!mdesc)
               ^~~~~~
   drivers/dma/img-mdc-dma.c:387:2: note: Taking false branch
           if (!mdesc)
           ^
   drivers/dma/img-mdc-dma.c:395:2: note: Loop condition is false. Executio=
n continues on line 437
           while (buf_len > 0) {
           ^
   drivers/dma/img-mdc-dma.c:437:18: note: Access to field 'node_addr' resu=
lts in a dereference of a null pointer (loaded from variable 'prev')
           prev->node_addr =3D mdesc->list_phys;
           ~~~~            ^
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   74 warnings generated.
   Suppressed 74 warnings (74 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   77 warnings generated.
   drivers/vdpa/vdpa.c:96:8: warning: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D snprintf(buf, PAGE_SIZE, "%s\n", vdev->driver_override);
                 ^~~~~~~~
   drivers/vdpa/vdpa.c:96:8: note: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11
           len =3D snprintf(buf, PAGE_SIZE, "%s\n", vdev->driver_override);
                 ^~~~~~~~
   drivers/vdpa/vdpa.c:587:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(config.net.mac, macaddr, sizeof(config.net.mac));
                   ^~~~~~
   drivers/vdpa/vdpa.c:587:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(config.net.mac, macaddr, sizeof(config.net.mac));
                   ^~~~~~
>> drivers/vdpa/vdpa.c:854:2: warning: Value stored to 'val_u16' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           val_u16 =3D __virtio16_to_cpu(true, config.status);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vdpa/vdpa.c:854:2: note: Value stored to 'val_u16' is never read
           val_u16 =3D __virtio16_to_cpu(true, config.status);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 74 warnings (74 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   fs/binfmt_elf.c:293:2: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memset(elf_info, 0, (char *)mm->saved_auxv +
           ^~~~~~
   fs/binfmt_elf.c:293:2: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
           memset(elf_info, 0, (char *)mm->saved_auxv +
           ^~~~~~
   fs/binfmt_elf.c:1328:3: warning: Value stored to 'error' is never read [=
clang-analyzer-deadcode.DeadStores]
                   error =3D vm_mmap(NULL, 0, PAGE_SIZE, PROT_READ | PROT_E=
XEC,
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/binfmt_elf.c:1328:3: note: Value stored to 'error' is never read
                   error =3D vm_mmap(NULL, 0, PAGE_SIZE, PROT_READ | PROT_E=
XEC,
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/binfmt_elf.c:1481:23: warning: Access to field 'name' results in a de=
reference of a null pointer (loaded from variable 'men') [clang-analyzer-co=
re.NullDereference]
           en.n_namesz =3D strlen(men->name) + 1;
                                ^
   fs/binfmt_elf.c:2219:12: note: Assuming 'segs' is <=3D PN_XNUM
           e_phnum =3D segs > PN_XNUM ? PN_XNUM : segs;
                     ^~~~~~~~~~~~~~
   fs/binfmt_elf.c:2219:12: note: '?' condition is false
   fs/binfmt_elf.c:2225:7: note: Calling 'fill_note_info'
           if (!fill_note_info(&elf, e_phnum, &info, cprm))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/binfmt_elf.c:1839:2: note: Null pointer value stored to 'info.thread'
           info->thread =3D NULL;
           ^~~~~~~~~~~~~~~~~~~
   fs/binfmt_elf.c:1842:6: note: Assuming 'psinfo' is not equal to NULL
           if (psinfo =3D=3D NULL) {
               ^~~~~~~~~~~~~~
   fs/binfmt_elf.c:1842:2: note: Taking false branch
           if (psinfo =3D=3D NULL) {
           ^
   fs/binfmt_elf.c:1853:14: note: Assuming 'i' is < field 'n'
           for (i =3D 0; i < view->n; ++i)
                       ^~~~~~~~~~~
   fs/binfmt_elf.c:1853:2: note: Loop condition is true.  Entering loop body
           for (i =3D 0; i < view->n; ++i)
           ^
   fs/binfmt_elf.c:1854:7: note: Assuming field 'core_note_type' is not equ=
al to 0
                   if (view->regsets[i].core_note_type !=3D 0)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/binfmt_elf.c:1854:3: note: Taking true branch
                   if (view->regsets[i].core_note_type !=3D 0)
                   ^
   fs/binfmt_elf.c:1853:14: note: Assuming 'i' is >=3D field 'n'
           for (i =3D 0; i < view->n; ++i)
                       ^~~~~~~~~~~
   fs/binfmt_elf.c:1853:2: note: Loop condition is false. Execution continu=
es on line 1861
           for (i =3D 0; i < view->n; ++i)
           ^
   fs/binfmt_elf.c:1861:6: note: Left side of '||' is false
           if (unlikely(info->thread_notes =3D=3D 0) ||
               ^
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^
   fs/binfmt_elf.c:1862:15: note: Assuming field 'core_note_type' is equal =
to 1
               unlikely(view->regsets[0].core_note_type !=3D NT_PRSTATUS)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/binfmt_elf.c:1861:2: note: Taking false branch
           if (unlikely(info->thread_notes =3D=3D 0) ||
           ^
   fs/binfmt_elf.c:1876:2: note: Loop condition is false. Execution continu=
es on line 1900
           for (ct =3D &dump_task->signal->core_state->dumper; ct; ct =3D c=
t->next) {
           ^
   fs/binfmt_elf.c:1900:2: note: Loop condition is false. Execution continu=
es on line 1907
           for (t =3D info->thread; t !=3D NULL; t =3D t->next)
           ^
   fs/binfmt_elf.c:1916:2: note: Taking false branch
           if (fill_files_note(&info->files, cprm) =3D=3D 0)
           ^
   fs/binfmt_elf.c:2225:7: note: Returning from 'fill_note_info'
           if (!fill_note_info(&elf, e_phnum, &info, cprm))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/binfmt_elf.c:2225:2: note: Taking false branch
           if (!fill_note_info(&elf, e_phnum, &info, cprm))
           ^
   fs/binfmt_elf.c:2235:15: note: Calling 'get_note_info_size'
                   size_t sz =3D get_note_info_size(&info);
                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/binfmt_elf.c:1924:2: note: Returning without writing to 'info->thread'
           return info->size;
           ^
   fs/binfmt_elf.c:2235:15: note: Returning from 'get_note_info_size'
                   size_t sz =3D get_note_info_size(&info);
                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/binfmt_elf.c:2241:7: note: Assuming 'phdr4note' is non-null

vim +/val_u16 +854 drivers/vdpa/vdpa.c

8b7e1bc13903c1 Zhu Lingshan 2022-08-15  840  =

8b7e1bc13903c1 Zhu Lingshan 2022-08-15  841  =

ad69dd0bf26b88 Parav Pandit 2021-10-26  842  static int vdpa_dev_net_config=
_fill(struct vdpa_device *vdev, struct sk_buff *msg)
ad69dd0bf26b88 Parav Pandit 2021-10-26  843  {
ad69dd0bf26b88 Parav Pandit 2021-10-26  844  	struct virtio_net_config conf=
ig =3D {};
5a68d6a1cf2a73 Zhu Lingshan 2022-08-15  845  	u64 features_device, features=
_driver;
ad69dd0bf26b88 Parav Pandit 2021-10-26  846  	u16 val_u16;
ad69dd0bf26b88 Parav Pandit 2021-10-26  847  =

30ef7a8ac8a070 Eli Cohen    2022-01-05  848  	vdpa_get_config_unlocked(vdev=
, 0, &config, sizeof(config));
ad69dd0bf26b88 Parav Pandit 2021-10-26  849  =

8b7e1bc13903c1 Zhu Lingshan 2022-08-15  850  	/*
8b7e1bc13903c1 Zhu Lingshan 2022-08-15  851  	 * Assume little endian for n=
ow, userspace can tweak this for
8b7e1bc13903c1 Zhu Lingshan 2022-08-15  852  	 * legacy guest support.
8b7e1bc13903c1 Zhu Lingshan 2022-08-15  853  	 */
8b7e1bc13903c1 Zhu Lingshan 2022-08-15 @854  	val_u16 =3D __virtio16_to_cpu=
(true, config.status);
ad69dd0bf26b88 Parav Pandit 2021-10-26  855  =

79e0034cb3485e Zhu Lingshan 2022-07-22  856  	val_u16 =3D __virtio16_to_cpu=
(true, config.status);
ad69dd0bf26b88 Parav Pandit 2021-10-26  857  	if (nla_put_u16(msg, VDPA_ATT=
R_DEV_NET_STATUS, val_u16))
ad69dd0bf26b88 Parav Pandit 2021-10-26  858  		return -EMSGSIZE;
ad69dd0bf26b88 Parav Pandit 2021-10-26  859  =

5a68d6a1cf2a73 Zhu Lingshan 2022-08-15  860  	features_driver =3D vdev->con=
fig->get_driver_features(vdev);
5a68d6a1cf2a73 Zhu Lingshan 2022-08-15  861  	if (nla_put_u64_64bit(msg, VD=
PA_ATTR_DEV_NEGOTIATED_FEATURES, features_driver,
5a68d6a1cf2a73 Zhu Lingshan 2022-08-15  862  			      VDPA_ATTR_PAD))
5a68d6a1cf2a73 Zhu Lingshan 2022-08-15  863  		return -EMSGSIZE;
5a68d6a1cf2a73 Zhu Lingshan 2022-08-15  864  =

5a68d6a1cf2a73 Zhu Lingshan 2022-08-15  865  	features_device =3D vdev->con=
fig->get_device_features(vdev);
5a68d6a1cf2a73 Zhu Lingshan 2022-08-15  866  =

5a68d6a1cf2a73 Zhu Lingshan 2022-08-15  867  	/* report features of a vDPA =
device through VDPA_ATTR_VDPA_DEV_SUPPORTED_FEATURES */
5a68d6a1cf2a73 Zhu Lingshan 2022-08-15  868  	if (nla_put_u64_64bit(msg, VD=
PA_ATTR_VDPA_DEV_SUPPORTED_FEATURES, features_device,
612f330ec56f12 Eli Cohen    2022-01-05  869  			      VDPA_ATTR_PAD))
612f330ec56f12 Eli Cohen    2022-01-05  870  		return -EMSGSIZE;
ad69dd0bf26b88 Parav Pandit 2021-10-26  871  =

8b7e1bc13903c1 Zhu Lingshan 2022-08-15  872  	if (vdpa_dev_net_mac_config_f=
ill(msg, features_device, &config))
8b7e1bc13903c1 Zhu Lingshan 2022-08-15  873  		return -EMSGSIZE;
8b7e1bc13903c1 Zhu Lingshan 2022-08-15  874  =

8b7e1bc13903c1 Zhu Lingshan 2022-08-15  875  	if (vdpa_dev_net_mtu_config_f=
ill(msg, features_device, &config))
8b7e1bc13903c1 Zhu Lingshan 2022-08-15  876  		return -EMSGSIZE;
8b7e1bc13903c1 Zhu Lingshan 2022-08-15  877  =

8b7e1bc13903c1 Zhu Lingshan 2022-08-15  878  	return vdpa_dev_net_mq_config=
_fill(msg, features_device, &config);
ad69dd0bf26b88 Parav Pandit 2021-10-26  879  }
ad69dd0bf26b88 Parav Pandit 2021-10-26  880  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5339345588411473483==--

