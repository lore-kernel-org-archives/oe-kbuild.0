Content-Type: multipart/mixed; boundary="===============8652711287666481883=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [Intel-gfx] [PATCH v12 3/4] drm/i915/perf: prepare driver to receive multiple ctx handles
Date: Thu, 07 May 2020 21:01:29 +0800
Message-ID: <202005072056.kA4ZYRX9%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8652711287666481883==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200504111249.1367096-4-lionel.g.landwerlin@intel.com>
References: <20200504111249.1367096-4-lionel.g.landwerlin@intel.com>
TO: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
TO: intel-gfx(a)lists.freedesktop.org
CC: chris(a)chris-wilson.co.uk

Hi Lionel,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip next-20200507]
[cannot apply to v5.7-rc4]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Lionel-Landwerlin/drm-i915=
-perf-Add-support-for-multi-context-perf-queries/20200505-060720
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/i915/i915_perf.c:1457 i915_oa_stream_destroy() error: unini=
tialized symbol 'err'.

Old smatch warnings:
drivers/gpu/drm/i915/i915_perf.c:1383 oa_get_render_ctx_ids() error: double=
 unlocked 'ctx->engines_mutex' (orig line 1351)
drivers/gpu/drm/i915/i915_perf.c:3044 i915_oa_stream_init() error: uninitia=
lized symbol 'timeline'.
drivers/gpu/drm/i915/i915_perf.c:3664 i915_perf_open_ioctl_locked() error: =
uninitialized symbol 'ret'.

# https://github.com/0day-ci/linux/commit/dc9d77b54dfbfd0de4e30e59d29d5216b=
80a51b2
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout dc9d77b54dfbfd0de4e30e59d29d5216b80a51b2
vim +/err +1457 drivers/gpu/drm/i915/i915_perf.c

307ca63ef54097 Lionel Landwerlin     2020-05-04  1441  =

d79651522e89c4 Robert Bragg          2016-11-07  1442  static void i915_oa_=
stream_destroy(struct i915_perf_stream *stream)
d79651522e89c4 Robert Bragg          2016-11-07  1443  {
8f8b1171e1a514 Chris Wilson          2019-10-07  1444  	struct i915_perf *p=
erf =3D stream->perf;
307ca63ef54097 Lionel Landwerlin     2020-05-04  1445  	int err;
d79651522e89c4 Robert Bragg          2016-11-07  1446  =

8f8b1171e1a514 Chris Wilson          2019-10-07  1447  	BUG_ON(stream !=3D =
perf->exclusive_stream);
d79651522e89c4 Robert Bragg          2016-11-07  1448  =

19f81df2859eb1 Robert Bragg          2017-06-13  1449  	/*
f89823c212246d Lionel Landwerlin     2017-08-03  1450  	 * Unset exclusive_=
stream first, it will be checked while disabling
f89823c212246d Lionel Landwerlin     2017-08-03  1451  	 * the metric set o=
n gen8+.
a5af081d012e8b Chris Wilson          2020-02-27  1452  	 *
a5af081d012e8b Chris Wilson          2020-02-27  1453  	 * See i915_oa_init=
_reg_state() and lrc_configure_all_contexts()
19f81df2859eb1 Robert Bragg          2017-06-13  1454  	 */
a5af081d012e8b Chris Wilson          2020-02-27  1455  	WRITE_ONCE(perf->ex=
clusive_stream, NULL);
dc9d77b54dfbfd Lionel Landwerlin     2020-05-04  1456  =

dc9d77b54dfbfd Lionel Landwerlin     2020-05-04 @1457  	if (!err) {
307ca63ef54097 Lionel Landwerlin     2020-05-04  1458  		err =3D i915_perf_=
stream_sync(stream, false /* enable */);
307ca63ef54097 Lionel Landwerlin     2020-05-04  1459  		if (err) {
307ca63ef54097 Lionel Landwerlin     2020-05-04  1460  			drm_err(&perf->i9=
15->drm,
307ca63ef54097 Lionel Landwerlin     2020-05-04  1461  				"Error while dis=
abling OA stream\n");
307ca63ef54097 Lionel Landwerlin     2020-05-04  1462  		}
dc9d77b54dfbfd Lionel Landwerlin     2020-05-04  1463  	}
307ca63ef54097 Lionel Landwerlin     2020-05-04  1464  =

307ca63ef54097 Lionel Landwerlin     2020-05-04  1465  	intel_context_unpin=
(stream->config_context);
307ca63ef54097 Lionel Landwerlin     2020-05-04  1466  	intel_context_put(s=
tream->config_context);
d79651522e89c4 Robert Bragg          2016-11-07  1467  =

a37f08a882b01a Umesh Nerlige Ramappa 2019-08-06  1468  	free_oa_buffer(stre=
am);
d79651522e89c4 Robert Bragg          2016-11-07  1469  =

52111c4628a299 Chris Wilson          2019-10-10  1470  	intel_uncore_forcew=
ake_put(stream->uncore, FORCEWAKE_ALL);
a5efcde69b112d Chris Wilson          2019-10-11  1471  	intel_engine_pm_put=
(stream->engine);
d79651522e89c4 Robert Bragg          2016-11-07  1472  =

dc9d77b54dfbfd Lionel Landwerlin     2020-05-04  1473  	oa_put_render_ctx_i=
ds(stream);
d79651522e89c4 Robert Bragg          2016-11-07  1474  =

6a45008ab7bb5e Lionel Landwerlin     2019-10-12  1475  	free_oa_configs(str=
eam);
daed3e44396d17 Lionel Landwerlin     2019-10-12  1476  	free_noa_wait(strea=
m);
f89823c212246d Lionel Landwerlin     2017-08-03  1477  =

8f8b1171e1a514 Chris Wilson          2019-10-07  1478  	if (perf->spurious_=
report_rs.missed) {
712122eaa105cf Robert Bragg          2017-05-11  1479  		DRM_NOTE("%d spuri=
ous OA report notices suppressed due to ratelimiting\n",
8f8b1171e1a514 Chris Wilson          2019-10-07  1480  			 perf->spurious_r=
eport_rs.missed);
712122eaa105cf Robert Bragg          2017-05-11  1481  	}
d79651522e89c4 Robert Bragg          2016-11-07  1482  }
d79651522e89c4 Robert Bragg          2016-11-07  1483  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8652711287666481883==--

