Content-Type: multipart/mixed; boundary="===============0969526331800888952=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Add TTM offset argument to mmap.
Date: Fri, 09 Jul 2021 23:26:42 +0800
Message-ID: <202107092355.2gZB1LrI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0969526331800888952==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210709114120.651309-1-maarten.lankhorst@linux.intel.com>
References: <20210709114120.651309-1-maarten.lankhorst@linux.intel.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: intel-gfx(a)lists.freedesktop.org
CC: dri-devel(a)lists.freedesktop.org

Hi Maarten,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[cannot apply to drm-intel/for-linux-next drm-exynos/exynos-drm-next tegra-=
drm/drm/tegra/for-next drm/drm-next v5.13 next-20210709]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Maarten-Lankhorst/drm-i915=
-Add-TTM-offset-argument-to-mmap/20210709-194350
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
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
s from latest version at 'include/uapi/drm/i915_drm.h':  852> /**
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  853>  * struct drm=
_i915_gem_mmap_offset - Retrieve an offset so we can mmap this buffer objec=
t.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  854>  *
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  855>  * This struc=
t is passed as argument to the `DRM_IOCTL_I915_GEM_MMAP_OFFSET` ioctl,
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  856>  * and is use=
d to retrieve the fake offset to mmap an object specified by &handle.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  857>  *
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  858>  * The legacy=
 way of using `DRM_IOCTL_I915_GEM_MMAP` is removed on gen12+.
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  859>  * `DRM_IOCTL=
_I915_GEM_MMAP_GTT` is an older supported alias to this struct, but will be=
have
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  860>  * as setting=
 the &extensions to 0, and &flags to `I915_MMAP_OFFSET_GTT`.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  861>  */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  805< 	/** Handle f=
or the object being mapped. */
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  863> 	/** @handle:=
 Handle for the object being mapped. */
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  865> 	/** @pad: Mu=
st be zero */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  809< 	 * Fake offs=
et to use for subsequent mmap call
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  868> 	 * @offset: =
The fake offset to use for subsequent mmap call
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  816< 	 * Flags for=
 extended behaviour.
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  875> 	 * @flags: F=
lags for extended behaviour.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  818< 	 * It is man=
datory that one of the MMAP_OFFSET types
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  819< 	 * (GTT, WC,=
 WB, UC, etc) should be included.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h':  877> 	 * It is man=
