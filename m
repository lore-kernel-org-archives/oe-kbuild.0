Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4139320E;
	Mon,  6 Mar 2023 15:19:43 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 326CxWWP013993;
	Mon, 6 Mar 2023 15:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=FRoVz6rrxJWDgKbXoAeXDY/lblUeQvmLfTuZmTpmivo=;
 b=dwovKv841Y2R2agMXPlBV5NUO8nUfmL6pLzYIfQzwZUoPUa0kgbyZd8Nu+XkzaWZprQv
 8Z/ILK4uNceD277IO0VyttWkThcWuk5VBQmFXIqKWPN2l55RTTGKD78I9k77AHH5KGyj
 sWB/yiPYfhHZJB3DeC9AdMHW2L6woS9Nxouj0gy2gKW0HZym1sNJD3/IggJUG6ysgNNP
 GYAwKTaSgKo6ft4rS0OEgxRVRWhYsM+lyZ6aT+OxX+5DrXKh94Z+laiECXTI6PgVYcpp
 nBxCJG0hq0v2xtTnZpvfN1L87URgZnm4g8xFHbkrshFHbiFqww8oBbSq8KGLCJgJF3XS lQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p416wk4jm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 06 Mar 2023 15:19:41 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 326EC77v029280;
	Mon, 6 Mar 2023 15:19:40 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3p4u1dmjg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 06 Mar 2023 15:19:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEZLmDOSYJyWNtsL7z/oU+phajVv4j9J3/d2Hvj6hwYD9lzyknToFFZrdT/GgZKb9z7bI5zUvAmJLodKmicGKUQkT9amlnDDZ7X5XPUK+XtY/hPje/I/Q5GUh2qkEXzJ96g4l8p85b1oAuhRlDk5PxBVouqfztfyfwArX+kajIvFjCWGd+H+qGfgRhNfO5uvSqspiCjfKDRYpWEusQjfTwXGdurd4da00L3gb+TqONhEzF0xl7azlIBsknoEEXYENh5I4N4NnMkweAHKr7D+HoQecBFYcpnX/LqydDuRw/l1uT/8BMEv4ys7iE7OCSpgRzQc1feZCPeDt3ZeExEk5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRoVz6rrxJWDgKbXoAeXDY/lblUeQvmLfTuZmTpmivo=;
 b=nV8HEUAes0i0Ag2sBrT58TTGa0nWCBQdwhcI4GrzVJ3x8iGX2WyYx6OqJzO3qmSNSyo2GSeKDdlwAa2dv2GiQpXLrksnRJINXpOJ4a6lW26Q30k65GTQF+T8KZ7J2OXriw8eQgwHwMZAMsoVGghqPuad3QGv4d42fBAel0hSpT3fyDhsJKLI65y6zbBC1DcFlH9pzF3IyFFr7KUbliuKa4fAsDvoyY1sWmOHK4CLNLwM4EJ4JGSaPSzPqVhr0c2Y3dD8PqhDQ2cvqrOTENaWQXYO30VAzyneLSPH1SEeWJuP5lOm/3XzA7awo9paDq/QkBx6pPQ/soTVCTT2z/5Rjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRoVz6rrxJWDgKbXoAeXDY/lblUeQvmLfTuZmTpmivo=;
 b=qJADHhdoqFdl2mPpSHr6m1/dDKUZJ4I/Tt4KrTWNhaiXnzOnQM3lECAUfbmJqQF4m1jpPpkM9goUpAW4csBufyVWov2iQB8vPBllHC0MExv1UcF35PeZMTPP422GCnqdiFdjylZ9xiFe1sFn3wgftrQewJ5DqompdeISUjX+MS0=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH7PR10MB6356.namprd10.prod.outlook.com (2603:10b6:510:1b7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 15:19:38 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%6]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 15:19:38 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Dan Carpenter <error27@gmail.com>
CC: "oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>,
        kernel test robot
	<lkp@intel.com>,
        "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [cel:topic-rpc-with-tls-upcall 1/18] net/handshake/netlink.c:187
 handshake_nl_accept_doit() error: uninitialized symbol 'req'.
