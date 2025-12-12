Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011009.outbound.protection.outlook.com [52.101.70.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9D6311C16;
	Fri, 12 Dec 2025 09:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765530275; cv=fail; b=UscFtInrtm/M9xIvXax8I0RKTILIQuLpS+IOtfdAIF02q1zB6zGk/oWhSwFHph/L+ylso1V7KOBydz0tyF6dUQthLbI0JlRlhYFlgRaX3gAtW20lnfF9Sg5JsHbzDz1EW2x9M1o8w/PlHHtSTXA+FOhWOmGKekiAQ2dfz0ZClsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765530275; c=relaxed/simple;
	bh=MiDK3mwB0+yfdZvGL7/A+Ugy3uG6IqmNTtSWAqIJnhk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p8qade8H/rH2x2XeIztT+BoHWIjtlDMzRWIcM4sfCFC+6G5pyUWTJN3sW+ADSRWM1UdNokAClsey3TZF+G3nRBe8RM7tYy4YLadjs9WKxQB5hJx620LscAgclKIRK1bAwd0gRwAxBB7zYwbMHf91Fg1kynFopFpAksVmmn4jL/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NalVqpMA; arc=fail smtp.client-ip=52.101.70.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NalVqpMA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sbuClwb8pCQjgKDVsD7++3mxwggKQeUrULu1EImuBo7wl2aze42b0sIOlw6QfhakHOz0VCR+hVXHQ8yOoKZKC2r4Hv/a1q6R5FO52xZxXSN6s1YVNE1MZIlalaxUQsUZxh18FgH8VjjWmJF80TtVfycy9dNi1A1HdeZGYL6yJNUGF2EPkt+MGvujOgsOV+mnFA7OJ/Y9Ke7X6PWsPVS5eF8SUrBHf1I2afzYaxl2xPsg6tMP/uoGaabDvgfseNocXo4HA4gyp5oc9nYrlDiLQkCSp+efuQdb0hjE0/dWnngbGldpXAOX8z6o+8ZqFVwtUUbImeyL9ctZeQukFNHZWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4ZEr8hKK1+ltf0bp4opf4FIoti86GVhk9TSbX7KiJc=;
 b=Sc+c6W/XwSh2XbNhpbew0Pk4CMUdUisZZf4EBg9coal/oDssyV4E3GOARw6dj0aOxszVo2ESN4NVc1hWD1mjbOaL3R3FoO8k/OgHKp0E+hRHKBw52lRAoFWMO/Ea/wN6p9KrZ9dPnIBHfraNA+oFY3QF4F3ORUeJZd4XOZOpfy31J8/ToFVPIBb+UoMDIOFxxe/b9uPrDl6rhfKfgdhgvWHFvhKbzRiEeL6cWDQ0rj3eNOZvEaTsI8E+/2aC1x0HpduS5zjZu1TfmMYklpamm+bxs6rxtmhHOxJN/YGtfvo/wweY94kzbpmALPSHJrgwI23HJD+OPJmP1fl9O4KPfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4ZEr8hKK1+ltf0bp4opf4FIoti86GVhk9TSbX7KiJc=;
 b=NalVqpMAcw/edx146KzIOT3L1YVFiT1Zujq4hHMe/xs7e2wP2sQGunafYjfVpjgqyDyiZ6TY4wBVoYrvsUQ9KY2/IVF+cFPAvlxU6m6X2mGFlq7hZefrHOfQBQaln7pxCEqN7KgSDelQQ+yRAsPygHbEowmm0J3Cctu2lFS0xUWWxa6hjWHsyITDNxfhIXqtT0JgZRChmBGIijfhzzUdLCRnmLRdvsNHwss/Jx1rBugo/fP7CD7dSkoJm3vq0GVpNOAEBJoOmc3GeJsNiB4LJZnhutDZ84mrRM6aV8oFYH67h4iF74ky+Ws+16+ejHsx+fttDhGjt3FsjrYVgrOQeA==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by GV1PR04MB10524.eurprd04.prod.outlook.com (2603:10a6:150:1d0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Fri, 12 Dec
 2025 09:04:29 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%3]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 09:04:29 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>, Jonathan Corbet <corbet@lwn.net>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
CC: "lkp@intel.com" <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Frank Li <frank.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH v20 3/7] firmware: imx: add driver for NXP
 EdgeLock Enclave