datory that one of the `MMAP_OFFSET` types
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  878> 	 * should be=
 included:
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  879> 	 * - `I915_M=
MAP_OFFSET_GTT`: Use mmap with the object bound to GTT.
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  880> 	 * - `I915_M=
MAP_OFFSET_WC`: Use Write-Combined caching.
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  881> 	 * - `I915_M=
MAP_OFFSET_WB`: Use Write-Back caching.
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  882> 	 * - `I915_M=
MAP_OFFSET_TTM`: Use TTM to determine caching based on object placement.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  883> 	 *
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  884> 	 * Only on d=
evices with local memory is `I915_MMAP_OFFSET_TTM` valid. On
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  885> 	 * devices w=
ithout local memory, this caching mode is invalid.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  886> 	 *
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  887> 	 * As cachin=
g mode when specifying `I915_MMAP_OFFSET_TTM`, WC or WB will
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  888> 	 * be used, =
depending on the object placement. WC will be used
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  889> 	 * when the =
object resides in local memory, WB otherwise.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  822< #define I915_=
MMAP_OFFSET_GTT 0
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  823< #define I915_=
MMAP_OFFSET_WC  1
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  824< #define I915_=
MMAP_OFFSET_WB  2
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  825< #define I915_=
MMAP_OFFSET_UC  3
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  827< 	/*
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h':  828< 	 * Zero-term=
inated chain of extensions.
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  893> /** Use an mm=
ap for the object by binding to GTT. */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  894> #define I915_=
MMAP_OFFSET_GTT	0
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  895> /** Use Write=
-Combined caching. */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  896> #define I915_=
MMAP_OFFSET_WC	1
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  897> /** Use Write=
-Back caching. */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  898> #define I915_=
MMAP_OFFSET_WB	2
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  899> /** Do not us=
e caching when binding this mmap. */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  900> #define I915_=
MMAP_OFFSET_UC	3
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  901> /** Use the T=
TM binding, which determines the appropriate caching mode. */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  902> #define I915_=
MMAP_OFFSET_TTM	4
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  903> =

   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  904> 	/**
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  905> 	 * @extensio=
ns: Zero-terminated chain of extensions.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1057< /**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h': 1134> /*
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1062< /**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h': 1139> /*
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1303< 	 * I915_CONT=
EXT_SET_ENGINES parameter and via perf, i.e.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h': 1380> 	 * I915_CONT=
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
s from latest version@'include/uapi/drm/i915_drm.h': 1382> 	 * Some hard=
ware may have parallel execution engines, e.g. multiple
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1383> 	 * media eng=
ines, which are mapped to the same class identifier and so
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1384> 	 * are not s=
eparately reported for busyness.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1670> /* I915_CONTE=
XT_PARAM_NO_ZEROMAP has been removed.  On the off chance
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1671>  * someone so=
mewhere has attempted to use it, never re-use this context
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1672>  * param numb=
er.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1673>  */
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
s from latest version@'include/uapi/drm/i915_drm.h': 1758> /* This API h=
as been removed.  On the off chance someone somewhere has
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1759>  * attempted =
to use it, never re-use this context param number.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1703< /**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h': 1767> /*
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1826> /**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1827>  * DOC: Virtu=
al Engine uAPI
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1828>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1829>  * Virtual en=
gine is a concept where userspace is able to configure a set of
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1830>  * physical e=
ngines, submit a batch buffer, and let the driver execute it on any
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1831>  * engine fro=
m the set as it sees fit.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1832>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1833>  * This is pr=
imarily useful on parts which have multiple instances of a same
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1834>  * class engi=
ne, like for example GT3+ Skylake parts with their two VCS engines.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1835>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1836>  * For instan=
ce userspace can enumerate all engines of a certain class using the
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1837>  * previously=
 described `Engine Discovery uAPI`_. After that userspace can
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1838>  * create a G=
EM context with a placeholder slot for the virtual engine (using
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1839>  * `I915_ENGI=
NE_CLASS_INVALID` and `I915_ENGINE_CLASS_INVALID_NONE` for class
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1840>  * and instan=
ce respectively) and finally using the
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1841>  * `I915_CONT=
EXT_ENGINES_EXT_LOAD_BALANCE` extension place a virtual engine in
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1842>  * the same r=
eserved slot.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1843>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1844>  * Example of=
 creating a virtual engine and submitting a batch buffer to it:
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1845>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1846>  * .. code-bl=
ock:: C
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1847>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1848>  * 	I915_DEFI=
NE_CONTEXT_ENGINES_LOAD_BALANCE(virtual, 2) =3D {
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1849>  * 		.base.na=
me =3D I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE,
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1850>  * 		.engine_=
index =3D 0, // Place this virtual engine into engine map slot 0
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1851>  * 		.num_sib=
lings =3D 2,
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1852>  * 		.engines=
 =3D { { I915_ENGINE_CLASS_VIDEO, 0 },
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1853>  * 			     { =
I915_ENGINE_CLASS_VIDEO, 1 }, },
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1854>  * 	};
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1855>  * 	I915_DEFI=
NE_CONTEXT_PARAM_ENGINES(engines, 1) =3D {
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1856>  * 		.engines=
 =3D { { I915_ENGINE_CLASS_INVALID,
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1857>  * 			       =
I915_ENGINE_CLASS_INVALID_NONE } },
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1858>  * 		.extensi=
ons =3D to_user_pointer(&virtual), // Chains after load_balance extension
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1859>  * 	};
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1860>  * 	struct dr=
m_i915_gem_context_create_ext_setparam p_engines =3D {
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1861>  * 		.base =
=3D {
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1862>  * 			.name =
=3D I915_CONTEXT_CREATE_EXT_SETPARAM,
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1863>  * 		},
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1864>  * 		.param =
=3D {
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1865>  * 			.param =
=3D I915_CONTEXT_PARAM_ENGINES,
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1866>  * 			.value =
=3D to_user_pointer(&engines),
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1867>  * 			.size =
=3D sizeof(engines),
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1868>  * 		},
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1869>  * 	};
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1870>  * 	struct dr=
m_i915_gem_context_create_ext create =3D {
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1871>  * 		.flags =
=3D I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS,
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1872>  * 		.extensi=
ons =3D to_user_pointer(&p_engines);
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1873>  * 	};
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1874>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1875>  * 	ctx_id =
=3D gem_context_create_ext(drm_fd, &create);
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1876>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1877>  * 	// Now we=
 have created a GEM context with its engine map containing a
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1878>  * 	// single=
 virtual engine. Submissions to this slot can go either to
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1879>  * 	// vcs0 o=
r vcs1, depending on the load balancing algorithm used inside
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1880>  * 	// the dr=
iver. The load balancing is dynamic from one batch buffer to
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1881>  * 	// anothe=
r and transparent to userspace.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1882>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1883>  * 	...
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1884>  * 	execbuf.r=
svd1 =3D ctx_id;
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1885>  * 	execbuf.f=
lags =3D 0; // Submits to index 0 which is the virtual engine
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1886>  * 	gem_execb=
uf(drm_fd, &execbuf);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0969526331800888952==--

