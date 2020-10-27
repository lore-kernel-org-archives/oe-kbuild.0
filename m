Content-Type: multipart/mixed; boundary="===============2822368421911771966=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdkfd/kfd_topology.c:237:3: warning: %llu in format string (no. 2) requires 'unsigned long long' but the argument type is 'unsigned long'.
Date: Tue, 27 Oct 2020 16:39:54 +0800
Message-ID: <202010271641.oc9TxFiX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2822368421911771966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Yong Zhao <Yong.Zhao@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4525c8781ec0701ce824e8bd379ae1b129e26568
commit: 3a2f0c813b42996a8fdb14da2cd828156a6fdd12 drm/amdkfd: Support Sienna=
_Cichlid KFD v4
date:   4 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 4 months ago
compiler: powerpc64le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.=
c:
>> drivers/gpu/drm/amd/amdkfd/kfd_topology.c:237:3: warning: %llu in format=
 string (no. 2) requires 'unsigned long long' but the argument type is 'uns=
igned long'. [invalidPrintfArgType_uint]
     sysfs_show_64bit_prop(buffer, offs, "platform_oem",
     ^
   drivers/gpu/drm/amd/amdkfd/kfd_topology.c:239:3: warning: %llu in format=
 string (no. 2) requires 'unsigned long long' but the argument type is 'uns=
igned long'. [invalidPrintfArgType_uint]
     sysfs_show_64bit_prop(buffer, offs, "platform_id",
     ^
   drivers/gpu/drm/amd/amdkfd/kfd_topology.c:241:3: warning: %llu in format=
 string (no. 2) requires 'unsigned long long' but the argument type is 'uns=
igned long'. [invalidPrintfArgType_uint]
     sysfs_show_64bit_prop(buffer, offs, "platform_rev",
     ^
   drivers/gpu/drm/amd/amdkfd/kfd_topology.c:317:2: warning: %llu in format=
 string (no. 2) requires 'unsigned long long' but the argument type is 'uns=
igned long'. [invalidPrintfArgType_uint]
    sysfs_show_64bit_prop(buffer, offs, "size_in_bytes",
    ^
>> drivers/gpu/drm/amd/amdkfd/kfd_topology.c:488:2: warning: %u in format s=
tring (no. 2) requires 'unsigned int' but the argument type is 'signed int'=
. [invalidPrintfArgType_uint]
    sysfs_show_32bit_prop(buffer, offs, "drm_render_minor",
    ^
   drivers/gpu/drm/amd/amdkfd/kfd_topology.c:490:2: warning: %llu in format=
 string (no. 2) requires 'unsigned long long' but the argument type is 'uns=
igned long'. [invalidPrintfArgType_uint]
    sysfs_show_64bit_prop(buffer, offs, "hive_id",
    ^
   drivers/gpu/drm/amd/amdkfd/kfd_topology.c:500:2: warning: %llu in format=
 string (no. 2) requires 'unsigned long long' but the argument type is 'uns=
igned long'. [invalidPrintfArgType_uint]
    sysfs_show_64bit_prop(buffer, offs, "unique_id",
    ^
>> drivers/gpu/drm/amd/amdkfd/kfd_crat.c:405:32: warning: Shifting signed 3=
2-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    if (props && (iolink->flags & CRAT_IOLINK_FLAGS_BI_DIRECTIONAL)) {
                                  ^
   drivers/gpu/drm/amd/amdkfd/kfd_crat.c:1095:26: warning: Shifting signed =
32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     sub_type_hdr->flags |=3D CRAT_IOLINK_FLAGS_BI_DIRECTIONAL;
                            ^
   drivers/gpu/drm/amd/amdkfd/kfd_crat.c:1129:11: warning: Shifting signed =
32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
             CRAT_IOLINK_FLAGS_BI_DIRECTIONAL;
             ^
>> drivers/gpu/drm/amd/amdkfd/kfd_crat.c:924:3: warning: Assignment of func=
tion parameter has no effect outside the function. Did you forget dereferen=
cing it? [uselessAssignmentPtrArg]
     sub_type_hdr++;
     ^
--
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c:826:0: warning: Syn=
tax error in #if [preprocessorErrorDirective]
   #if 0
   ^

vim +237 drivers/gpu/drm/amd/amdkfd/kfd_topology.c

5b5c4e40a37e858 Evgeny Pinchuk 2014-07-16  211  =

5b5c4e40a37e858 Evgeny Pinchuk 2014-07-16  212  =

83a13ef5902aeed Felix Kuehling 2020-05-22  213  #define sysfs_show_gen_prop=
(buffer, offs, fmt, ...)		\
83a13ef5902aeed Felix Kuehling 2020-05-22  214  		(offs +=3D snprintf(buffe=
r+offs, PAGE_SIZE-offs,	\
83a13ef5902aeed Felix Kuehling 2020-05-22  215  				  fmt, __VA_ARGS__))
83a13ef5902aeed Felix Kuehling 2020-05-22  216  #define sysfs_show_32bit_pr=
op(buffer, offs, name, value) \
83a13ef5902aeed Felix Kuehling 2020-05-22  217  		sysfs_show_gen_prop(buffe=
r, offs, "%s %u\n", name, value)
83a13ef5902aeed Felix Kuehling 2020-05-22  218  #define sysfs_show_64bit_pr=
op(buffer, offs, name, value) \
83a13ef5902aeed Felix Kuehling 2020-05-22  219  		sysfs_show_gen_prop(buffe=
r, offs, "%s %llu\n", name, value)
83a13ef5902aeed Felix Kuehling 2020-05-22  220  #define sysfs_show_32bit_va=
l(buffer, offs, value) \
83a13ef5902aeed Felix Kuehling 2020-05-22  221  		sysfs_show_gen_prop(buffe=
r, offs, "%u\n", value)
83a13ef5902aeed Felix Kuehling 2020-05-22  222  #define sysfs_show_str_val(=
buffer, offs, value) \
83a13ef5902aeed Felix Kuehling 2020-05-22  223  		sysfs_show_gen_prop(buffe=
r, offs, "%s\n", value)
5b5c4e40a37e858 Evgeny Pinchuk 2014-07-16  224  =

5b5c4e40a37e858 Evgeny Pinchuk 2014-07-16  225  static ssize_t sysprops_sho=
w(struct kobject *kobj, struct attribute *attr,
5b5c4e40a37e858 Evgeny Pinchuk 2014-07-16  226  		char *buffer)
5b5c4e40a37e858 Evgeny Pinchuk 2014-07-16  227  {
83a13ef5902aeed Felix Kuehling 2020-05-22  228  	int offs =3D 0;
5b5c4e40a37e858 Evgeny Pinchuk 2014-07-16  229  =

5b5c4e40a37e858 Evgeny Pinchuk 2014-07-16  230  	/* Making sure that the bu=
ffer is an empty string */
5b5c4e40a37e858 Evgeny Pinchuk 2014-07-16  231  	buffer[0] =3D 0;
5b5c4e40a37e858 Evgeny Pinchuk 2014-07-16  232  =

5b5c4e40a37e858 Evgeny Pinchuk 2014-07-16  233  	if (attr =3D=3D &sys_props=
.attr_genid) {
83a13ef5902aeed Felix Kuehling 2020-05-22  234  		sysfs_show_32bit_val(buff=
er, offs,
83a13ef5902aeed Felix Kuehling 2020-05-22  235  				     sys_props.generati=
on_count);
5b5c4e40a37e858 Evgeny Pinchuk 2014-07-16  236  	} else if (attr =3D=3D &sy=
s_props.attr_props) {
83a13ef5902aeed Felix Kuehling 2020-05-22 @237  		sysfs_show_64bit_prop(buf=
fer, offs, "platform_oem",
5b5c4e40a37e858 Evgeny Pinchuk 2014-07-16  238  				      sys_props.platfor=
m_oem);
83a13ef5902aeed Felix Kuehling 2020-05-22  239  		sysfs_show_64bit_prop(buf=
fer, offs, "platform_id",
5b5c4e40a37e858 Evgeny Pinchuk 2014-07-16  240  				      sys_props.platfor=
m_id);
83a13ef5902aeed Felix Kuehling 2020-05-22  241  		sysfs_show_64bit_prop(buf=
fer, offs, "platform_rev",
5b5c4e40a37e858 Evgeny Pinchuk 2014-07-16  242  				      sys_props.platfor=
m_rev);
5b5c4e40a37e858 Evgeny Pinchuk 2014-07-16  243  	} else {
83a13ef5902aeed Felix Kuehling 2020-05-22  244  		offs =3D -EINVAL;
5b5c4e40a37e858 Evgeny Pinchuk 2014-07-16  245  	}
5b5c4e40a37e858 Evgeny Pinchuk 2014-07-16  246  =

83a13ef5902aeed Felix Kuehling 2020-05-22  247  	return offs;
5b5c4e40a37e858 Evgeny Pinchuk 2014-07-16  248  }
5b5c4e40a37e858 Evgeny Pinchuk 2014-07-16  249  =


:::::: The code at line 237 was first introduced by commit
:::::: 83a13ef5902aeedbd84ab282c835059c2cae5783 drm/amdkfd: Fix GCC 10 comp=
iler warning

:::::: TO: Felix Kuehling <Felix.Kuehling@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2822368421911771966==--

