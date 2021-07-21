Content-Type: multipart/mixed; boundary="===============1753519230336006072=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-drm-intel:drm-intel-gt-next 1/1] Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differs from latest version at 'include/uapi/drm/i915_drm.h': 886> * type. On devices without local memory, this caching mode is invalid.
Date: Thu, 22 Jul 2021 01:36:04 +0800
Message-ID: <202107220157.AfPZtVNu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1753519230336006072==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Matthew Auld <matthew.auld@intel.com>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Jason Ekstrand <jason@jlekstrand.net>

tree:   git://anongit.freedesktop.org/drm/drm-intel drm-intel-gt-next
head:   7961c5b60f23dff5d82a523f9aeb8ebf34cf9926
commit: 7961c5b60f23dff5d82a523f9aeb8ebf34cf9926 [1/1] drm/i915: Add TTM of=
fset argument to mmap.
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
compiler: gcc-10 (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  852> /**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  853>  * struct drm=
_i915_gem_mmap_offset - Retrieve an offset so we can mmap this buffer objec=
t.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  854>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  855>  * This struc=
t is passed as argument to the `DRM_IOCTL_I915_GEM_MMAP_OFFSET` ioctl,
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  856>  * and is use=
d to retrieve the fake offset to mmap an object specified by &handle.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  857>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  858>  * The legacy=
 way of using `DRM_IOCTL_I915_GEM_MMAP` is removed on gen12+.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  859>  * `DRM_IOCTL=
_I915_GEM_MMAP_GTT` is an older supported alias to this struct, but will be=
have
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  860>  * as setting=
 the &extensions to 0, and &flags to `I915_MMAP_OFFSET_GTT`.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  861>  */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  853< 	/** Handle f=
or the object being mapped. */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h':  863> 	/** @handle:=
 Handle for the object being mapped. */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  865> 	/** @pad: Mu=
st be zero */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  857< 	 * Fake offs=
et to use for subsequent mmap call
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h':  868> 	 * @offset: =
The fake offset to use for subsequent mmap call
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  864< 	 * Flags for=
 extended behaviour.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h':  875> 	 * @flags: F=
lags for extended behaviour.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  876> 	 *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  877> 	 * It is man=
datory that one of the `MMAP_OFFSET` types
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  878> 	 * should be=
 included:
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  866< 	 * It is man=
datory that one of the MMAP_OFFSET types
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  867< 	 * (GTT, WC,=
 WB, UC, etc) should be included.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h':  880> 	 * - `I915_M=
MAP_OFFSET_GTT`: Use mmap with the object bound to GTT. (Write-Combined)
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  881> 	 * - `I915_M=
MAP_OFFSET_WC`: Use Write-Combined caching.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  882> 	 * - `I915_M=
MAP_OFFSET_WB`: Use Write-Back caching.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  883> 	 * - `I915_M=
MAP_OFFSET_FIXED`: Use object placement to determine caching.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  884> 	 *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  885> 	 * On device=
s with local memory `I915_MMAP_OFFSET_FIXED` is the only valid
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  886> 	 * type. On =
devices without local memory, this caching mode is invalid.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  887> 	 *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  888> 	 * As cachin=
g mode when specifying `I915_MMAP_OFFSET_FIXED`, WC or WB will
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  889> 	 * be used, =
depending on the object placement on creation. WB will be used
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  890> 	 * when the =
object can only exist in system memory, WC otherwise.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  870< #define I915_=
MMAP_OFFSET_GTT 0
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  871< #define I915_=
MMAP_OFFSET_WC  1
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  872< #define I915_=
MMAP_OFFSET_WB  2
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  873< #define I915_=
MMAP_OFFSET_UC  3
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  875< 	/*
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  876< 	 * Zero-term=
inated chain of extensions.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h':  894> #define I915_=
MMAP_OFFSET_GTT	0
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  895> #define I915_=
MMAP_OFFSET_WC	1
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  896> #define I915_=
MMAP_OFFSET_WB	2
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  897> #define I915_=
MMAP_OFFSET_UC	3
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  898> #define I915_=
MMAP_OFFSET_FIXED	4
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  899> =

   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  900> 	/**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  901> 	 * @extensio=
ns: Zero-terminated chain of extensions.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  908> /**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  909>  * struct drm=
_i915_gem_set_domain - Adjust the objects write or read domain, in
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  910>  * preparatio=
n for accessing the pages via some CPU domain.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  911>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  912>  * Specifying=
 a new write or read domain will flush the object out of the
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  913>  * previous d=
omain(if required), before then updating the objects domain
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  914>  * tracking w=
ith the new domain.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  915>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  916>  * Note this =
might involve waiting for the object first if it is still active on
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  917>  * the GPU.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  918>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  919>  * Supported =
values for @read_domains and @write_domain:
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  920>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  921>  *	- I915_GEM=
_DOMAIN_WC: Uncached write-combined domain
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  922>  *	- I915_GEM=
_DOMAIN_CPU: CPU cache domain
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  923>  *	- I915_GEM=
_DOMAIN_GTT: Mappable aperture domain
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  924>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  925>  * All other =
domains are rejected.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  926>  */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  884< 	/** Handle f=
or the object */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h':  928> 	/** @handle:=
 Handle for the object. */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  887< 	/** New read=
 domains */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h':  931> 	/** @read_do=
mains: New read domains. */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  890< 	/** New writ=
e domain */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h':  934> 	/**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  935> 	 * @write_do=
main: New write domain.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  936> 	 *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  937> 	 * Note that=
 having something in the write domain implies it's in the
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  938> 	 * read doma=
in, and only that read domain.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h':  939> 	 */
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1351< 	 * I915_CONT=
EXT_SET_ENGINES parameter and via perf, i.e.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h': 1400> 	 * I915_CONT=
EXT_PARAM_ENGINES context parameter and via perf, i.e.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1353< 	 * reported =
as active itself. Some hardware may have parallel
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1354< 	 * execution=
 engines, e.g. multiple media engines, which are
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1355< 	 * mapped to=
 the same class identifier and so are not separately
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1356< 	 * reported =
for busyness.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h': 1402> 	 * Some hard=
ware may have parallel execution engines, e.g. multiple
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1403> 	 * media eng=
ines, which are mapped to the same class identifier and so
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1404> 	 * are not s=
eparately reported for busyness.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1367<  * I915_CACHI=
NG_NONE
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h': 1415>  * struct drm=
_i915_gem_caching - Set or get the caching for given object
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1416>  * handle.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1369<  * GPU access=
 is not coherent with cpu caches. Default for machines without an
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1370<  * LLC.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h': 1418>  * Allow user=
space to control the GTT caching bits for a given object when the
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1419>  * object is =
later mapped through the ppGTT(or GGTT on older platforms lacking
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1420>  * ppGTT supp=
ort, or if the object is used for scanout). Note that this might
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1421>  * require un=
binding the object from the GTT first, if its current caching value
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1422>  * doesn't ma=
tch.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1423>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1424>  * Note that =
this all changes on discrete platforms, starting from DG1, the
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1425>  * set/get ca=
ching is no longer supported, and is now rejected.  Instead the CPU
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1426>  * caching at=
tributes(WB vs WC) will become an immutable creation time property
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1427>  * for the ob=
ject, along with the GTT caching level. For now we don't expose any
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1428>  * new uAPI f=
or this, instead on DG1 this is all implicit, although this largely
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1429>  * shouldn't =
matter since DG1 is coherent by default(without any way of
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1430>  * controllin=
g it).
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1431>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1432>  * Implicit c=
aching rules, starting from DG1:
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1433>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1434>  *     - If a=
ny of the object placements (see &drm_i915_gem_create_ext_memory_regions)
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1435>  *       cont=
ain I915_MEMORY_CLASS_DEVICE then the object will be allocated and
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1436>  *       mapp=
ed as write-combined only.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1437>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1438>  *     - Ever=
ything else is always allocated and mapped as write-back, with the
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1439>  *       guar=
antee that everything is also coherent with the GPU.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1440>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1441>  * Note that =
this is likely to change in the future again, where we might need
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1442>  * more flexi=
bility on future devices, so making this all explicit as part of a
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1443>  * new &drm_i=
915_gem_create_ext extension is probable.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1444>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1445>  * Side note:=
 Part of the reason for this is that changing the at-allocation-time CPU
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1446>  * caching at=
tributes for the pages might be required(and is expensive) if we
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1447>  * need to th=
en CPU map the pages later with different caching attributes. This
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1448>  * inconsiste=
nt caching behaviour, while supported on x86, is not universally
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1449>  * supported =
on other architectures. So for simplicity we opt for setting
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1450>  * everything=
 at creation time, whilst also making it immutable, on discrete
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1451>  * platforms.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1372< #define I915_=
CACHING_NONE		0
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1373< /**
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version at 'include/uapi/drm/i915_drm.h': 1374<  * I915_CACHI=
NG_CACHED
   Warning: Kernel ABI header at 'tools/include/uapi/drm/i915_drm.h' differ=
s from latest version@'include/uapi/drm/i915_drm.h': 1375<  *

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============1753519230336006072==--

