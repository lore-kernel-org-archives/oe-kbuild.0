Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E90C29A5;
	Thu, 13 Apr 2023 09:20:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPCQ4C+Guw6IOhqDThrP/5CuLd7tZJpwDb/SouYgPtNzTZCmCdyNFCzpyKFpLHSsUKUJiiKrX0IzzSFH4Aq4Sq/zzt1xDlRf1EYq8Q4u4Z2KWgGKcw2x1aaBRPAyjwabPZ5tbsZQqk7gl8uxJO4zcaBDaH2C8J9W+uH8gYKdULpPg1bKTkNY6khxcfTlpx5tNJHTE/FREFX5WZ3LXOQ7D6/NVqmcSuz22g1L9MLTgZRUhJQ/HIi1chzHhSP972Vea3xOuGh6Z/CKZenpeSnEEdq2pkxldbCyVZFvzqA+aJExE3hy8XxFD2MIP4mvVLAOOu4h4NKBP7Fk5Y8UtrukZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GyzeXnG6/AQeDNXWwkO4xPfcNbGPEHrV+WoPALtFho=;
 b=es3B6Ph7m9kCFmW39Cn0dxBUy1ZI2MvgrIbdgjeg13Vfte7qznhScpKcXWNkjo1k5A4Bg1zPKjHz1XFNwjt7pIoMfZLsfiUX9t3wAMzqb0k+Fb+sRzRyINqoeLP5oyo0zES4Yzmtmy+5HgHFJFSaEdOmVUblQuUFLN6asyZAWV0dLvymXfYyOZ5U01eQiWgF6WSm7T1kAGAMNjSHIkq6Z235ztjNVGtBJHObZdEbfbBJ2HLec1JqCgG2qI4Pklw90ti2DT4zocGmM/AatFycbZga10ACaBupnPiWID3aJiB2AZS34CK+wzUq1Xx+GQPp1isbxyBhMV164VqDIuOUVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GyzeXnG6/AQeDNXWwkO4xPfcNbGPEHrV+WoPALtFho=;
 b=UY4dn8QMcCcigLlcLCtxliA/wwJ7x5MxL40cv4qeBBJ+CTLHudMuGXDjIOopqCcVbB8JtoOUBSXFnptw2ZmoaWnnb1FXLzzJ5byNQlm1ZwJqAQz5dSnLd1sRu8D79gNsk/tDVPveLNJ+W/pXSjBq3Qwt63IQ7C+On+twWA8wHhX9cIMa3H1EX5W+ndZXle8TTTx2xup8EiX69GBXqLCiwe3J3xSUedUv273ckUqOA5M4y9R30yPafikL2wGO1FVPfvZuzPXjxsQGNUBQKmk57e58KqZ91BZaxlaYOQg5+0eBZx/Q+RZhWTSY2HUOaPLdOVoc9QIyA9h5s2MNIsr0Wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM8PR12MB5413.namprd12.prod.outlook.com (2603:10b6:8:3b::8) by
 MW3PR12MB4506.namprd12.prod.outlook.com (2603:10b6:303:53::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.30; Thu, 13 Apr 2023 09:20:07 +0000
Received: from DM8PR12MB5413.namprd12.prod.outlook.com
 ([fe80::9027:5b60:c36f:4255]) by DM8PR12MB5413.namprd12.prod.outlook.com
 ([fe80::9027:5b60:c36f:4255%8]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 09:20:06 +0000
Date: Thu, 13 Apr 2023 11:20:01 +0200
From: Thierry Reding <treding@nvidia.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 8309/10976] drivers/gpu/host1x/context.c:82
 host1x_memory_context_list_init() warn: missing error code 'err'
Message-ID: <ZDfJQZArnFNrHpAN@orome>
References: <ac98d66d-8735-4963-8cdb-be891d134cb3@kili.mountain>
 <ZDfEEOEoMA55t4ol@orome>
 <70bab86b-d705-4815-8100-3cce0cbf25e8@kili.mountain>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Tk1k9nggS1tW8/xz"
Content-Disposition: inline
In-Reply-To: <70bab86b-d705-4815-8100-3cce0cbf25e8@kili.mountain>
X-NVConfidentiality: public
User-Agent: Mutt/2.2.10 (2023-03-25)
X-ClientProxiedBy: FR0P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::13) To DM8PR12MB5413.namprd12.prod.outlook.com
 (2603:10b6:8:3b::8)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5413:EE_|MW3PR12MB4506:EE_
