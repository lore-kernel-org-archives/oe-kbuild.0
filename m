Content-Type: multipart/mixed; boundary="===============3802369431532104298=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdkfd/kfd_crat.c:801:9: warning: Either the condition '!pcrat_image' is redundant or there is possible null pointer dereference: pcrat_image.
Date: Tue, 27 Oct 2020 21:36:01 +0800
Message-ID: <202010272158.Bi2UqnPb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3802369431532104298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kent Russell <kent.russell@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4525c8781ec0701ce824e8bd379ae1b129e26568
commit: d0e63b343e575e8b74c185565b0d79a93494bcaa drm/amdkfd: Use kvmalloc i=
nstead of kmalloc for VCRAT
date:   5 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 5 weeks ago
compiler: powerpc64le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c:
>> drivers/gpu/drm/amd/amdkfd/kfd_crat.c:801:9: warning: Either the conditi=
on '!pcrat_image' is redundant or there is possible null pointer dereferenc=
e: pcrat_image. [nullPointerRedundantCheck]
    memcpy(pcrat_image, crat_table, crat_table->length);
           ^
   drivers/gpu/drm/amd/amdkfd/kfd_crat.c:802:6: note: Assuming that conditi=
on '!pcrat_image' is not redundant
    if (!pcrat_image)
        ^
   drivers/gpu/drm/amd/amdkfd/kfd_crat.c:801:9: note: Null pointer derefere=
nce
    memcpy(pcrat_image, crat_table, crat_table->length);
           ^
   drivers/gpu/drm/amd/amdkfd/kfd_crat.c:405:32: warning: Shifting signed 3=
