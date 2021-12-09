Content-Type: multipart/mixed; boundary="===============3096696322724236241=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/intel_region_ttm.c:176 intel_region_ttm_resource_alloc() error: uninitialized symbol 'res'.
Date: Fri, 10 Dec 2021 04:13:21 +0800
Message-ID: <202112100405.qXe0l7eT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3096696322724236241==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Matthew Auld <matthew.auld@intel.com>
CC: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2a987e65025e2b79c6d453b78cb5985ac6e5eb26
commit: a6c5b891252143ee9bc02f649282905954d6705c drm/i915/ttm: remove unuse=
d function
date:   6 months ago
:::::: branch date: 2 days ago
:::::: commit date: 6 months ago
config: i386-randconfig-m021-20211207 (https://download.01.org/0day-ci/arch=
ive/20211210/202112100405.qXe0l7eT-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/i915/intel_region_ttm.c:176 intel_region_ttm_resource_alloc=
() error: uninitialized symbol 'res'.

vim +/res +176 drivers/gpu/drm/i915/intel_region_ttm.c

d148738923fdb50 Thomas Hellstr=C3=B6m 2021-06-02  141  =

213d5092776345a Thomas Hellstr=C3=B6m 2021-06-10  142  #ifdef CONFIG_DRM_I9=
15_SELFTEST
d148738923fdb50 Thomas Hellstr=C3=B6m 2021-06-02  143  /**
a6c5b891252143e Matthew Auld     2021-06-17  144   * intel_region_ttm_resou=
rce_alloc - Allocate memory resources from a region
d148738923fdb50 Thomas Hellstr=C3=B6m 2021-06-02  145   * @mem: The memory =
region,
d148738923fdb50 Thomas Hellstr=C3=B6m 2021-06-02  146   * @size: The reques=
ted size in bytes
d148738923fdb50 Thomas Hellstr=C3=B6m 2021-06-02  147   * @flags: Allocatio=
n flags
d148738923fdb50 Thomas Hellstr=C3=B6m 2021-06-02  148   *
d148738923fdb50 Thomas Hellstr=C3=B6m 2021-06-02  149   * This functionalit=
y is provided only for callers that need to allocate
d148738923fdb50 Thomas Hellstr=C3=B6m 2021-06-02  150   * memory from stand=
alone TTM range managers, without the TTM eviction
d148738923fdb50 Thomas Hellstr=C3=B6m 2021-06-02  151   * functionality. Do=
n't use if you are not completely sure that's the
d148738923fdb50 Thomas Hellstr=C3=B6m 2021-06-02  152   * case. The returne=
d opaque node can be converted to an sg_table using
a6c5b891252143e Matthew Auld     2021-06-17  153   * intel_region_ttm_resou=
rce_to_st(), and can be freed using
a6c5b891252143e Matthew Auld     2021-06-17  154   * intel_region_ttm_resou=
rce_free().
d148738923fdb50 Thomas Hellstr=C3=B6m 2021-06-02  155   *
d148738923fdb50 Thomas Hellstr=C3=B6m 2021-06-02  156   * Return: A valid p=
ointer on success, an error pointer on failure.
d148738923fdb50 Thomas Hellstr=C3=B6m 2021-06-02  157   */
2a7005c8a3982ba Dave Airlie      2021-06-11  158  struct ttm_resource *
687c7d0fcf8014a Matthew Auld     2021-06-16  159  intel_region_ttm_resource=
_alloc(struct intel_memory_region *mem,
d148738923fdb50 Thomas Hellstr=C3=B6m 2021-06-02  160  				resource_size_t =
size,
d148738923fdb50 Thomas Hellstr=C3=B6m 2021-06-02  161  				unsigned int fla=
gs)
d148738923fdb50 Thomas Hellstr=C3=B6m 2021-06-02  162  {
d148738923fdb50 Thomas Hellstr=C3=B6m 2021-06-02  163  	struct ttm_resource=
_manager *man =3D mem->region_private;
d148738923fdb50 Thomas Hellstr=C3=B6m 2021-06-02  164  	struct ttm_place pl=
ace =3D {};
d148738923fdb50 Thomas Hellstr=C3=B6m 2021-06-02  165  	struct ttm_buffer_o=
bject mock_bo =3D {};
2a7005c8a3982ba Dave Airlie      2021-06-11  166  	struct ttm_resource *res;
d148738923fdb50 Thomas Hellstr=C3=B6m 2021-06-02  167  	int ret;
d148738923fdb50 Thomas Hellstr=C3=B6m 2021-06-02  168  =

2a7005c8a3982ba Dave Airlie      2021-06-11  169  	mock_bo.base.size =3D si=
ze;
13c2ceb6addb6b1 Matthew Auld     2021-06-16  170  	mock_bo.page_alignment =
=3D mem->min_page_size >> PAGE_SHIFT;
d53ec322dc7de32 Matthew Auld     2021-06-16  171  	place.flags =3D flags;
d148738923fdb50 Thomas Hellstr=C3=B6m 2021-06-02  172  =

d148738923fdb50 Thomas Hellstr=C3=B6m 2021-06-02  173  	ret =3D man->func->=
alloc(man, &mock_bo, &place, &res);
d148738923fdb50 Thomas Hellstr=C3=B6m 2021-06-02  174  	if (ret =3D=3D -ENO=
SPC)
d148738923fdb50 Thomas Hellstr=C3=B6m 2021-06-02  175  		ret =3D -ENXIO;
2a7005c8a3982ba Dave Airlie      2021-06-11 @176  	return ret ? ERR_PTR(ret=
) : res;
d148738923fdb50 Thomas Hellstr=C3=B6m 2021-06-02  177  }
d53ec322dc7de32 Matthew Auld     2021-06-16  178  =


:::::: The code at line 176 was first introduced by commit
:::::: 2a7005c8a3982ba27fab237d85c27da446484e9c Merge tag 'drm-intel-gt-nex=
t-2021-06-10' of git://anongit.freedesktop.org/drm/drm-intel into drm-next

:::::: TO: Dave Airlie <airlied@redhat.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3096696322724236241==--

