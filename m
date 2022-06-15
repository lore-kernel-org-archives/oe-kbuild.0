Content-Type: multipart/mixed; boundary="===============1902619401516913423=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/drm_edid.c:2124:9: warning: Local variable 'block' shadows outer argument [shadowArgument]
Date: Wed, 15 Jun 2022 18:33:04 +0800
Message-ID: <202206151813.cfX3lzX2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1902619401516913423==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/g=
pu/drm/drm_edid.c:2124:9: warning: Local variable 'block' shadows outer arg=
ument [shadowArgument]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jani Nikula <jani.nikula@intel.com>
CC: "Ville Syrj=C3=A4l=C3=A4" <ville.syrjala@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   018ab4fabddd94f1c96f3b59e180691b9e88d5d8
commit: 89fb7536ad2fdcdaf95eee44b9e162d0522f48dc drm/edid: add typedef for =
block read function
date:   9 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 9 weeks ago
compiler: hppa-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 89fb7536ad2fdcdaf95eee44b9e162d0522f48dc
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> drivers/nvme/host/pci.c:2075:10: warning: Local variable 'size' shadows =
outer variable [shadowVariable]
     size_t size =3D le32_to_cpu(descs[i].size) * NVME_CTRL_PAGE_SIZE;
            ^
   drivers/nvme/host/pci.c:2031:6: note: Shadowed declaration
    u64 size, tmp;
        ^
   drivers/nvme/host/pci.c:2075:10: note: Shadow variable
     size_t size =3D le32_to_cpu(descs[i].size) * NVME_CTRL_PAGE_SIZE;
            ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/pci/pci-sysfs.c:1272:47: warning: Parameter 'buf' can be declare=
d with const [constParameter]
           struct bin_attribute *bin_attr, char *buf,
                                                 ^
>> drivers/gpu/drm/ttm/ttm_bo.c:1098:28: warning: Local variable 'ctx' shad=
ows outer argument [shadowArgument]
     struct ttm_operation_ctx ctx =3D { false, false };
                              ^
   drivers/gpu/drm/ttm/ttm_bo.c:1058:76: note: Shadowed declaration
   int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ct=
x *ctx,
                                                                           =
   ^
   drivers/gpu/drm/ttm/ttm_bo.c:1098:28: note: Shadow variable
     struct ttm_operation_ctx ctx =3D { false, false };
                              ^
--
>> drivers/gpu/drm/drm_edid.c:2124:9: warning: Local variable 'block' shado=
ws outer argument [shadowArgument]
     void *block =3D edid + j;
           ^
   drivers/gpu/drm/drm_edid.c:2101:0: note: Shadowed declaration
           read_block_fn read_block,
   ^
   drivers/gpu/drm/drm_edid.c:2124:9: note: Shadow variable
     void *block =3D edid + j;
           ^

vim +/block +2124 drivers/gpu/drm/drm_edid.c

bac9c29482248b0 Douglas Anderson   2021-09-14  2079  =