Thread-Topic: [EXT] Re: [PATCH v20 3/7] firmware: imx: add driver for NXP
 EdgeLock Enclave
Thread-Index: AQHcZCDyTcT7+LXTOkSolFAmviM5prUY/aEAgAOHvwA=
Date: Fri, 12 Dec 2025 09:04:29 +0000
Message-ID:
 <AM9PR04MB8604547F2631FF8CE8992AE595AEA@AM9PR04MB8604.eurprd04.prod.outlook.com>
References: <20251203-imx-se-if-v20-3-a04a25c4255f@nxp.com>
 <202512091557.d5dOvFff-lkp@intel.com>
In-Reply-To: <202512091557.d5dOvFff-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8604:EE_|GV1PR04MB10524:EE_
x-ms-office365-filtering-correlation-id: 26dc6391-9bd7-4793-756f-08de395d7515
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|19092799006|38070700021|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?EA2gYGw4I5qBTqmaous9NhTUYw00wX9IB2PqH6k0lYZLdXpM7A0iFX0zISwu?=
 =?us-ascii?Q?03UKMUJ7GEgxURO8i5gX18/k5Tp4X1FxePi88HdAHpnyJIBqNVsrLLs58aFo?=
 =?us-ascii?Q?mVJL9DcCyITkW5/GIP0uVmTCXRjgNQsq+yqwFRWOP1TeKmAOlfYxgINYzy81?=
 =?us-ascii?Q?stDGpLKRpTSZ1d0U+ulczlo2e0FximC12TVXKLF5DRma/9bdZcT6oBiKGJq2?=
 =?us-ascii?Q?zOD77PUeu6UtbobK4DgwizCCJsWLJGTKldIG/GpEU452z5AUsNOvmJ2+1Rvz?=
 =?us-ascii?Q?2SSqO4tqHarWR2dIDUJ1A7uGBubkgnnhJfIfBCqmoD+R0hQsUgsT1dqHVDTx?=
 =?us-ascii?Q?g05YHg7FCMDY/AMIxTgLVhsRcbkr2qdo7ZanyetuGrpNdE+w6qwxJ9jn9SiK?=
 =?us-ascii?Q?FiVHhpwrREQcjk8v588EnXFrUq9VP2TTSG9rRuvFAeLAhIvuM/GJOWIgAjVU?=
 =?us-ascii?Q?tnU9e5fxb2fip4bY69KzWmH1ZFp6GldUSj3WFXGAwOQghz5kweuA+hMgOzZP?=
 =?us-ascii?Q?yRxuANcy2AoxuUvU4FwNWQh5gJZQWgE/7T0UxWjzuaZG9xXJ9s6RwU5TShkH?=
 =?us-ascii?Q?h/dWjdYSzvPdI5/vG9FYizuVtPRpyQg+Who2La1sWgRLXan0iFT4n3nJ3jEu?=
 =?us-ascii?Q?fI+8hHII+g5jxH3RRNUmZVQ3wIRWwdtRk8sVgoCo3vglSXMoxVKNcltkK8Ve?=
 =?us-ascii?Q?lJ89CCCXHWXegFvuCalZYVF7wPr6sLzltTK84cU7XkVRq7hsL6qdkAJsceq/?=
 =?us-ascii?Q?2j/9nTjWGtGCxczTmAuHChl/iozGLBveZFnAGbykSmWWBd2cNx5pSJTrj/gu?=
 =?us-ascii?Q?dYk3lPMGH9l48OcbsCnJteev0jAhyN26UGFHzVVLO3LMC6XC7Rt8osEvSNT8?=
 =?us-ascii?Q?cbQ7fNIiATSd5OQ8Pu7dUlbHfQY/TMO73xMjEVl1vHMSXf2ZSDZAFv4RnFBv?=
 =?us-ascii?Q?4tLtV6CRZdOpZWNmzDceOafeL2Rt6+sSQLVbTiIi6jN4Fgt9RJLli/2BxcH3?=
 =?us-ascii?Q?Z0ZDnUiA2UCBFf+qYdZNcvp0h8dMFtyu/o7LhAg97h93XggI8cyUSp4813+z?=
 =?us-ascii?Q?/JaDvopG3rnkcVN4aifAW1v66bVe0uJ3ExuTHvihyKi/AvziPLbiotfQLODR?=
 =?us-ascii?Q?zgKdU3voyxky0NfpVfA3YiUNHQRzWB1RhYlGpT4uBSJLcVn0utYdG+S8bWxw?=
 =?us-ascii?Q?T/yTdl5O0ohonadiAy8K9qJCVi9MnKwK1rMGTanSoV6N5jdcA6tVgkhj4asf?=
 =?us-ascii?Q?tHBSumg0OCj84cQKwXQ8/YPKJ0hs9mIndw17Ck5Yr4LMoiGjdSNaUCQaRDuo?=
 =?us-ascii?Q?yBSO1odXV9Q/3oyWg7pYUYT4Bu8KDzrmP1VAi/7R/J59mEYiFa5EnQeYUw/4?=
 =?us-ascii?Q?01x04sQE5r2Y5wD4jsgaLxaIarjlw1HKrzrA+9CHO10YOeVnW+l9iTjMdCnW?=
 =?us-ascii?Q?UbJPw0rzYVkahN4UsI9KZnavSioEWIM/p3k6RdiPKw/aX2669gwoQCUAaQON?=
 =?us-ascii?Q?6GqX/VYiLySyKARgXaMdD+bLtiWdu6zUX0dY75fr015EkF7Soe8a/IjZmg?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?58T5DSDAPR8J0SZ665dXS6W8G/KEq4r3GczCFhPr+SQzqrPXWIa4e8ADbszQ?=
 =?us-ascii?Q?+KEHchV5SPrRAlCgDtrvI/QIJEt75HsrwzY8vufKcbztgz4Hm4Ax/gFzxj1d?=
 =?us-ascii?Q?fkt6+SXBZMSxvZAvaL+ISZdR5Zgw/uYrom6sTUrB0w/+qY2wrKKhTEXvICL3?=
 =?us-ascii?Q?G+J9UKc/srgpFagqffeh3qc8V+PnszG+Uv8cGf4L2CigHMmjeRVQ5eHmefsN?=
 =?us-ascii?Q?ErlCyPwyASYLIyUiO/i1cYo6VhA2iFfrBdFoDonsq80CEDqrkzCE+TxGqyAI?=
 =?us-ascii?Q?fd2wv+AEiFOtLYkQxesQxJv+hr+4WYyvEVQn7ZJvj3h2hxHxyWg3IXYUDelg?=
 =?us-ascii?Q?wZjkbev47pDW0Z+Dogdz0yteM9OUfwd8dJmXpAojM/94MjMZZlzX6b9BacCF?=
 =?us-ascii?Q?7Ywo4VcGptgS68sGUift8B59IajoFYOXZVaJiJnpiZZwS8YYSKHHmI8aMwIn?=
 =?us-ascii?Q?GHaYr/bh/hYMjmXdk23rkubRyM0QT/daTTHntJ1Wx3O28w2eWrumDsvv/7lp?=
 =?us-ascii?Q?o862GxvwdQ8VgTQDzPMRxiy9oDmM4gXZmxvUThOT5AIc9DuFOp+4iZXC86Zs?=
 =?us-ascii?Q?QJtj/qmkFvyzDnqoLkwtFlTmbUyUwd/Zj5VQBR9F3KLEJDqgGSpxvzMXVTkf?=
 =?us-ascii?Q?CxUhPL3WNM5p8xsV3CWq9n34Cd1rrXB+PMWZVtP3Ni/8j90E0El8BqJCo6JX?=
 =?us-ascii?Q?BzFhRPoEFAY7XRbAGxPnP1lnWNa/R1ObC+tQ8mcFVmUwhEEdiZlJHxHP1TJ+?=
 =?us-ascii?Q?fAyZvUQmCZpKFQhe1GiqCsYEDn8vcrOBqNjv9tDMSmXcPfAiou6IrQBOdpsM?=
 =?us-ascii?Q?KIXVXgafyFCNAPiNXwkVufStUvGCo/NgpdSRk8zRSPlflC3c10V7K7x0Qoxs?=
 =?us-ascii?Q?hP/6jJ498c04pbbJoC2I40+AZZU7n+LMtp8F9YvB7odGXT/MfDk8xcBLQAMO?=
 =?us-ascii?Q?c78e4MRnW4dIOjhfzsjfwj9c1skeRCXg/4+d9QjsEVNICcjo5pJZQE9utFs0?=
 =?us-ascii?Q?22QpAr56pv/VXPvPY6Qa8jU2ntRieeNB3pQMNf+xNObZ1mxmU00zL5CQUwaZ?=
 =?us-ascii?Q?nVy8WAnih6VxrosWNvZ4X/Gtg6pddYZHlGYpAFhYS+knjFRzc0pqq3GGVV7I?=
 =?us-ascii?Q?DsyojaDIoLfy/UaBHN7SPjWnozKU2PW/BVuHg8cFjVnnmvxgTtw4ucGBM3QO?=
 =?us-ascii?Q?zxuGlTrVIgFaj1EEJ8HId/XEUqcNxGte46enjgqKxMBFq8TFxcR+xgUx4qRW?=
 =?us-ascii?Q?kiprDjkVRjV4KtXLfRdcqMm1+WUxEV1piaCbbHT3QYcCucE5IujZHcz/tVRT?=
 =?us-ascii?Q?etuE2EYacD94uMhAB09FnV1R5iKKTQFEb3Zyjtu5dTunN1XNTFecjVSL+nxE?=
 =?us-ascii?Q?4RTE0owKCSgd087b3zeaYfgEO4xCVlAew4PUwYJiqDaPx+/6TnmHHbvWmuxi?=
 =?us-ascii?Q?Nzz+++RrCpjL/ENWL8T8kvFjtST9AqiVcBULp+Wy2Ah6rBWimSTyINLK0PPg?=
 =?us-ascii?Q?ADNGBm3b4Hy+uSMHJfhRBAiwSei3oj2Cizq6FLzN1AbDj9GccQh2hoAP3s9I?=
 =?us-ascii?Q?c/BymOsfhLuSUPHvLLI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26dc6391-9bd7-4793-756f-08de395d7515
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2025 09:04:29.1783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gdPOgCshGovltD2RY1x67OWqNBqDa0mm9IquuuPw3OvmdeedOeWUlxu4/BoO25ip46hgTgS7uKObZcgJ3QskJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10524

