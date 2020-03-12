Content-Type: multipart/mixed; boundary="===============5595373149777938148=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Intel-gfx] [PATCH v4 1/3] drm/i915/perf: remove generated code
Date: Thu, 12 Mar 2020 16:51:24 +0300
Message-ID: <20200312135124.GK11561@kadam>
In-Reply-To: <20200306100557.2077450-1-lionel.g.landwerlin@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5595373149777938148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Lionel,

Thank you for the patch! Perhaps something to improve:

url:    https://github.com/0day-ci/linux/commits/Lionel-Landwerlin/drm-i915=
-perf-remove-generated-code/20200307-024544
base:   git://anongit.freedesktop.org/drm-intel for-linux-next

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/i915/selftests/i915_perf.c:26 alloc_empty_config() warn: re=
turning -1 instead of -ENOMEM is sloppy
drivers/gpu/drm/i915/selftests/i915_perf.c:43 alloc_empty_config() warn: in=
consistent returns 'perf->metrics_lock'.

# https://github.com/0day-ci/linux/commit/9da4da9daea4fec31c06906294a6e64e9=
bd19783
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 9da4da9daea4fec31c06906294a6e64e9bd19783
vim +26 drivers/gpu/drm/i915/selftests/i915_perf.c

9da4da9daea4fe Lionel Landwerlin 2020-03-06  19  static int
9da4da9daea4fe Lionel Landwerlin 2020-03-06  20  alloc_empty_config(struct =
i915_perf *perf)
9da4da9daea4fe Lionel Landwerlin 2020-03-06  21  {
9da4da9daea4fe Lionel Landwerlin 2020-03-06  22  	struct i915_oa_config *oa=
_config;
9da4da9daea4fe Lionel Landwerlin 2020-03-06  23  =

9da4da9daea4fe Lionel Landwerlin 2020-03-06  24  	oa_config =3D kzalloc(siz=
eof(*oa_config), GFP_KERNEL);
9da4da9daea4fe Lionel Landwerlin 2020-03-06  25  	if (!oa_config)
9da4da9daea4fe Lionel Landwerlin 2020-03-06 @26  		return -1;

return -ENOMEM

9da4da9daea4fe Lionel Landwerlin 2020-03-06  27  =

9da4da9daea4fe Lionel Landwerlin 2020-03-06  28  	oa_config->perf =3D perf;
9da4da9daea4fe Lionel Landwerlin 2020-03-06  29  	kref_init(&oa_config->ref=
);
9da4da9daea4fe Lionel Landwerlin 2020-03-06  30  =

9da4da9daea4fe Lionel Landwerlin 2020-03-06  31  	strlcpy(oa_config->uuid, =
TEST_OA_CONFIG_UUID, sizeof(oa_config->uuid));
9da4da9daea4fe Lionel Landwerlin 2020-03-06  32  =

9da4da9daea4fe Lionel Landwerlin 2020-03-06  33  	mutex_lock(&perf->metrics=
_lock);
9da4da9daea4fe Lionel Landwerlin 2020-03-06  34  =

9da4da9daea4fe Lionel Landwerlin 2020-03-06  35  	oa_config->id =3D idr_all=
oc(&perf->metrics_idr, oa_config, 2, 0, GFP_KERNEL);
9da4da9daea4fe Lionel Landwerlin 2020-03-06  36  	if (oa_config->id < 0)  {
9da4da9daea4fe Lionel Landwerlin 2020-03-06  37  		i915_oa_config_put(oa_co=
nfig);

unlock

9da4da9daea4fe Lionel Landwerlin 2020-03-06  38  		return -1;

return oa_config->id;

9da4da9daea4fe Lionel Landwerlin 2020-03-06  39  	}
9da4da9daea4fe Lionel Landwerlin 2020-03-06  40  =

9da4da9daea4fe Lionel Landwerlin 2020-03-06  41  	mutex_unlock(&perf->metri=
cs_lock);
9da4da9daea4fe Lionel Landwerlin 2020-03-06  42  =

9da4da9daea4fe Lionel Landwerlin 2020-03-06 @43  	return 0;
9da4da9daea4fe Lionel Landwerlin 2020-03-06  44  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5595373149777938148==--