18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2080  /**
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2081   * drm_do_get_edid - g=
et EDID data using a custom EDID block read function
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2082   * @connector: connect=
or we're probing
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2083   * @get_edid_block: ED=
ID block read function
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2084   * @data: private data=
 passed to the block read function
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2085   *
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2086   * When the I2C adapte=
r connected to the DDC bus is hidden behind a device that
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2087   * exposes a different=
 interface to read EDID blocks this function can be used
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2088   * to get EDID data us=
ing a custom block read function.
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2089   *
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2090   * As in the general c=
ase the DDC bus is accessible by the kernel at the I2C
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2091   * level, drivers must=
 make all reasonable efforts to expose it as an I2C
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2092   * adapter and use drm=
_get_edid() instead of abusing this function.
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2093   *
0ae865ef92f1920 Cai Huoqing        2021-07-30  2094   * The EDID may be ove=
rridden using debugfs override_edid or firmware EDID
53fd40a90f3c0bd Jani Nikula        2017-09-12  2095   * (drm_load_edid_firm=
ware() and drm.edid_firmware parameter), in this priority
53fd40a90f3c0bd Jani Nikula        2017-09-12  2096   * order. Having eithe=
r of them bypasses actual EDID reads.
53fd40a90f3c0bd Jani Nikula        2017-09-12  2097   *
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2098   * Return: Pointer to =
valid EDID or NULL if we couldn't find any.
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2099   */
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2100  struct edid *drm_do_ge=
t_edid(struct drm_connector *connector,
89fb7536ad2fdcd Jani Nikula        2022-04-11  2101  			     read_block_fn =
read_block,
89fb7536ad2fdcd Jani Nikula        2022-04-11  2102  			     void *context)
61e57a8d72f2336 Adam Jackson       2010-03-29  2103  {
ccc97def44ecc08 Jani Nikula        2022-03-31  2104  	int j, invalid_blocks=
 =3D 0;
e9a9e0768ba49d9 Jani Nikula        2022-03-31  2105  	struct edid *edid, *n=
ew, *override;
53fd40a90f3c0bd Jani Nikula        2017-09-12  2106  =

56a2b7f2a39a8d4 Jani Nikula        2019-06-07  2107  	override =3D drm_get_=
override_edid(connector);
56a2b7f2a39a8d4 Jani Nikula        2019-06-07  2108  	if (override)
53fd40a90f3c0bd Jani Nikula        2017-09-12  2109  		return override;
61e57a8d72f2336 Adam Jackson       2010-03-29  2110  =

89fb7536ad2fdcd Jani Nikula        2022-04-11  2111  	edid =3D drm_do_get_e=
did_base_block(connector, read_block, context);
e7bd95a7ed4e4c8 Douglas Anderson   2021-10-04  2112  	if (!edid)
61e57a8d72f2336 Adam Jackson       2010-03-29  2113  		return NULL;
61e57a8d72f2336 Adam Jackson       2010-03-29  2114  =

ccc97def44ecc08 Jani Nikula        2022-03-31  2115  	if (edid->extensions =
=3D=3D 0)
e9a9e0768ba49d9 Jani Nikula        2022-03-31  2116  		return edid;
61e57a8d72f2336 Adam Jackson       2010-03-29  2117  =

ccc97def44ecc08 Jani Nikula        2022-03-31  2118  	new =3D krealloc(edid=
, (edid->extensions + 1) * EDID_LENGTH, GFP_KERNEL);
61e57a8d72f2336 Adam Jackson       2010-03-29  2119  	if (!new)
61e57a8d72f2336 Adam Jackson       2010-03-29  2120  		goto out;
f14f368670541bf Chris Wilson       2016-10-17  2121  	edid =3D new;
61e57a8d72f2336 Adam Jackson       2010-03-29  2122  =

e9a9e0768ba49d9 Jani Nikula        2022-03-31  2123  	for (j =3D 1; j <=3D =
edid->extensions; j++) {
e9a9e0768ba49d9 Jani Nikula        2022-03-31 @2124  		void *block =3D edid=
 + j;
18d83450468ca57 Jani Nikula        2022-03-31  2125  		int try;
a28187ccab9410c Chris Wilson       2016-10-17  2126  =

18d83450468ca57 Jani Nikula        2022-03-31  2127  		for (try =3D 0; try =
< 4; try++) {
89fb7536ad2fdcd Jani Nikula        2022-04-11  2128  			if (read_block(cont=
ext, block, j, EDID_LENGTH))
61e57a8d72f2336 Adam Jackson       2010-03-29  2129  				goto out;
14544d0937bf016 Chris Wilson       2016-10-24  2130  			if (drm_edid_block_=
valid(block, j, false, NULL))
61e57a8d72f2336 Adam Jackson       2010-03-29  2131  				break;
61e57a8d72f2336 Adam Jackson       2010-03-29  2132  		}
f934ec8c34b9dce Maarten Lankhorst  2013-01-29  2133  =

18d83450468ca57 Jani Nikula        2022-03-31  2134  		if (try =3D=3D 4)
ccc97def44ecc08 Jani Nikula        2022-03-31  2135  			invalid_blocks++;
0ea75e23356f73b Sam Tygier         2010-09-23  2136  	}
0ea75e23356f73b Sam Tygier         2010-09-23  2137  =

ccc97def44ecc08 Jani Nikula        2022-03-31  2138  	if (invalid_blocks) {
63cae081538de1b Jani Nikula        2022-04-11  2139  		connector_bad_edid(c=
onnector, edid, edid->extensions + 1);
14544d0937bf016 Chris Wilson       2016-10-24  2140  =

ccc97def44ecc08 Jani Nikula        2022-03-31  2141  		edid =3D edid_filter=
_invalid_blocks(edid, invalid_blocks);
61e57a8d72f2336 Adam Jackson       2010-03-29  2142  	}
61e57a8d72f2336 Adam Jackson       2010-03-29  2143  =

e9a9e0768ba49d9 Jani Nikula        2022-03-31  2144  	return edid;
61e57a8d72f2336 Adam Jackson       2010-03-29  2145  =

61e57a8d72f2336 Adam Jackson       2010-03-29  2146  out:
f14f368670541bf Chris Wilson       2016-10-17  2147  	kfree(edid);
61e57a8d72f2336 Adam Jackson       2010-03-29  2148  	return NULL;
61e57a8d72f2336 Adam Jackson       2010-03-29  2149  }
18df89fef2d5c7c Lars-Peter Clausen 2012-04-27  2150  EXPORT_SYMBOL_GPL(drm_=
do_get_edid);
61e57a8d72f2336 Adam Jackson       2010-03-29  2151  =


:::::: The code at line 2124 was first introduced by commit
:::::: e9a9e0768ba49d9cad3b698860af1842c53c717f drm/edid: use struct edid *=
 in drm_do_get_edid()

:::::: TO: Jani Nikula <jani.nikula@intel.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1902619401516913423==--

