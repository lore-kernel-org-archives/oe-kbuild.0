Content-Type: multipart/mixed; boundary="===============3286894528476550498=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 5/5] drm/i915/uapi: reject set_domain for discrete
Date: Tue, 06 Jul 2021 06:44:54 +0800
Message-ID: <202107060633.khbzwHoe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3286894528476550498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210705135310.1502437-5-matthew.auld@intel.com>
References: <20210705135310.1502437-5-matthew.auld@intel.com>
TO: Matthew Auld <matthew.auld@intel.com>
TO: intel-gfx(a)lists.freedesktop.org
CC: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>
CC: dri-devel(a)lists.freedesktop.org
CC: Kenneth Graunke <kenneth@whitecape.org>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>

Hi Matthew,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[cannot apply to drm-intel/for-linux-next drm-exynos/exynos-drm-next tegra-=
drm/drm/tegra/for-next drm/drm-next v5.13 next-20210701]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Matthew-Auld/drm-i915-use-=
consistent-CPU-mappings-for-pin_map-users/20210705-215511
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
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
s from latest version at 'include/uapi/drm/i915_drm.h':  883> =

   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  884> /**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  885>  * struct drm=
_i915_gem_set_domain - Adjust the objects write or read domain, in
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  886>  * preparatio=
n for accessing the pages via some CPU domain.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  887>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  888>  * Specifying=
 a new write or read domain will flush the object out of the
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  889>  * previous d=
omain(if required), before then updating the objects domain
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  890>  * tracking w=
ith the new domain.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  891>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  892>  * Note this =
might involve waiting for the object first if it is still active on
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  893>  * the GPU.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  894>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  895>  * Supported =
values for @read_domains and @write_domain:
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  896>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  897>  *	- I915_GEM=
_DOMAIN_WC: Uncached write-combined domain
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  898>  *	- I915_GEM=
_DOMAIN_CPU: CPU cache domain
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  899>  *	- I915_GEM=
_DOMAIN_GTT: Mappable aperture domain
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  900>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  901>  * All other =
domains are rejected.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  902>  *
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  903>  * Note that =
for discrete, starting from DG1, this is no longer supported, and
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  904>  * is instead=
 rejected. On such platforms the CPU domain is effectively static,
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  905>  * where we a=
lso only support a single &drm_i915_gem_mmap_offset cache mode,
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  906>  * which can'=
t be set explicitly and instead depends on the object placements,
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  907>  * as per the=
 below.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  908>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  909>  * Implicit c=
aching rules, starting from DG1:
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  910>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  911>  *	- If any o=
f the object placements (see &drm_i915_gem_create_ext_memory_regions)
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  912>  *	  contain =
I915_MEMORY_CLASS_DEVICE then the object will be allocated and
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  913>  *	  mapped a=
s write-combined only.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  914>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  915>  *	- Everythi=
ng else is always allocated and mapped as write-back, with the
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  916>  *	  guarante=
e that everything is also coherent with the GPU.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  917>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  918>  * Note that =
this is likely to change in the future again, where we might need
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  919>  * more flexi=
bility on future devices, so making this all explicit as part of a
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  920>  * new &drm_i=
915_gem_create_ext extension is probable.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  921>  */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  836< 	/** Handle f=
or the object */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h':  923> 	/** @handle:=
 Handle for the object. */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  839< 	/** New read=
 domains */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h':  926> 	/**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  927> 	 * @read_dom=