Thread-Topic: [cel:topic-rpc-with-tls-upcall 1/18] net/handshake/netlink.c:187
 handshake_nl_accept_doit() error: uninitialized symbol 'req'.
Thread-Index: AQHZUBKxSY4sGmmn+06S4rsHLuiew67t266AgAABsoCAAACbgA==
Date: Mon, 6 Mar 2023 15:19:38 +0000
Message-ID: <C2F28F13-B7A5-4F5A-8109-0E7B1C510697@oracle.com>
References: <85ee6966-32b0-4ff2-8af0-2678ecf77609@kili.mountain>
 <55614170-7D09-4865-9EA8-E9532D3E3F73@oracle.com>
 <9cbf9852-e58d-451d-9911-484112a92d6c@kili.mountain>
In-Reply-To: <9cbf9852-e58d-451d-9911-484112a92d6c@kili.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|PH7PR10MB6356:EE_
x-ms-office365-filtering-correlation-id: 8d551853-3682-462d-e0f8-08db1e56336a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ZDNhI+lek++CXcxVUaYYNA8zvRDMNavE4fchSD7EYu8eC2GpLJQmEqUK0kNAa42fooccpDjPCyKumvpxjvBIDnSL36fP/7RuATmMOakgwHJgSOKXXSa2y+i8vcH0ElJyqILog23hRwCmTa9ZuFDsv9pzfH7aL4Y1XPr8rzvp8vkaiXrZ51ZRJU99YIVj9vOmlvdmZ9LyzGP3rquxhbUFfhE6WeF0VU5ZM7lVjYD+bkvf6hJtSvLt+QpAY6sTytvDkh0yOskilZjgOg5Jo6z49xWqMzdan2m/K3fCUspM2pbuSHNCqhCobNBnqCx0sB99JtRMEkJPmwxaSAoBSVnO790mI1ZbC27xWp83XUrmo6vAyCnXdKNKeF+y86ATnBM/Q/o84irAkGGith7XnpX8WHw6wWAcr/pYcdLXouIInv7Xyh8wAagv0M+/Q6mseBbmbpRdu5wY7DN8WqWI51e/EMBa0w9hdI0Zc4vnPBpzQvEmTdGNl5Hn+UkVNcts7hoPrOKGAsD9w6rXynx2PzzdmRTjxoDvO4DWAkEQyKVvRkfPMBkjBoFJDTIv2nUGk/goN8KpwPog7TH0NHOcXHRcG1P8Fle80EtmzEbVce7I3YOR+BdZjJvB53BXGY7srk0+sTuq1Q6W2FRwvvpcuXeEBfZOMsENNo+yYT1FRaeeGDShI0f7a/bDgF32FE1XUxa2vGZoVf1u3L+z07qYpikp19FljMagUUsb9fp8tgBHBedQ24MONSGtAcWbL3GFfI0wRQxF91CyKZ4fV5Wunwi/GA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(346002)(39860400002)(136003)(376002)(451199018)(36756003)(53546011)(6512007)(6506007)(6486002)(966005)(2616005)(186003)(26005)(316002)(41300700001)(54906003)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(4326008)(91956017)(6916009)(71200400001)(8936002)(2906002)(5660300002)(478600001)(122000001)(38100700002)(86362001)(33656002)(38070700005)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?EfodGlSFpQ1X15w0xY00ZuwACxhQzXgD7uNwwI3Inq3jnkLC5zh2a3ISNZ33?=
 =?us-ascii?Q?D4aJnb0xRPg4admm3H/HM5EWwyTQa2EqCtxYG5/uqYxrMo1sHNsOzUIAuSqo?=
 =?us-ascii?Q?xRGuZdYYlwXpVz52yqeEKqKfcW2w/lwx1XHq4Jhk9HEz4MtozW3JHNUTz8Jv?=
 =?us-ascii?Q?XqwWi6e16Cp728AH8MgVWMcGqiS6i08CqN+4EPsfP089oYdzccIK36kSpu7P?=
 =?us-ascii?Q?YU76P+gm9xd1pdcTIVWvyjwQskxobA+HantjXlUm+dIWAjIIY/RAIvf0aP5Z?=
 =?us-ascii?Q?DlciWVpwT+X144n4TJNg38RJwOTBL/u+XtRc3oXz7unF6CccSsdR3ftznbYx?=
 =?us-ascii?Q?+j661gwR9nVxrPbWOoAfoZj18aK/7oYmG37GnUcVQIJdZaqLZUxmUuAlOhF3?=
 =?us-ascii?Q?lsChP+KRPs+OowUZX7C7X91w1aVrkpGM0DeAZUyWGyQOHgitKYtFwvygnqqX?=
 =?us-ascii?Q?p1kCz3rL+eQWgPsdf4sr0oheZ/biJ0Xck2nvDNu83gp0kjAPeNZLyjUmyDsF?=
 =?us-ascii?Q?3zONB5BLP2bY/yJerYEfROw2Q7saU0qAnHybbeUpJ2MlIUTPRe0Lk1035yFH?=
 =?us-ascii?Q?MQzjKJJjGPfThc/QZmtChQuwT4XNu4bXU1i0hKVmoalCpldJDVHkyUkTCeqQ?=
 =?us-ascii?Q?VmMhPlmL9KgAmhl/lz1e30ISg4qUyN35aVuUn1NPIrqhAgl1/O5hhRMDmfw5?=
 =?us-ascii?Q?XQLlFNWeA6rwyid7lCN3f43zp1tvxlBQlKUJ/NHXP8lqJrftgzyQr0JJLmaE?=
 =?us-ascii?Q?Gvvv8jmnvYWP+JKg78qI7XpWiJJjGJv+ydZaegVCwUGTNjF2LiQLbialWm89?=
 =?us-ascii?Q?wy4w5CUchadUPYKfCxDsWzV8o2F2X495p1Aq/wMEjRF3piglCzHSHR2hkmCT?=
 =?us-ascii?Q?2ZXoaj9HDTB1YaGg3L3j9P5Hqi7v8bHE5B0h3Is85aGosavArncxttBQjt5f?=
 =?us-ascii?Q?r89bwSZ7WDZ0X14DvGbCGvgIKPZw7VZClpSJ0kDpZ53Znn5sXuiEJeLeRk8v?=
 =?us-ascii?Q?AcPbrPrfnmSZ9OfRpzLKOCvO3ELO3q+pvJ8gbgtgHwp7G8h/mM8YoYMUYpci?=
 =?us-ascii?Q?hD/SyUOwtJT665hOlEXl5z7R6Yv4T5lPwnX2eF550abl+ROqiWnO3CCvJOYy?=
 =?us-ascii?Q?W7ggL8vyYmqE/Y4X/JKqHJxU0N6GP1m2hQ8DFEzaIEW9GcoIgLXaKxSELr13?=
 =?us-ascii?Q?nFixJlZ3tnTJH8WXi1HUTG1RYicGao6YaOAffXTFlmkLe83awa3o3DWLkUcA?=
 =?us-ascii?Q?Q06iVpXOoFXTlb6279z8sKZyKiKIo2JRFW8Lx504Ud1T97vGI2EaH5xPyuoc?=
 =?us-ascii?Q?7vBxI6bWcd8nbyC/ruLJWcVwD+FxXgZweZh/bhHZjEJXd4BbCNlAhS8pDA3c?=
 =?us-ascii?Q?qe4mQ7gV3LjEWTDcLCxIJarTY37++lsyr+Hnh26snidJCwvDLE1JKXD5d7et?=
 =?us-ascii?Q?/t445iCYNE2bl3h1IZQPGKx0ogYbI1p6Y62KEIe6vkbZFlYgLnZE8iCb0cwp?=
 =?us-ascii?Q?nTlk4O5TL7kZqMqjFEzbbx/UbFw80iVZ+ebg0lZPSGpVYWd/67hQnQuPq5wT?=
 =?us-ascii?Q?JWFjiji5GHaYaEgphTsTG8fm2W93TBueTW61t/wQDOE2Ei4PoPBJtACh7eg4?=
 =?us-ascii?Q?kQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5B54B469979B194F84D36A8FC798E81D@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	AOqIYxXU2g1AGWT4Va+Jp+DTsiHM9MRrSUvGfxiCifnbzGDLwdda3nBmysqJbYlAxmfN5FF0vVUDBEUE6mX36la0rfn4mPV53AIzQdfv5PFaZBMbKN9feDR9faE8me8OHyt0wTGDT1zCzuUI6E8QE38sOt6alexIpZYmdm67z76ShWp0J14a5kdcwxh4LiwQJ3IT3+KKD/mcExoTV3pI8O6WqbDvvXRMvL229hwSPN5iy9dmv5GRlr4KCugO9yIGiqBDJQtlxWwbYUwwXcmUatmpy32TvGAv2WS7NtJQmxpYD1WvDo2wQjUvqu+p2Q5Fgn1TAm7IocTrj9dkZwHHwm4/yMNybJiWbAYoKP3Y3O4cH4xh4USSDYXo3+BnB7OM5k/G/dtbudxYRtQmW3+4VzyaQnJVI3Rb3yBTFUC76DbuvTEUu3M5uqZZ9lgQM5EbGWCrAYaNo2GI1TM+So9W+7uYP4GJ3bL/uTp5LQWmlM7r2DksYM7au8sbZxdaFV0QbHWe/lyhOWkyRvIT0LLP0GhTfFm57PsC4olEfS6Qv0YN7q4HvmDfzM4pUhhadSczWIbUq9RZPu71mnitdblrh1G+9EewEy6J1SX0yRsuyFGV0xFJb8WeBYnp1B7KNJrkrUxZm/n2HB497H8mhLbGli4e3RvRdKlqqH67+mPQnHNvQNBykDXOa2jOA3h93CtdoHXwP5i3PyDwhJmGjh1bgkXxnYvyoXBg5kffLzrTs+eHSdyOesuWXLbU6y/vKe45RacTtuKxg+69FAfcMUatkHBpf4+FLIGzjbotjPXUwKyxkIWrUbP/FfGH0ko48zWA
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d551853-3682-462d-e0f8-08db1e56336a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2023 15:19:38.1251
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZgoKtLaf6dQaYSqDMRDgUA1LqurULXC4asouEUBZ+YT1r+dUXVCitVJhEmyRc9TKjktIXwOWgYQv0bb31YOkhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6356
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_08,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 mlxlogscore=996 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303060135
X-Proofpoint-GUID: tLSAJ5uNbyJcVuWlV5MMCMK3Yf-gynBc
X-Proofpoint-ORIG-GUID: tLSAJ5uNbyJcVuWlV5MMCMK3Yf-gynBc