2-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    if (props && (iolink->flags & CRAT_IOLINK_FLAGS_BI_DIRECTIONAL)) {
                                  ^
   drivers/gpu/drm/amd/amdkfd/kfd_crat.c:1112:26: warning: Shifting signed =
32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     sub_type_hdr->flags |=3D CRAT_IOLINK_FLAGS_BI_DIRECTIONAL;
                            ^
   drivers/gpu/drm/amd/amdkfd/kfd_crat.c:1146:11: warning: Shifting signed =
32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
             CRAT_IOLINK_FLAGS_BI_DIRECTIONAL;
             ^
   drivers/gpu/drm/amd/amdkfd/kfd_crat.c:941:3: warning: Assignment of func=
tion parameter has no effect outside the function. Did you forget dereferen=
cing it? [uselessAssignmentPtrArg]
     sub_type_hdr++;
     ^

vim +801 drivers/gpu/drm/amd/amdkfd/kfd_crat.c

6127896f4a27257 Huang Rui              2020-08-18  760  =

8e05247d4c23ff1 Harish Kasiviswanathan 2017-12-08  761  /*
8e05247d4c23ff1 Harish Kasiviswanathan 2017-12-08  762   * kfd_create_crat_=
image_acpi - Allocates memory for CRAT image and
8e05247d4c23ff1 Harish Kasiviswanathan 2017-12-08  763   * copies CRAT from=
 ACPI (if available).
8e05247d4c23ff1 Harish Kasiviswanathan 2017-12-08  764   * NOTE: Call kfd_d=
estroy_crat_image to free CRAT image memory
8e05247d4c23ff1 Harish Kasiviswanathan 2017-12-08  765   *
8e05247d4c23ff1 Harish Kasiviswanathan 2017-12-08  766   *	@crat_image: CRA=
T read from ACPI. If no CRAT in ACPI then
8e05247d4c23ff1 Harish Kasiviswanathan 2017-12-08  767   *		     crat_image=
 will be NULL
8e05247d4c23ff1 Harish Kasiviswanathan 2017-12-08  768   *	@size: [OUT] siz=
e of crat_image
8e05247d4c23ff1 Harish Kasiviswanathan 2017-12-08  769   *
8e05247d4c23ff1 Harish Kasiviswanathan 2017-12-08  770   *	Return 0 if succ=
essful else return error code
8e05247d4c23ff1 Harish Kasiviswanathan 2017-12-08  771   */
8e05247d4c23ff1 Harish Kasiviswanathan 2017-12-08  772  int kfd_create_crat=
_image_acpi(void **crat_image, size_t *size)
174de876d6d02f7 Felix Kuehling         2017-12-08  773  {
174de876d6d02f7 Felix Kuehling         2017-12-08  774  	struct acpi_table_=
header *crat_table;
174de876d6d02f7 Felix Kuehling         2017-12-08  775  	acpi_status status;
8e05247d4c23ff1 Harish Kasiviswanathan 2017-12-08  776  	void *pcrat_image;
174de876d6d02f7 Felix Kuehling         2017-12-08  777  =

8e05247d4c23ff1 Harish Kasiviswanathan 2017-12-08  778  	if (!crat_image)
174de876d6d02f7 Felix Kuehling         2017-12-08  779  		return -EINVAL;
174de876d6d02f7 Felix Kuehling         2017-12-08  780  =

8e05247d4c23ff1 Harish Kasiviswanathan 2017-12-08  781  	*crat_image =3D NU=
LL;
8e05247d4c23ff1 Harish Kasiviswanathan 2017-12-08  782  =

8e05247d4c23ff1 Harish Kasiviswanathan 2017-12-08  783  	/* Fetch the CRAT =
table from ACPI */
174de876d6d02f7 Felix Kuehling         2017-12-08  784  	status =3D acpi_ge=
t_table(CRAT_SIGNATURE, 0, &crat_table);
174de876d6d02f7 Felix Kuehling         2017-12-08  785  	if (status =3D=3D =
AE_NOT_FOUND) {
174de876d6d02f7 Felix Kuehling         2017-12-08  786  		pr_warn("CRAT tab=
le not found\n");
174de876d6d02f7 Felix Kuehling         2017-12-08  787  		return -ENODATA;
174de876d6d02f7 Felix Kuehling         2017-12-08  788  	} else if (ACPI_FA=
ILURE(status)) {
174de876d6d02f7 Felix Kuehling         2017-12-08  789  		const char *err =
=3D acpi_format_exception(status);
174de876d6d02f7 Felix Kuehling         2017-12-08  790  =

174de876d6d02f7 Felix Kuehling         2017-12-08  791  		pr_err("CRAT tabl=
e error: %s\n", err);
174de876d6d02f7 Felix Kuehling         2017-12-08  792  		return -EINVAL;
174de876d6d02f7 Felix Kuehling         2017-12-08  793  	}
174de876d6d02f7 Felix Kuehling         2017-12-08  794  =

6127896f4a27257 Huang Rui              2020-08-18  795  	if (kfd_ignore_cra=
t()) {
ebcfd1e276207e4 Felix Kuehling         2017-12-08  796  		pr_info("CRAT tab=
le disabled by module option\n");
ebcfd1e276207e4 Felix Kuehling         2017-12-08  797  		return -ENODATA;
ebcfd1e276207e4 Felix Kuehling         2017-12-08  798  	}
ebcfd1e276207e4 Felix Kuehling         2017-12-08  799  =

d0e63b343e575e8 Kent Russell           2020-09-18  800  	pcrat_image =3D kv=
malloc(crat_table->length, GFP_KERNEL);
d0e63b343e575e8 Kent Russell           2020-09-18 @801  	memcpy(pcrat_image=
, crat_table, crat_table->length);
8e05247d4c23ff1 Harish Kasiviswanathan 2017-12-08  802  	if (!pcrat_image)
8e05247d4c23ff1 Harish Kasiviswanathan 2017-12-08  803  		return -ENOMEM;
174de876d6d02f7 Felix Kuehling         2017-12-08  804  =

8e05247d4c23ff1 Harish Kasiviswanathan 2017-12-08  805  	*crat_image =3D pc=
rat_image;
174de876d6d02f7 Felix Kuehling         2017-12-08  806  	*size =3D crat_tab=
le->length;
174de876d6d02f7 Felix Kuehling         2017-12-08  807  =

174de876d6d02f7 Felix Kuehling         2017-12-08  808  	return 0;
174de876d6d02f7 Felix Kuehling         2017-12-08  809  }
8e05247d4c23ff1 Harish Kasiviswanathan 2017-12-08  810  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3802369431532104298==--