X-MS-Office365-Filtering-Correlation-Id: cc4e1519-cc98-4ce9-d26c-08db3c00457c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kNcwqm6UYIPjzyrcb1d5QcSPPm7lLGu0swlbwuO5fBW+eVzf6+XrU6v4C04IM7pdWCRR4Rfllqn4Qt7hOBsTJdYpJ+jWCccRAKs2xiv8iT4zXm8hQ3UCi+ts0MuIiCotmoOaetNcElA3+RNPWcSze6NXWJLknbE8V6yUJIwQk03I4b96Y4OG4FbOY++BOh7G8Zw3pmAjlpcMqOY52hPlCAbCkwrdVo2CXiqQZBo1QmllQnyV8JVLXSZ3KX7jSK1C6GcoGZ54D/FZSoayLZp6afnVwyhV4eIBz+m4+xNBM8ynLUr5jiprqnkBv1oohL/g55sphFTYRkb8Sv+Ngwx7M/z2ZV4r/m9vjQLV+yLEuvbr5xpcqBTjdLPbaJ2hxDRhO9mHKewO0M8XQdwMzJWXjEJNOy12bXzxtTKzXif01jwtqIiANUyRYBrpeLIeB+f9CRAVKa5qNN7Rh7lfvd6o16rKw0hUOG1SqfKZvOUwKSQu4vlFdOWU0gBMAaL6VNR55NtncFc/H5Ry1GWqUzPwr9KZvkePiTg+u0QtGB+pZ2QZ5Wk0/K5TtPeFzwkrioq2XsbTXbnWpRjzVJmgjfGo1X26TDpMM7kVeC2qhgZaJtVACfjsSipjwb9Fim0W0Pl0Pm6we8uNmT7YEva+ZWBVkg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199021)(6506007)(54906003)(83380400001)(966005)(6486002)(44144004)(478600001)(21480400003)(6666004)(186003)(6512007)(9686003)(33716001)(4326008)(2906002)(4001150100001)(316002)(5660300002)(38100700002)(66476007)(66556008)(66946007)(41300700001)(8936002)(8676002)(6916009)(86362001)(2700100001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h+ctsrrX4zYXYJr8SLTuRDJOvshNEi+T4wXvpP7Gj/RiTmhEWKxM6rlh18cc?=
 =?us-ascii?Q?fdpa9+Px4ChT4SH9MGgC9Wms51FC8G5iZ/S4l05vEHqOfQTzPA+RSk4M1/zM?=
 =?us-ascii?Q?jby3ev7QsH/KkqDxNtFpCU6ux9zgn5cPYm11MiPm7w5/c2UYadNVwQMAyHok?=
 =?us-ascii?Q?Sej5K/6RqBNzp+gfnxgAtENbfGPmlUIBRR824uRX3itZjJ9BjFuiAP3GcIOM?=
 =?us-ascii?Q?Nu+qnO4TLtPuPWsDXlLBPIdYsmB56N+SlLMAP9i6dUHS+lZh2hHIGMg7xH4/?=
 =?us-ascii?Q?ys1ZHaG26yvkP9STALhbkdVPVY29EhvkDLW6jB+Lmzg2RsFUKZs3x1yXLUoE?=
 =?us-ascii?Q?nNp9KdsOOecN4odvBVnIvz6g4NOupR9+C2H3q/WpaPj5sHq2zqg2tiWkv4PL?=
 =?us-ascii?Q?MWyC1cEm50XF8QRPqoWGRWynq2cQVVEkHuHZRqo3cGFgVoK7CLTxwKwU9LGK?=
 =?us-ascii?Q?9MuQLO6wARTppbBYAyfW/L0jZhC5EmCRzQuUm1KgDd49lcPC3sqC9IwAJC2b?=
 =?us-ascii?Q?bWSks6swCWl25yPDI6rDhWTnYK3JNP+XbaRKFx7TR59oAC5zx9nWMM7mh2jH?=
 =?us-ascii?Q?5j6sP2fwAITSQYoYVZyhRFbr+TGlfJeg9mMWHbwVVHGohB4JSjCrzJb9Jj+m?=
 =?us-ascii?Q?4yRvz6dRtZSchaYn/nSRPt/QZipbbvlWI4Z7kp9qldjKeoBxa4sOzsBASmyE?=
 =?us-ascii?Q?iPo5KXVVWhtkmVwwTQxAu38EW2s/CoQwE1JpuYCWBUB2SRBfSeiiZD+DxUZD?=
 =?us-ascii?Q?VIFxZb+ohDOxbkyqqNxTKFNIjP5Kk009fUKtP4512O7cUNRFOT9PWf2AM+hT?=
 =?us-ascii?Q?nPNlOgdp2tGk9+3cQQMVhYxeTsvFxx9wFsm+8cYTcZfXWAx8iENh1dwrSg+H?=
 =?us-ascii?Q?wcFXN1Td4olR62BTFN7+hsGAUeuI3xm3nbIUkdezOokSwegQHv+PRjpb1dep?=
 =?us-ascii?Q?pjvJCKRWh610dDB9II9nLDx7mAi+JM6Sb6eO14pZufAAdJQ8QZL42OOFGer+?=
 =?us-ascii?Q?DLBMM9e23mV1Lym9W51xuNFvaE5o9B8r+GyJ3Z1XoK6XLI2QoTchiBGWN3RP?=
 =?us-ascii?Q?h+vrqNqI1IVS49xoFOB1OYH9lc7OB1nNXTRNCdRZB69eb3JsB6n38x/1LiXX?=
 =?us-ascii?Q?EC6a9GFUWF7phAXGycXISdkcowTuePgDgeTUk+iLHuV12ifcNVouf7mZ2nO/?=
 =?us-ascii?Q?q1Ahl1r2Nk7tphGCHlBT7iCwGlLYBVL1NNHZ8O782PhvcWe3MpFQ/cuX8xPG?=
 =?us-ascii?Q?G+b8vIyiNw1samOejd9LAJSSGW0OHefUVixwv6siO8YkZ9/CD2lLBxx4OeKF?=
 =?us-ascii?Q?5bJaoDMRJQqhydz2uTonZF8+pXYXfjcD5mzZLZzLme1dBQplDwI8TbgQ7wVN?=
 =?us-ascii?Q?XyOhIW2RUsr7id6YE0I2O1jWdd20W23hr/afVYRQVDqEv6RhiXleo7cpP+Ow?=
 =?us-ascii?Q?7IThMfCfOosOeX3CtBvvPIXm5Ce7KNXfebmNyHU6XR+byzYLZc6CXkVEHj1K?=
 =?us-ascii?Q?5p4R42eDCyrwhdad+SzgR/1vejLt7KTby93AGl0r7rr8exinOIDCRS1v0vyF?=
 =?us-ascii?Q?qS/Yu1IsZjuefJiRA8dyQjS/NS0461bcjXcy6wQZV9zzWqu1Wu/YVr+OuycP?=
 =?us-ascii?Q?U7o7eEmj+Dvu6pOr0vHidlgumGpFyRLPGtVkpfyt02xI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc4e1519-cc98-4ce9-d26c-08db3c00457c
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 09:20:06.8929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: efc7SuFwLefRpxjV7tyc2WzoIIs58IBbQLLa2O7ePRt7XEcXPKWJUOLfToFP+c/YmS6R7q1cnNMyJisSPaR+GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4506

--Tk1k9nggS1tW8/xz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2023 at 12:05:15PM +0300, Dan Carpenter wrote:
> On Thu, Apr 13, 2023 at 10:57:52AM +0200, Thierry Reding wrote:
> > On Thu, Apr 13, 2023 at 08:06:08AM +0300, Dan Carpenter wrote:
> > > 8aa5bcb6161206 Mikko Perttunen 2022-06-27  69 =20
> > > 8aa5bcb6161206 Mikko Perttunen 2022-06-27  70  		err =3D of_dma_confi=
gure_id(&ctx->dev, node, true, &i);
> > > 8aa5bcb6161206 Mikko Perttunen 2022-06-27  71  		if (err) {
> > > 8aa5bcb6161206 Mikko Perttunen 2022-06-27  72  			dev_err(host1x->dev=
, "IOMMU configuration failed for context device %d: %d\n",
> > > 8aa5bcb6161206 Mikko Perttunen 2022-06-27  73  				i, err);
> > > 55879dad0f3ae8 Yang Yingliang  2022-11-26  74  			device_unregister(&=
ctx->dev);
> > > 55879dad0f3ae8 Yang Yingliang  2022-11-26  75  			goto unreg_devices;
> > > 8aa5bcb6161206 Mikko Perttunen 2022-06-27  76  		}
> > > 8aa5bcb6161206 Mikko Perttunen 2022-06-27  77 =20
> > > 9026ba722360ce Thierry Reding  2022-11-17  78  		if (!tegra_dev_iommu=
_get_stream_id(&ctx->dev, &ctx->stream_id) ||
> > > 9026ba722360ce Thierry Reding  2022-11-17  79  		    !device_iommu_ma=
pped(&ctx->dev)) {
> > > 8aa5bcb6161206 Mikko Perttunen 2022-06-27  80  			dev_err(host1x->dev=
, "Context device %d has no IOMMU!\n", i);
> > > 55879dad0f3ae8 Yang Yingliang  2022-11-26  81  			device_unregister(&=
ctx->dev);
> > > 55879dad0f3ae8 Yang Yingliang  2022-11-26 @82  			goto unreg_devices;
> > >=20
> > > error code?
> >=20
> > We don't actually want this to be a fatal failure, so err =3D 0 is what=
 we
> > want here. Should we set err =3D 0 explicitly here to appease smatch?
>=20
> Yes, please.

Looks like Mikko has a different interpretation:

	http://patchwork.ozlabs.org/project/linux-tegra/patch/20230413082202.11472=
1-2-cyndis@kapsi.fi/

I suppose that's another way to do it. It's not exactly backwards-
compatible with existing DTs, though.

Thierry

--Tk1k9nggS1tW8/xz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQ3yUEACgkQ3SOs138+
s6FgEA/8CVC8VsVocvksywpBLGt7vfCyFqxHmtB8og1YtF0WPZ4KZSPBP03VnfS5
LyLwCR8dMAMvVRUEEKZUOqAsTa+i7kxUH0iODwzZ2x3NQcJqePYTZRsP1GMqv6lB
cA+CYChgjhaVR+WUQSFM3cZ3bfSLlZH6fXFaycJEg2ACVCiNAnqG9zRASHYmSyNc
St64EnXXZZGxse99RuHyJ2wcQJyqNx8Xbw2cPK2QHuHAOUCHwQbrpAdQWeddzW3O
G4RUxVcLLH0eIQrS+SBL+2ilJ3dkgdsLFoVSHdEVg1ZM7EByKLr1PCaIYvJvg12j
PicboSn3Qq+8Mp1Fdm8D1RIinS/o5twv5z/3XRBqlX/FogzyDYxvfCwRW61HGgBC
blDtaoeJ104A6NbParWKpVLj/ZVLgWQaxychq/XIkddoMepSZuhtcw1ayBzZTt82
aogsoeit08CKTgzukZoKkplsFkHhUPb+QOdzEO2JKk+x5j4e3hGk4U/bWdTZ9Zf2
SBrUBdt+r5uiSXlaPSKSAqtxUDeCzuLNlegKG7j4vkOSf9Qv16pl5+8F8mReGJl8
WibOjfYhb/V8bKdpP2q2AuA76KvJVFmIODH2UlTjXwTF8VLfRTlIzsbJy6ROJXaW
qtSEFVKsvgynDg+TtbiU+39jGM42js8qQJvCKJc3m3SPThVwGxg=
=N6l/
-----END PGP SIGNATURE-----

--Tk1k9nggS1tW8/xz--