ains: New read domains.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  928> 	 */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  842< 	/** New writ=
e domain */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h':  931> 	/**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  932> 	 * @write_do=
main: New write domain.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  933> 	 *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  934> 	 * Note that=
 having something in the write domain implies it's in the
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  935> 	 * read doma=
in, and only that read domain.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  936> 	 */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1057< /**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h': 1151> /*
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1062< /**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h': 1156> /*
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1303< 	 * I915_CONT=
EXT_SET_ENGINES parameter and via perf, i.e.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h': 1397> 	 * I915_CONT=
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
s from latest version@'include/uapi/drm/i915_drm.h': 1399> 	 * Some hard=
ware may have parallel execution engines, e.g. multiple
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1400> 	 * media eng=
ines, which are mapped to the same class identifier and so
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1401> 	 * are not s=
eparately reported for busyness.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1319<  * I915_CACHI=
NG_NONE
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1320<  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1321<  * GPU access=
 is not coherent with cpu caches. Default for machines without an
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1322<  * LLC.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1323<  */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1324< #define I915_=
CACHING_NONE		0
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1325< /**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1326<  * I915_CACHI=
NG_CACHED
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h': 1412>  * struct drm=
_i915_gem_caching - Set or get the caching for given object
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1413>  * handle.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1328<  * GPU access=
 is coherent with cpu caches and furthermore the data is cached in
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1329<  * last-level=
 caches shared between cpu cores and the gpu GT. Default on
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1330<  * machines w=
ith HAS_LLC.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h': 1415>  * Allow user=
space to control the GTT caching bits for a given object when the
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1416>  * object is =
later mapped through the ppGTT(or GGTT on older platforms lacking
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1417>  * ppGTT supp=
ort, or if the object is used for scanout). Note that this might
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1418>  * require un=
binding the object from the GTT first, if its current caching value
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1419>  * doesn't ma=
tch.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1420>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1421>  * Note that =
this all changes on discrete platforms, starting from DG1, the
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1422>  * set/get ca=
ching is no longer supported, and is now rejected.  Instead the CPU
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1423>  * caching at=
tributes(WB vs WC) will become an immutable creation time property
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1424>  * for the ob=
ject, along with the GTT caching level. For now we don't expose any
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1425>  * new uAPI f=
or this, instead on DG1 this is all implicit, although this largely
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1426>  * shouldn't =
matter since DG1 is coherent by default(without any way of
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1427>  * controllin=
g it).
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1428>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1429>  * Implicit c=
aching rules, starting from DG1:
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1430>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1431>  *     - If a=
ny of the object placements (see &drm_i915_gem_create_ext_memory_regions)
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1432>  *       cont=
ain I915_MEMORY_CLASS_DEVICE then the object will be allocated and
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1433>  *       mapp=
ed as write-combined only.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1434>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1435>  *     - Ever=
ything else is always allocated and mapped as write-back, with the
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1436>  *       guar=
antee that everything is also coherent with the GPU.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1437>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1438>  * Note that =
this is likely to change in the future again, where we might need
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1439>  * more flexi=
bility on future devices, so making this all explicit as part of a
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1440>  * new &drm_i=
915_gem_create_ext extension is probable.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1441>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1442>  * Side note:=
 Part of the reason for this is that changing the at-allocation-time CPU
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1443>  * caching at=
tributes for the pages might be required(and is expensive) if we
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1444>  * need to th=
en CPU map the pages later with different caching attributes. This
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1445>  * inconsiste=
nt caching behaviour, while supported on x86, is not universally
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1446>  * supported =
on other architectures. So for simplicity we opt for setting
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1447>  * everything=
 at creation time, whilst also making it immutable, on discrete
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1448>  * platforms.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1332< #define I915_=
CACHING_CACHED		1
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1333< /**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1334<  * I915_CACHI=
NG_DISPLAY
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1335<  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1336<  * Special GP=
U caching mode which is coherent with the scanout engines.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1337<  * Transparen=
tly falls back to I915_CACHING_NONE on platforms where no special
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1338<  * cache mode=
 (like write-through or gfdt flushing) is available. The kernel
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1339<  * automatica=
lly sets this mode when using a buffer as a scanout target.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1340<  * Userspace =
can manually set this mode to avoid a costly stall and clflush in
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1341<  * the hotpat=
h of drawing the first frame.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1342<  */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1343< #define I915_=
CACHING_DISPLAY		2
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h': 1344< =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============3286894528476550498==--

