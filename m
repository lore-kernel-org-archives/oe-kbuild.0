Content-Type: multipart/mixed; boundary="===============3735935681175897509=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Add TTM offset argument to mmap.
Date: Thu, 01 Jul 2021 21:25:49 +0800
Message-ID: <202107012104.0kdBQPjs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3735935681175897509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210701114234.3859716-1-maarten.lankhorst@linux.intel.com>
References: <20210701114234.3859716-1-maarten.lankhorst@linux.intel.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: intel-gfx(a)lists.freedesktop.org

Hi Maarten,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[cannot apply to drm-intel/for-linux-next v5.13 next-20210701]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Maarten-Lankhorst/drm-i915=
-Add-TTM-offset-argument-to-mmap/20210701-194501
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
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
s from latest version@'include/uapi/drm/i915_drm.h':  870> #define I915_=
MMAP_OFFSET_GTT	0
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  871> #define I915_=
MMAP_OFFSET_WC	1
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  872> #define I915_=
MMAP_OFFSET_WB	2
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  873> #define I915_=
MMAP_OFFSET_UC	3
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  874> #define I915_=
MMAP_OFFSET_TTM	4
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1057< /**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h': 1106> /*
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1062< /**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h': 1111> /*
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1303< 	 * I915_CONT=
EXT_SET_ENGINES parameter and via perf, i.e.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h': 1352> 	 * I915_CONT=
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
s from latest version@'include/uapi/drm/i915_drm.h': 1354> 	 * Some hard=
ware may have parallel execution engines, e.g. multiple
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1355> 	 * media eng=
ines, which are mapped to the same class identifier and so
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1356> 	 * are not s=
eparately reported for busyness.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1703< /**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h': 1751> /*
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1810> /**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1811>  * DOC: Virtu=
al Engine uAPI
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1812>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1813>  * Virtual en=
gine is a concept where userspace is able to configure a set of
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1814>  * physical e=
ngines, submit a batch buffer, and let the driver execute it on any
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1815>  * engine fro=
m the set as it sees fit.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1816>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1817>  * This is pr=
imarily useful on parts which have multiple instances of a same
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1818>  * class engi=
ne, like for example GT3+ Skylake parts with their two VCS engines.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1819>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1820>  * For instan=
ce userspace can enumerate all engines of a certain class using the
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1821>  * previously=
 described `Engine Discovery uAPI`_. After that userspace can
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1822>  * create a G=
EM context with a placeholder slot for the virtual engine (using
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1823>  * `I915_ENGI=
NE_CLASS_INVALID` and `I915_ENGINE_CLASS_INVALID_NONE` for class
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1824>  * and instan=
ce respectively) and finally using the
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1825>  * `I915_CONT=
EXT_ENGINES_EXT_LOAD_BALANCE` extension place a virtual engine in
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1826>  * the same r=
eserved slot.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1827>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1828>  * Example of=
 creating a virtual engine and submitting a batch buffer to it:
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1829>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1830>  * .. code-bl=
ock:: C
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1831>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1832>  * 	I915_DEFI=
NE_CONTEXT_ENGINES_LOAD_BALANCE(virtual, 2) =3D {
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1833>  * 		.base.na=
me =3D I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE,
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1834>  * 		.engine_=
index =3D 0, // Place this virtual engine into engine map slot 0
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1835>  * 		.num_sib=
lings =3D 2,
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1836>  * 		.engines=
 =3D { { I915_ENGINE_CLASS_VIDEO, 0 },
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1837>  * 			     { =
I915_ENGINE_CLASS_VIDEO, 1 }, },
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1838>  * 	};
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1839>  * 	I915_DEFI=
NE_CONTEXT_PARAM_ENGINES(engines, 1) =3D {
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1840>  * 		.engines=
 =3D { { I915_ENGINE_CLASS_INVALID,
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1841>  * 			       =
I915_ENGINE_CLASS_INVALID_NONE } },
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1842>  * 		.extensi=
ons =3D to_user_pointer(&virtual), // Chains after load_balance extension
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1843>  * 	};
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1844>  * 	struct dr=
m_i915_gem_context_create_ext_setparam p_engines =3D {
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1845>  * 		.base =
=3D {
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1846>  * 			.name =
=3D I915_CONTEXT_CREATE_EXT_SETPARAM,
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1847>  * 		},
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1848>  * 		.param =
=3D {
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1849>  * 			.param =
=3D I915_CONTEXT_PARAM_ENGINES,
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1850>  * 			.value =
=3D to_user_pointer(&engines),
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1851>  * 			.size =
=3D sizeof(engines),
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1852>  * 		},
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1853>  * 	};
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1854>  * 	struct dr=
m_i915_gem_context_create_ext create =3D {
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1855>  * 		.flags =
=3D I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS,
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1856>  * 		.extensi=
ons =3D to_user_pointer(&p_engines);
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1857>  * 	};
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1858>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1859>  * 	ctx_id =
=3D gem_context_create_ext(drm_fd, &create);
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1860>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1861>  * 	// Now we=
 have created a GEM context with its engine map containing a
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1862>  * 	// single=
 virtual engine. Submissions to this slot can go either to
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1863>  * 	// vcs0 o=
r vcs1, depending on the load balancing algorithm used inside
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1864>  * 	// the dr=
iver. The load balancing is dynamic from one batch buffer to
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1865>  * 	// anothe=
r and transparent to userspace.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1866>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1867>  * 	...
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1868>  * 	execbuf.r=
svd1 =3D ctx_id;
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1869>  * 	execbuf.f=
lags =3D 0; // Submits to index 0 which is the virtual engine
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1870>  * 	gem_execb=
uf(drm_fd, &execbuf);
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1871>  */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1872> =

   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1949> /**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1950>  * DOC: Conte=
xt Engine Map uAPI
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1951>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1952>  * Context en=
gine map is a new way of addressing engines when submitting batch-
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1953>  * buffers, r=
eplacing the existing way of using identifiers like `I915_EXEC_BLT`
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1954>  * inside the=
 flags field of `struct drm_i915_gem_execbuffer2`.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1955>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1956>  * To use it =
created GEM contexts need to be configured with a list of engines
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1957>  * the user i=
s intending to submit to. This is accomplished using the
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1958>  * `I915_CONT=
EXT_PARAM_ENGINES` parameter and `struct
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1959>  * i915_conte=
xt_param_engines`.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1960>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1961>  * For such c=
ontexts the `I915_EXEC_RING_MASK` field becomes an index into the
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1962>  * configured=
 map.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1963>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1964>  * Example of=
 creating such context and submitting against it:
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1965>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1966>  * .. code-bl=
ock:: C
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1967>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1968>  * 	I915_DEFI=
NE_CONTEXT_PARAM_ENGINES(engines, 2) =3D {
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1969>  * 		.engines=
 =3D { { I915_ENGINE_CLASS_RENDER, 0 },
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1970>  * 			     { =
I915_ENGINE_CLASS_COPY, 0 } }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3735935681175897509==--

