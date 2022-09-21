Content-Type: multipart/mixed; boundary="===============2797912433227772669=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/tee/optee/smc_abi.c:1222 optee_probe() warn: passing a valid pointer to 'PTR_ERR'
Date: Thu, 22 Sep 2022 05:57:30 +0800
Message-ID: <202209220520.4aL2ghin-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2797912433227772669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jens Wiklander <jens.wiklander@linaro.org>
CC: Sumit Garg <sumit.garg@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dc164f4fb00a0abebdfff132f8bc7291a28f5401
commit: c51a564a5b48355f30309b84cdffe3f96d1ae0d3 optee: isolate smc abi
date:   11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-m041-20220921 (https://download.01.org/0day-ci/archi=
ve/20220922/202209220520.4aL2ghin-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/tee/optee/smc_abi.c:1222 optee_probe() warn: passing a valid pointe=
r to 'PTR_ERR'

vim +/PTR_ERR +1222 drivers/tee/optee/smc_abi.c

c51a564a5b4835 Jens Wiklander 2021-07-21  1209  =

c51a564a5b4835 Jens Wiklander 2021-07-21  1210  static int optee_probe(stru=
ct platform_device *pdev)
c51a564a5b4835 Jens Wiklander 2021-07-21  1211  {
c51a564a5b4835 Jens Wiklander 2021-07-21  1212  	optee_invoke_fn *invoke_fn;
c51a564a5b4835 Jens Wiklander 2021-07-21  1213  	struct tee_shm_pool *pool =
=3D ERR_PTR(-EINVAL);
c51a564a5b4835 Jens Wiklander 2021-07-21  1214  	struct optee *optee =3D NU=
LL;
c51a564a5b4835 Jens Wiklander 2021-07-21  1215  	void *memremaped_shm =3D N=
ULL;
c51a564a5b4835 Jens Wiklander 2021-07-21  1216  	struct tee_device *teedev;
c51a564a5b4835 Jens Wiklander 2021-07-21  1217  	u32 sec_caps;
c51a564a5b4835 Jens Wiklander 2021-07-21  1218  	int rc;
c51a564a5b4835 Jens Wiklander 2021-07-21  1219  =

c51a564a5b4835 Jens Wiklander 2021-07-21  1220  	invoke_fn =3D get_invoke_f=
unc(&pdev->dev);
c51a564a5b4835 Jens Wiklander 2021-07-21  1221  	if (IS_ERR(invoke_fn))
c51a564a5b4835 Jens Wiklander 2021-07-21 @1222  		return PTR_ERR(invoke_fn);
c51a564a5b4835 Jens Wiklander 2021-07-21  1223  =

c51a564a5b4835 Jens Wiklander 2021-07-21  1224  	if (!optee_msg_api_uid_is_=
optee_api(invoke_fn)) {
c51a564a5b4835 Jens Wiklander 2021-07-21  1225  		pr_warn("api uid mismatch=
\n");
c51a564a5b4835 Jens Wiklander 2021-07-21  1226  		return -EINVAL;
c51a564a5b4835 Jens Wiklander 2021-07-21  1227  	}
c51a564a5b4835 Jens Wiklander 2021-07-21  1228  =

c51a564a5b4835 Jens Wiklander 2021-07-21  1229  	optee_msg_get_os_revision(=
invoke_fn);
c51a564a5b4835 Jens Wiklander 2021-07-21  1230  =

c51a564a5b4835 Jens Wiklander 2021-07-21  1231  	if (!optee_msg_api_revisio=
n_is_compatible(invoke_fn)) {
c51a564a5b4835 Jens Wiklander 2021-07-21  1232  		pr_warn("api revision mis=
match\n");
c51a564a5b4835 Jens Wiklander 2021-07-21  1233  		return -EINVAL;
c51a564a5b4835 Jens Wiklander 2021-07-21  1234  	}
c51a564a5b4835 Jens Wiklander 2021-07-21  1235  =

c51a564a5b4835 Jens Wiklander 2021-07-21  1236  	if (!optee_msg_exchange_ca=
pabilities(invoke_fn, &sec_caps)) {
c51a564a5b4835 Jens Wiklander 2021-07-21  1237  		pr_warn("capabilities mis=
match\n");
c51a564a5b4835 Jens Wiklander 2021-07-21  1238  		return -EINVAL;
c51a564a5b4835 Jens Wiklander 2021-07-21  1239  	}
c51a564a5b4835 Jens Wiklander 2021-07-21  1240  =

c51a564a5b4835 Jens Wiklander 2021-07-21  1241  	/*
c51a564a5b4835 Jens Wiklander 2021-07-21  1242  	 * Try to use dynamic shar=
ed memory if possible
c51a564a5b4835 Jens Wiklander 2021-07-21  1243  	 */
c51a564a5b4835 Jens Wiklander 2021-07-21  1244  	if (sec_caps & OPTEE_SMC_S=
EC_CAP_DYNAMIC_SHM)
c51a564a5b4835 Jens Wiklander 2021-07-21  1245  		pool =3D optee_config_dyn=
_shm();
c51a564a5b4835 Jens Wiklander 2021-07-21  1246  =

c51a564a5b4835 Jens Wiklander 2021-07-21  1247  	/*
c51a564a5b4835 Jens Wiklander 2021-07-21  1248  	 * If dynamic shared memor=
y is not available or failed - try static one
c51a564a5b4835 Jens Wiklander 2021-07-21  1249  	 */
c51a564a5b4835 Jens Wiklander 2021-07-21  1250  	if (IS_ERR(pool) && (sec_c=
aps & OPTEE_SMC_SEC_CAP_HAVE_RESERVED_SHM))
c51a564a5b4835 Jens Wiklander 2021-07-21  1251  		pool =3D optee_config_shm=
_memremap(invoke_fn, &memremaped_shm);
c51a564a5b4835 Jens Wiklander 2021-07-21  1252  =

c51a564a5b4835 Jens Wiklander 2021-07-21  1253  	if (IS_ERR(pool))
c51a564a5b4835 Jens Wiklander 2021-07-21  1254  		return PTR_ERR(pool);
c51a564a5b4835 Jens Wiklander 2021-07-21  1255  =

c51a564a5b4835 Jens Wiklander 2021-07-21  1256  	optee =3D kzalloc(sizeof(*=
optee), GFP_KERNEL);
c51a564a5b4835 Jens Wiklander 2021-07-21  1257  	if (!optee) {
c51a564a5b4835 Jens Wiklander 2021-07-21  1258  		rc =3D -ENOMEM;
c51a564a5b4835 Jens Wiklander 2021-07-21  1259  		goto err;
c51a564a5b4835 Jens Wiklander 2021-07-21  1260  	}
c51a564a5b4835 Jens Wiklander 2021-07-21  1261  =

c51a564a5b4835 Jens Wiklander 2021-07-21  1262  	optee->ops =3D &optee_ops;
c51a564a5b4835 Jens Wiklander 2021-07-21  1263  	optee->smc.invoke_fn =3D i=
nvoke_fn;
c51a564a5b4835 Jens Wiklander 2021-07-21  1264  	optee->smc.sec_caps =3D se=
c_caps;
c51a564a5b4835 Jens Wiklander 2021-07-21  1265  =

c51a564a5b4835 Jens Wiklander 2021-07-21  1266  	teedev =3D tee_device_allo=
c(&optee_clnt_desc, NULL, pool, optee);
c51a564a5b4835 Jens Wiklander 2021-07-21  1267  	if (IS_ERR(teedev)) {
c51a564a5b4835 Jens Wiklander 2021-07-21  1268  		rc =3D PTR_ERR(teedev);
c51a564a5b4835 Jens Wiklander 2021-07-21  1269  		goto err;
c51a564a5b4835 Jens Wiklander 2021-07-21  1270  	}
c51a564a5b4835 Jens Wiklander 2021-07-21  1271  	optee->teedev =3D teedev;
c51a564a5b4835 Jens Wiklander 2021-07-21  1272  =

c51a564a5b4835 Jens Wiklander 2021-07-21  1273  	teedev =3D tee_device_allo=
c(&optee_supp_desc, NULL, pool, optee);
c51a564a5b4835 Jens Wiklander 2021-07-21  1274  	if (IS_ERR(teedev)) {
c51a564a5b4835 Jens Wiklander 2021-07-21  1275  		rc =3D PTR_ERR(teedev);
c51a564a5b4835 Jens Wiklander 2021-07-21  1276  		goto err;
c51a564a5b4835 Jens Wiklander 2021-07-21  1277  	}
c51a564a5b4835 Jens Wiklander 2021-07-21  1278  	optee->supp_teedev =3D tee=
dev;
c51a564a5b4835 Jens Wiklander 2021-07-21  1279  =

c51a564a5b4835 Jens Wiklander 2021-07-21  1280  	rc =3D tee_device_register=
(optee->teedev);
c51a564a5b4835 Jens Wiklander 2021-07-21  1281  	if (rc)
c51a564a5b4835 Jens Wiklander 2021-07-21  1282  		goto err;
c51a564a5b4835 Jens Wiklander 2021-07-21  1283  =

c51a564a5b4835 Jens Wiklander 2021-07-21  1284  	rc =3D tee_device_register=
(optee->supp_teedev);
c51a564a5b4835 Jens Wiklander 2021-07-21  1285  	if (rc)
c51a564a5b4835 Jens Wiklander 2021-07-21  1286  		goto err;
c51a564a5b4835 Jens Wiklander 2021-07-21  1287  =

c51a564a5b4835 Jens Wiklander 2021-07-21  1288  	mutex_init(&optee->call_qu=
eue.mutex);
c51a564a5b4835 Jens Wiklander 2021-07-21  1289  	INIT_LIST_HEAD(&optee->cal=
l_queue.waiters);
c51a564a5b4835 Jens Wiklander 2021-07-21  1290  	optee_wait_queue_init(&opt=
ee->wait_queue);
c51a564a5b4835 Jens Wiklander 2021-07-21  1291  	optee_supp_init(&optee->su=
pp);
c51a564a5b4835 Jens Wiklander 2021-07-21  1292  	optee->smc.memremaped_shm =
=3D memremaped_shm;
c51a564a5b4835 Jens Wiklander 2021-07-21  1293  	optee->pool =3D pool;
c51a564a5b4835 Jens Wiklander 2021-07-21  1294  =

c51a564a5b4835 Jens Wiklander 2021-07-21  1295  	/*
c51a564a5b4835 Jens Wiklander 2021-07-21  1296  	 * Ensure that there are n=
o pre-existing shm objects before enabling
c51a564a5b4835 Jens Wiklander 2021-07-21  1297  	 * the shm cache so that t=
here's no chance of receiving an invalid
c51a564a5b4835 Jens Wiklander 2021-07-21  1298  	 * address during shutdown=
. This could occur, for example, if we're
c51a564a5b4835 Jens Wiklander 2021-07-21  1299  	 * kexec booting from an o=
lder kernel that did not properly cleanup the
c51a564a5b4835 Jens Wiklander 2021-07-21  1300  	 * shm cache.
c51a564a5b4835 Jens Wiklander 2021-07-21  1301  	 */
c51a564a5b4835 Jens Wiklander 2021-07-21  1302  	optee_disable_unmapped_shm=
_cache(optee);
c51a564a5b4835 Jens Wiklander 2021-07-21  1303  =

c51a564a5b4835 Jens Wiklander 2021-07-21  1304  	optee_enable_shm_cache(opt=
ee);
c51a564a5b4835 Jens Wiklander 2021-07-21  1305  =

c51a564a5b4835 Jens Wiklander 2021-07-21  1306  	if (optee->smc.sec_caps & =
OPTEE_SMC_SEC_CAP_DYNAMIC_SHM)
c51a564a5b4835 Jens Wiklander 2021-07-21  1307  		pr_info("dynamic shared m=
emory is enabled\n");
c51a564a5b4835 Jens Wiklander 2021-07-21  1308  =

c51a564a5b4835 Jens Wiklander 2021-07-21  1309  	platform_set_drvdata(pdev,=
 optee);
c51a564a5b4835 Jens Wiklander 2021-07-21  1310  =

c51a564a5b4835 Jens Wiklander 2021-07-21  1311  	rc =3D optee_enumerate_dev=
ices(PTA_CMD_GET_DEVICES);
c51a564a5b4835 Jens Wiklander 2021-07-21  1312  	if (rc) {
c51a564a5b4835 Jens Wiklander 2021-07-21  1313  		optee_smc_remove(pdev);
c51a564a5b4835 Jens Wiklander 2021-07-21  1314  		return rc;
c51a564a5b4835 Jens Wiklander 2021-07-21  1315  	}
c51a564a5b4835 Jens Wiklander 2021-07-21  1316  =

c51a564a5b4835 Jens Wiklander 2021-07-21  1317  	pr_info("initialized drive=
r\n");
c51a564a5b4835 Jens Wiklander 2021-07-21  1318  	return 0;
c51a564a5b4835 Jens Wiklander 2021-07-21  1319  err:
c51a564a5b4835 Jens Wiklander 2021-07-21  1320  	if (optee) {
c51a564a5b4835 Jens Wiklander 2021-07-21  1321  		/*
c51a564a5b4835 Jens Wiklander 2021-07-21  1322  		 * tee_device_unregister(=
) is safe to call even if the
c51a564a5b4835 Jens Wiklander 2021-07-21  1323  		 * devices hasn't been re=
gistered with
c51a564a5b4835 Jens Wiklander 2021-07-21  1324  		 * tee_device_register() =
yet.
c51a564a5b4835 Jens Wiklander 2021-07-21  1325  		 */
c51a564a5b4835 Jens Wiklander 2021-07-21  1326  		tee_device_unregister(opt=
ee->supp_teedev);
c51a564a5b4835 Jens Wiklander 2021-07-21  1327  		tee_device_unregister(opt=
ee->teedev);
c51a564a5b4835 Jens Wiklander 2021-07-21  1328  		kfree(optee);
c51a564a5b4835 Jens Wiklander 2021-07-21  1329  	}
c51a564a5b4835 Jens Wiklander 2021-07-21  1330  	if (pool)
c51a564a5b4835 Jens Wiklander 2021-07-21  1331  		tee_shm_pool_free(pool);
c51a564a5b4835 Jens Wiklander 2021-07-21  1332  	if (memremaped_shm)
c51a564a5b4835 Jens Wiklander 2021-07-21  1333  		memunmap(memremaped_shm);
c51a564a5b4835 Jens Wiklander 2021-07-21  1334  	return rc;
c51a564a5b4835 Jens Wiklander 2021-07-21  1335  }
c51a564a5b4835 Jens Wiklander 2021-07-21  1336  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2797912433227772669==--