>=20
> smatch warnings:
> drivers/firmware/imx/ele_common.c:264 se_save_imem_state() warn:
> missing error code? 'ret'
> drivers/firmware/imx/ele_common.c:302 se_restore_imem_state() warn:
> missing error code? 'ret'
>=20

Accepted.
Will return -EIO;

> vim +/ret +264 drivers/firmware/imx/ele_common.c
>=20
> a9e23a74789346 Pankaj Gupta 2025-12-03  251  int
> se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)
> a9e23a74789346 Pankaj Gupta 2025-12-03  252  {
> a9e23a74789346 Pankaj Gupta 2025-12-03  253     struct ele_dev_info s_inf=
o =3D
> {0};
> a9e23a74789346 Pankaj Gupta 2025-12-03  254     int ret;
> a9e23a74789346 Pankaj Gupta 2025-12-03  255
> a9e23a74789346 Pankaj Gupta 2025-12-03  256     ret =3D ele_get_info(priv=
,
> &s_info);
> a9e23a74789346 Pankaj Gupta 2025-12-03  257     if (ret) {
> a9e23a74789346 Pankaj Gupta 2025-12-03  258             dev_err(priv->dev=
,
> "Failed to get info from ELE.\n");
> a9e23a74789346 Pankaj Gupta 2025-12-03  259             return ret;
> a9e23a74789346 Pankaj Gupta 2025-12-03  260     }
> a9e23a74789346 Pankaj Gupta 2025-12-03  261
> a9e23a74789346 Pankaj Gupta 2025-12-03  262     /* Do not save the IMEM
> buffer, if the current IMEM state is BAD. */
> a9e23a74789346 Pankaj Gupta 2025-12-03  263     if
> (s_info.d_addn_info.imem_state =3D=3D ELE_IMEM_STATE_BAD)
> a9e23a74789346 Pankaj Gupta 2025-12-03 @264             return ret;
>=20
> This returns success if the state is _BAD.
>=20
> a9e23a74789346 Pankaj Gupta 2025-12-03  265
> a9e23a74789346 Pankaj Gupta 2025-12-03  266     /*
> a9e23a74789346 Pankaj Gupta 2025-12-03  267      * EXPORT command will
> save encrypted IMEM to given address,
> a9e23a74789346 Pankaj Gupta 2025-12-03  268      * so later in resume, IM=
EM
> can be restored from the given
> a9e23a74789346 Pankaj Gupta 2025-12-03  269      * address.
> a9e23a74789346 Pankaj Gupta 2025-12-03  270      *
> a9e23a74789346 Pankaj Gupta 2025-12-03  271      * Size must be at least =
64
> kB.
> a9e23a74789346 Pankaj Gupta 2025-12-03  272      */
> a9e23a74789346 Pankaj Gupta 2025-12-03  273     ret =3D ele_service_swap(=
priv,
> imem->phyaddr, ELE_IMEM_SIZE, ELE_IMEM_EXPORT);
> a9e23a74789346 Pankaj Gupta 2025-12-03  274     if (ret < 0) {
> a9e23a74789346 Pankaj Gupta 2025-12-03  275             dev_err(priv->dev=
,
> "Failed to export IMEM.");
> a9e23a74789346 Pankaj Gupta 2025-12-03  276             imem->size =3D 0;
> a9e23a74789346 Pankaj Gupta 2025-12-03  277     } else {
> a9e23a74789346 Pankaj Gupta 2025-12-03  278             dev_dbg(priv->dev=
,
> a9e23a74789346 Pankaj Gupta 2025-12-03  279                     "Exported=
 %d
> bytes of encrypted IMEM.",
> a9e23a74789346 Pankaj Gupta 2025-12-03  280                     ret);
> a9e23a74789346 Pankaj Gupta 2025-12-03  281             imem->size =3D re=
t;
> a9e23a74789346 Pankaj Gupta 2025-12-03  282     }
> a9e23a74789346 Pankaj Gupta 2025-12-03  283
> a9e23a74789346 Pankaj Gupta 2025-12-03  284     return ret > 0 ? 0 : ret;
> a9e23a74789346 Pankaj Gupta 2025-12-03  285  }
> a9e23a74789346 Pankaj Gupta 2025-12-03  286
> a9e23a74789346 Pankaj Gupta 2025-12-03  287  int
> se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)
> a9e23a74789346 Pankaj Gupta 2025-12-03  288  {
> a9e23a74789346 Pankaj Gupta 2025-12-03  289     struct ele_dev_info s_inf=
o;
> a9e23a74789346 Pankaj Gupta 2025-12-03  290     int ret;
> a9e23a74789346 Pankaj Gupta 2025-12-03  291
> a9e23a74789346 Pankaj Gupta 2025-12-03  292     /* get info from ELE */
> a9e23a74789346 Pankaj Gupta 2025-12-03  293     ret =3D ele_get_info(priv=
,
> &s_info);
> a9e23a74789346 Pankaj Gupta 2025-12-03  294     if (ret) {
> a9e23a74789346 Pankaj Gupta 2025-12-03  295             dev_err(priv->dev=
,
> "Failed to get info from ELE.");
> a9e23a74789346 Pankaj Gupta 2025-12-03  296             return ret;
> a9e23a74789346 Pankaj Gupta 2025-12-03  297     }
> a9e23a74789346 Pankaj Gupta 2025-12-03  298     imem->state =3D
> s_info.d_addn_info.imem_state;
> a9e23a74789346 Pankaj Gupta 2025-12-03  299
> a9e23a74789346 Pankaj Gupta 2025-12-03  300     /* Get IMEM state, if 0xF=
E
> then import IMEM if imem size is non-zero. */
>=20
> I really can't understand this comment at all.  :(

Accepted.
Will update the this comment in V21, with the following:
-       /* Get IMEM state, if 0xFE then import IMEM if imem size is non-zer=
o. */
+       /* Check for the imem-state and imem-size before continue to
+        * restore imem state.
+        */

>=20
> a9e23a74789346 Pankaj Gupta 2025-12-03  301     if
> (s_info.d_addn_info.imem_state !=3D ELE_IMEM_STATE_BAD || !imem->size)
> a9e23a74789346 Pankaj Gupta 2025-12-03 @302             return ret;
>=20
> This feels like returning zero is intentional, but please return a litera=
l zero.
> s/return ret;/return 0;/.

Accepted. As mentioned above, will return -EIO;

>=20

