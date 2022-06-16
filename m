Content-Type: multipart/mixed; boundary="===============2156753902241515919=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/base/regmap/regmap.c:1966:19: warning: Redundant condition: !map->bus. 'map->bus || (!map->bus && map->read)' is equivalent to 'map->bus || map->read' [redundantCondition]
Date: Thu, 16 Jun 2022 18:40:02 +0800
Message-ID: <202206161821.V5Bvhl81-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2156753902241515919==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/b=
ase/regmap/regmap.c:1966:19: warning: Redundant condition: !map->bus. 'map-=
>bus || (!map->bus && map->read)' is equivalent to 'map->bus || map->read' =
[redundantCondition]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Marek Vasut <marex@denx.de>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   30306f6194cadcc29c77f6ddcd416a75bf5c0232
commit: d77e745613680c54708470402e2b623dcd769681 regmap: Add bulk read/writ=
e callbacks into regmap_config
date:   6 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 6 weeks ago
compiler: hppa-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout d77e745613680c54708470402e2b623dcd769681
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_modes.c:1833:16: warning: Local variable 'len' shado=
ws outer variable [shadowVariable]
     unsigned int len =3D strlen(mode_option);
                  ^
   drivers/gpu/drm/drm_modes.c:1769:9: note: Shadowed declaration
    int i, len, ret;
           ^
   drivers/gpu/drm/drm_modes.c:1833:16: note: Shadow variable
     unsigned int len =3D strlen(mode_option);
                  ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/drm_of.c:30:28: warning: Parameter 'port' can be declare=
d with const [constParameter]
          struct device_node *port)
                              ^
--
>> drivers/gpu/drm/drm_gem_framebuffer_helper.c:67:28: warning: Parameter '=
obj' can be declared with const [constParameter]
      struct drm_gem_object **obj, unsigned int num_planes,
                              ^
--
>> drivers/base/regmap/regmap.c:1966:19: warning: Redundant condition: !map=
->bus. 'map->bus || (!map->bus && map->read)' is equivalent to 'map->bus ||=
 map->read' [redundantCondition]
    return (map->bus || (!map->bus && map->read)) ? map : map->bus_context;
                     ^
   drivers/base/regmap/regmap.c:1838:7: warning: Redundant initialization f=
or 'ret'. The initialized value is overwritten before it is read. [redundan=
tInitialization]
     ret =3D map->write(map->bus_context, map->work_buf,
         ^
   drivers/base/regmap/regmap.c:1685:10: note: ret is initialized
    int ret =3D -ENOTSUPP;
            ^
   drivers/base/regmap/regmap.c:1838:7: note: ret is overwritten
     ret =3D map->write(map->bus_context, map->work_buf,
         ^

vim +1966 drivers/base/regmap/regmap.c

07c320dc31d757 Andrey Smirnov 2013-01-12  1963  =

d2a5884a64161b Andrey Smirnov 2013-01-27  1964  static inline void *_regmap=
_map_get_context(struct regmap *map)
d2a5884a64161b Andrey Smirnov 2013-01-27  1965  {
d77e745613680c Marek Vasut    2022-04-30 @1966  	return (map->bus || (!map-=
>bus && map->read)) ? map : map->bus_context;
d2a5884a64161b Andrey Smirnov 2013-01-27  1967  }
d2a5884a64161b Andrey Smirnov 2013-01-27  1968  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2156753902241515919==--

