Content-Type: multipart/mixed; boundary="===============5748194946372152142=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/uapi: Add docs about immutability of engine sets and VMs
Date: Sun, 11 Jul 2021 06:58:13 +0800
Message-ID: <202107110629.t7rIcxwX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5748194946372152142==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210710212447.785288-3-jason@jlekstrand.net>
References: <20210710212447.785288-3-jason@jlekstrand.net>
TO: Jason Ekstrand <jason@jlekstrand.net>
TO: intel-gfx(a)lists.freedesktop.org
TO: dri-devel(a)lists.freedesktop.org
CC: Daniel Vetter <daniel.vetter@ffwll.ch>

Hi Jason,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[cannot apply to drm-intel/for-linux-next drm-exynos/exynos-drm-next tegra-=
drm/drm/tegra/for-next drm/drm-next v5.13 next-20210709]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jason-Ekstrand/drm-i915-Be=
tter-document-VM-and-engine-set-APIs/20210711-052820
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
:::::: branch date: 89 minutes ago
:::::: commit date: 89 minutes ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':   65< /*
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':   66<  * i915_user_=
extension: Base class for defining a chain of extensions
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h':   65> /**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':   66>  * struct i91=
5_user_extension - Base class for defining a chain of extensions
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':   79>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':   80>  * Example ch=
aining:
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':   81>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':   82>  * .. code-bl=
ock:: C
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':   83>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':   84>  *	struct i91=
5_user_extension ext3 {
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':   85>  *		.next_ext=
ension =3D 0, // end
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':   86>  *		.name =3D=
 ...,
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':   87>  *	};
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':   88>  *	struct i91=
5_user_extension ext2 {
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':   89>  *		.next_ext=
ension =3D (uintptr_t)&ext3,
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':   90>  *		.name =3D=
 ...,
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':   91>  *	};
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':   92>  *	struct i91=
5_user_extension ext1 {
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':   93>  *		.next_ext=
ension =3D (uintptr_t)&ext2,
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':   94>  *		.name =3D=
 ...,
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':   95>  *	};
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':   96>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':   97>  * Typically =
the struct i915_user_extension would be embedded in some uAPI
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':   98>  * struct, an=
d in this case we would feed it the head of the chain(i.e ext1),
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':   99>  * which woul=
d then apply all of the above extensions.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  100>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  103> 	/**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  104> 	 * @next_ext=
ension:
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  105> 	 *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  106> 	 * Pointer t=
o the next struct i915_user_extension, or zero if the end.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  107> 	 */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  109> 	/**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  110> 	 * @name: Na=
me of the extension.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  111> 	 *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  112> 	 * Note that=
 the name here is just some integer.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  113> 	 *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  114> 	 * Also note=
 that the name space for this is not global for the whole
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  115> 	 * driver, b=
ut rather its scope/meaning is limited to the specific piece
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  116> 	 * of uAPI w=
hich has embedded the struct i915_user_extension.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  117> 	 */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':   83< 	__u32 flags;=
 /* All undefined bits must be zero. */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':   84< 	__u32 rsvd[4=
]; /* Reserved for future use; must be zero. */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h':  119> 	/**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  120> 	 * @flags: M=
BZ
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  121> 	 *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  122> 	 * All undef=
ined bits must be zero.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  123> 	 */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  124> 	__u32 flags;
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  125> 	/**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  126> 	 * @rsvd: MBZ
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  127> 	 *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  128> 	 * Reserved =
for future use; must be zero.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  129> 	 */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  130> 	__u32 rsvd[4=
];
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  409> #define DRM_I=
915_GEM_CREATE_EXT		0x3c
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  442> #define DRM_I=
OCTL_I915_GEM_CREATE_EXT	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_CREATE_EX=
T, struct drm_i915_gem_create_ext)
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1057< /**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h': 1105> /*
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1062< /**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h': 1110> /*
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1303< 	 * I915_CONT=
EXT_SET_ENGINES parameter and via perf, i.e.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h': 1351> 	 * I915_CONT=
EXT_PARAM_ENGINES context parameter and via perf, i.e.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1305< 	 * reported =
as active itself. Some hardware may have parallel
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1306< 	 * execution=
 engines, e.g. multiple media engines, which are
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1307< 	 * mapped to=
 the same class identifier and so are not separately
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1308< 	 * reported =
for busyness.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h': 1353> 	 * Some hard=
ware may have parallel execution engines, e.g. multiple
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1354> 	 * media eng=
ines, which are mapped to the same class identifier and so
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1355> 	 * are not s=
eparately reported for busyness.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1641> /* I915_CONTE=
XT_PARAM_NO_ZEROMAP has been removed.  On the off chance
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1642>  * someone so=
mewhere has attempted to use it, never re-use this context
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1643>  * param numb=
er.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1644>  */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1628< 	/*
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1629< 	 * The id of=
 the associated virtual memory address space (ppGTT) of
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1630< 	 * this cont=
ext. Can be retrieved and passed to another context
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1631< 	 * (on the s=
ame fd) for both to use the same ppGTT and so share
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1632< 	 * address l=
ayouts, and avoid reloading the page tables on context
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1633< 	 * switches =
between themselves.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h': 1634< 	 *
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1635< 	 * See DRM_I=
915_GEM_VM_CREATE and DRM_I915_GEM_VM_DESTROY.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1636< 	 */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h': 1679> /*
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1680>  * The id of =
the associated virtual memory address space (ppGTT) of
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1681>  * this conte=
xt. Can be retrieved and passed to another context
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1682>  * (on the sa=
me fd) for both to use the same ppGTT and so share
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1683>  * address la=
youts, and avoid reloading the page tables on context
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1684>  * switches b=
etween themselves.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1685>  *
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1686>  * The VM id =
should only be set via I915_CONTEXT_CREATE_EXT_SETPARAM.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1687>  *
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1688>  * On GPUs wi=
th graphics version 12 and earlier, it may also be set via
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1689>  * DRM_IOCTL_=
I915_GEM_CONTEXT_SETPARAM.  However, this is only for
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1690>  * backwards =
compatibility with old userspace and should be considered
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1691>  * deprecated=
.  Starting with graphics version 13, it can only be set via
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1692>  * I915_CONTE=
XT_CREATE_EXT_SETPARAM.  When using setparam, it may only be
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1693>  * set once f=
or each context and, once the context has been used with any
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1694>  * ioctl othe=
r than I915_CONTEXT_CREATE_EXT_SETPARAM, it may not be set.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1695>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1696>  * See DRM_I9=
15_GEM_VM_CREATE and DRM_I915_GEM_VM_DESTROY.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1697>  */
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1652<  * Setting th=
e number of engines bound to the context to 0, by passing a zero
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1653<  * sized argu=
ment, will revert back to default settings.
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1713>  * The engine=
 set should only be set via I915_CONTEXT_CREATE_EXT_SETPARAM.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1714>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1715>  * On GPUs wi=
th graphics version 12 and earlier, it may also be set via
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1716>  * DRM_IOCTL_=
I915_GEM_CONTEXT_SETPARAM.  However, this is only for
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1717>  * backwards =
compatibility with old userspace and should be considered
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1718>  * deprecated=
.  Starting with graphics version 13, it can only be set via
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1719>  * I915_CONTE=
XT_CREATE_EXT_SETPARAM.  When using setparam, it may only be
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1720>  * set once f=
or each context and, once the context has been used with any
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1721>  * ioctl othe=
r than I915_CONTEXT_CREATE_EXT_SETPARAM, it may not be set.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1678< /*
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1679<  * I915_CONTE=
XT_PARAM_RINGSIZE:
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1680<  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1681<  * Sets the s=
ize of the CS ringbuffer to use for logical ring contexts. This
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1682<  * applies a =
limit of how many batches can be queued to HW before the caller
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1683<  * is blocked=
 due to lack of space for more commands.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1684<  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1685<  * Only relia=
bly possible to be set prior to first use, i.e. during
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1686<  * constructi=
on. At any later point, the current execution must be flushed as
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1687<  * the ring c=
an only be changed while the context is idle. Note, the ringsize
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1688<  * can be spe=
cified as a constructor property, see
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1689<  * I915_CONTE=
XT_CREATE_EXT_SETPARAM, but can also be set later if required.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1690<  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1691<  * Only appli=
es to the current set of engine and lost when those engines
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1692<  * are replac=
ed by a new mapping (see I915_CONTEXT_PARAM_ENGINES).
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1693<  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1694<  * Must be be=
tween 4 - 512 KiB, in intervals of page size [4 KiB].
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1695<  * Default is=
 16 KiB.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h': 1746> /* This API h=
as been removed.  On the off chance someone somewhere has
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1747>  * attempted =
to use it, never re-use this context param number.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1703< /**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h': 1755> /*
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1814> /**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1815>  * DOC: Virtu=
al Engine uAPI
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1816>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1817>  * Virtual en=
gine is a concept where userspace is able to configure a set of
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1818>  * physical e=
ngines, submit a batch buffer, and let the driver execute it on any
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1819>  * engine fro=
m the set as it sees fit.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1820>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1821>  * This is pr=
imarily useful on parts which have multiple instances of a same
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1822>  * class engi=
ne, like for example GT3+ Skylake parts with their two VCS engines.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1823>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1824>  * For instan=
ce userspace can enumerate all engines of a certain class using the
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1825>  * previously=
 described `Engine Discovery uAPI`_. After that userspace can
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1826>  * create a G=
EM context with a placeholder slot for the virtual engine (using
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1827>  * `I915_ENGI=
NE_CLASS_INVALID` and `I915_ENGINE_CLASS_INVALID_NONE` for class
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1828>  * and instan=
ce respectively) and finally using the
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1829>  * `I915_CONT=
EXT_ENGINES_EXT_LOAD_BALANCE` extension place a virtual engine in
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1830>  * the same r=
eserved slot.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1831>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1832>  * Example of=
 creating a virtual engine and submitting a batch buffer to it:
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1833>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1834>  * .. code-bl=
ock:: C
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1835>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1836>  * 	I915_DEFI=
NE_CONTEXT_ENGINES_LOAD_BALANCE(virtual, 2) =3D {
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1837>  * 		.base.na=
me =3D I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE,
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1838>  * 		.engine_=
index =3D 0, // Place this virtual engine into engine map slot 0
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1839>  * 		.num_sib=
lings =3D 2,
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1840>  * 		.engines=
 =3D { { I915_ENGINE_CLASS_VIDEO, 0 },
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1841>  * 			     { =
I915_ENGINE_CLASS_VIDEO, 1 }, },
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1842>  * 	};
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1843>  * 	I915_DEFI=
NE_CONTEXT_PARAM_ENGINES(engines, 1) =3D {
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1844>  * 		.engines=
 =3D { { I915_ENGINE_CLASS_INVALID,
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1845>  * 			       =
I915_ENGINE_CLASS_INVALID_NONE } },
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1846>  * 		.extensi=
ons =3D to_user_pointer(&virtual), // Chains after load_balance extension
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1847>  * 	};
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1848>  * 	struct dr=
m_i915_gem_context_create_ext_setparam p_engines =3D {
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1849>  * 		.base =
=3D {
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1850>  * 			.name =
=3D I915_CONTEXT_CREATE_EXT_SETPARAM,
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1851>  * 		},
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1852>  * 		.param =
=3D {
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1853>  * 			.param =
=3D I915_CONTEXT_PARAM_ENGINES,
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1854>  * 			.value =
=3D to_user_pointer(&engines),
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1855>  * 			.size =
=3D sizeof(engines),
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1856>  * 		},
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1857>  * 	};
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1858>  * 	struct dr=
m_i915_gem_context_create_ext create =3D {
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1859>  * 		.flags =
=3D I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS,
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1860>  * 		.extensi=
ons =3D to_user_pointer(&p_engines);
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1861>  * 	};
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1862>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1863>  * 	ctx_id =
=3D gem_context_create_ext(drm_fd, &create);
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1864>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1865>  * 	// Now we=
 have created a GEM context with its engine map containing a
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1866>  * 	// single=
 virtual engine. Submissions to this slot can go either to
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1867>  * 	// vcs0 o=
r vcs1, depending on the load balancing algorithm used inside
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1868>  * 	// the dr=
iver. The load balancing is dynamic from one batch buffer to
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1869>  * 	// anothe=
r and transparent to userspace.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1870>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1871>  * 	...
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1872>  * 	execbuf.r=
svd1 =3D ctx_id;
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1873>  * 	execbuf.f=
lags =3D 0; // Submits to index 0 which is the virtual engine
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1874>  * 	gem_execb=
uf(drm_fd, &execbuf);
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1875>  */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1876> =

   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1953> /**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1954>  * DOC: Conte=
xt Engine Map uAPI
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1955>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1956>  * Context en=
gine map is a new way of addressing engines when submitting batch-
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1957>  * buffers, r=
eplacing the existing way of using identifiers like `I915_EXEC_BLT`
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1958>  * inside the=
 flags field of `struct drm_i915_gem_execbuffer2`.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1959>  *

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5748194946372152142==--

