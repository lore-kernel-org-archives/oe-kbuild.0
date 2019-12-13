Content-Type: multipart/mixed; boundary="===============5560625164509169491=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Add lmem fault handler
Date: Fri, 13 Dec 2019 12:49:46 +0300
Message-ID: <20191213094946.GA2407@kadam>
In-Reply-To: <20191211055907.8398-1-abdiel.janulgue@linux.intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5560625164509169491==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Abdiel,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip next-20191210]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Abdiel-Janulgue/drm-i915-A=
dd-lmem-fault-handler/20191212-031235
base:   git://anongit.freedesktop.org/drm-intel for-linux-next

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/i915/gem/i915_gem_lmem.c:40 vm_fault_lmem() error: uninitia=
lized symbol 'vmf_ret'.

# https://github.com/0day-ci/linux/commit/527bcb2414222221b5b3cea4909756095=
ae07d6a
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 527bcb2414222221b5b3cea4909756095ae07d6a
vim +/vmf_ret +40 drivers/gpu/drm/i915/gem/i915_gem_lmem.c

527bcb24142222 Abdiel Janulgue 2019-12-11  12  vm_fault_t vm_fault_lmem(str=
uct vm_fault *vmf)
527bcb24142222 Abdiel Janulgue 2019-12-11  13  {
527bcb24142222 Abdiel Janulgue 2019-12-11  14  	struct vm_area_struct *area=
 =3D vmf->vma;
527bcb24142222 Abdiel Janulgue 2019-12-11  15  	struct i915_mmap_offset *pr=
iv =3D area->vm_private_data;
527bcb24142222 Abdiel Janulgue 2019-12-11  16  	struct drm_i915_gem_object =
*obj =3D priv->obj;
527bcb24142222 Abdiel Janulgue 2019-12-11  17  	unsigned long size =3D area=
->vm_end - area->vm_start;
527bcb24142222 Abdiel Janulgue 2019-12-11  18  	bool write =3D area->vm_fla=
gs & VM_WRITE;
527bcb24142222 Abdiel Janulgue 2019-12-11  19  	vm_fault_t vmf_ret;
                                                ^^^^^^^^^^^^^^^^^^^

527bcb24142222 Abdiel Janulgue 2019-12-11  20  	int i, ret;
527bcb24142222 Abdiel Janulgue 2019-12-11  21  =

527bcb24142222 Abdiel Janulgue 2019-12-11  22  	/* Sanity check that we all=
ow writing into this object */
527bcb24142222 Abdiel Janulgue 2019-12-11  23  	if (i915_gem_object_is_read=
only(obj) && write)
527bcb24142222 Abdiel Janulgue 2019-12-11  24  		return VM_FAULT_SIGBUS;
527bcb24142222 Abdiel Janulgue 2019-12-11  25  =

527bcb24142222 Abdiel Janulgue 2019-12-11  26  	ret =3D i915_gem_object_pin=
_pages(obj);
527bcb24142222 Abdiel Janulgue 2019-12-11  27  	if (ret)
527bcb24142222 Abdiel Janulgue 2019-12-11  28  		return i915_error_to_vmf_f=
ault(ret);
527bcb24142222 Abdiel Janulgue 2019-12-11  29  =

527bcb24142222 Abdiel Janulgue 2019-12-11  30  	for (i =3D 0; i < size >> P=
AGE_SHIFT; i++) {

Can size be less than a page?

527bcb24142222 Abdiel Janulgue 2019-12-11  31  		vmf_ret =3D vmf_insert_pfn=
(area,
527bcb24142222 Abdiel Janulgue 2019-12-11  32  					 (unsigned long)area->v=
m_start + i * PAGE_SIZE,
527bcb24142222 Abdiel Janulgue 2019-12-11  33  					 i915_gem_object_lmem_i=
o_pfn(obj, i));
527bcb24142222 Abdiel Janulgue 2019-12-11  34  		if (vmf_ret !=3D VM_FAULT_=
NOPAGE)
527bcb24142222 Abdiel Janulgue 2019-12-11  35  			break;
527bcb24142222 Abdiel Janulgue 2019-12-11  36  	}
527bcb24142222 Abdiel Janulgue 2019-12-11  37  =

527bcb24142222 Abdiel Janulgue 2019-12-11  38  	i915_gem_object_unpin_pages=
(obj);
527bcb24142222 Abdiel Janulgue 2019-12-11  39  =

527bcb24142222 Abdiel Janulgue 2019-12-11 @40  	return vmf_ret;
527bcb24142222 Abdiel Janulgue 2019-12-11  41  }

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============5560625164509169491==--