> On Mar 6, 2023, at 10:17 AM, Dan Carpenter <error27@gmail.com> wrote:
>=20
> On Mon, Mar 06, 2023 at 03:11:23PM +0000, Chuck Lever III wrote:
>>=20
>>=20
>>> On Mar 6, 2023, at 5:01 AM, Dan Carpenter <error27@gmail.com> wrote:
>>>=20
>>> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-r=
pc-with-tls-upcall
>>> head:   88897fb973ffb2448e3452ca4e9283908bd257f6
>>> commit: d166e9ec5e3800de085444eca5883ce1738f6cb3 [1/18] net/handshake: =
Create a NETLINK service for handling handshake requests
>>> config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/2=
0230306/202303061707.ICwrtQsr-lkp@intel.com/config)
>>> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
>>>=20
>>> If you fix the issue, kindly add following tag where applicable
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Reported-by: Dan Carpenter <error27@gmail.com>
>>> | Link: https://lore.kernel.org/r/202303061707.ICwrtQsr-lkp@intel.com/
>>>=20
>>> smatch warnings:
>>> net/handshake/netlink.c:187 handshake_nl_accept_doit() error: uninitial=
ized symbol 'req'.
>>> net/handshake/netlink.c:240 handshake_nl_done_doit() error: uninitializ=
ed symbol 'req'.
>>> net/handshake/request.c:193 handshake_complete() warn: test_and_set_bit=
() takes a bit number
>>> net/handshake/request.c:236 handshake_req_cancel() warn: test_and_set_b=
it() takes a bit number
>=20
> Thanks Chuck, but don't forget about these as well.  I haven't looked
> at the code but I suspect that it's passing BIT(x) to test_bit() instead
> of just passing x.

Yep, fixed those up too.


--
Chuck Lever


