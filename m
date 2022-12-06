Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E6727706;
	Tue,  6 Dec 2022 16:01:55 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B6EfiEB001404;
	Tue, 6 Dec 2022 15:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=6WA2o0+sHeS5N0gqweI1MuggmXtrJ4UwUnmr05JPFXQ=;
 b=u7Y2lkh1qVjo9PT4FZBRpxk2Kyvwx82v86YlyJWng3gMic7OsDBWflqHGLkWaAvMyDjo
 1q1nPnIzt5kZ1FQdx/bThHWjyno9DtHuCMGk3OJnwaAOwguZ7QpZCHG284ZQQWegClsD
 Emoe3oAYi6zOuUSZTK9ysus9YyA14IKVoY+Embh1hzghTUYaiVALZ3fvmI0HMNwjVuIZ
 +VcyC0IpxXj+xYxQ2P5iFh8qbDnfhthKSN0uQvxGEtOgyFkMoKOVSJkAsmEOWbYaTVQJ
 S9sIzqqwpjR7zX00eV6GELGpAhTtpYEEVjOiV13uAtg6hUTXInSrLNpV2HC8KX9yWpx1 WQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3m7ydjfxmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 Dec 2022 15:07:18 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 2B6EQRCK010293;
	Tue, 6 Dec 2022 15:07:13 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ma4ja9myb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 Dec 2022 15:07:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBVwYI6zm1xVcdkXiZ3gwPteV7ODfzS+R8Z8CzgCT5XTtZ7v74JNXsUoiFwD85E9pGw42RxO58sOimgrmTM5zfZKLAlwxU83TSxv9wUxTuJy6jskziE3YdS0W4QmhvFiuH3N6paVIDqCayce8yTFZYJomAbiPRUCZCJK7CMxKxzAZuyi7bUQI0LZ3S01SXpta5t0HZKsnR0aAAVOA7uWPeTWyx+kPTJuy40fc9oVHtMCGyGwDuPZhNE6Yk8iNJgAqoIxbnTscoR9X+kwd2TlRFmEQvShFB6VzygrbMGaLu93FhWuwH+0PHM3vLGHJ3MH46ywhh5osuUvxM6ckR2/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WA2o0+sHeS5N0gqweI1MuggmXtrJ4UwUnmr05JPFXQ=;
 b=cgMZWWNGfMSU9zNjbEHD2K8VpJJ6Z95EKJBIAMHufDNBjW+lGd4vueiQRbU5rovnl2kQtt+o/K70EglGokAXrbc+Fhs8baIC3/EGnuVkImI5oGp2Ux15BHuiEHXlDQ1S7kxzeiyTY2YiqLgCYwRzSVHc8R4OnzgEj/sqFtVY3B8Izyn/wzxu2oAaR8Tt2fdFx6zB46SHchdTKwODw4KWEx/5X3jl7dkdx0Zrr5Rl4dNYCkvL8ap33e8PhAkSX/P9QilfyvTO9ik/x3qos0KhqD5RBECG0K78J/lbjmrYQY6tgevpjRHX8PUixysiXIoSWW9pm+XVOOMx2o5+L6PIIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WA2o0+sHeS5N0gqweI1MuggmXtrJ4UwUnmr05JPFXQ=;
 b=K2XIi9GwGAbT1FkORo/kYojxDTuWOc3/kFf6T39NEEE0hKEZVkUM1MIifQiNxdlzRn/GRS/YOqmFO1DcV8POmG9chU77w9mnPo2dyZlXuzZzRj6EdnpL4nTOQKHZ5HadLnoTVVj5TXIN0grvEP8c6uzUqhcjtySH/LfBojeiyYk=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH0PR10MB4616.namprd10.prod.outlook.com (2603:10b6:510:34::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 15:07:11 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::1fab:d731:c933:ed]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::1fab:d731:c933:ed%8]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 15:07:10 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Dan Carpenter <error27@gmail.com>
CC: "oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>,
        "lkp@intel.com"
	<lkp@intel.com>,
        "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [cel:topic-the-not-so-distant-future 55/82] net/sunrpc/svc.c:1466
 svc_process() error: we previously assumed 'p' could be null (see line 1454)
Thread-Topic: [cel:topic-the-not-so-distant-future 55/82]
 net/sunrpc/svc.c:1466 svc_process() error: we previously assumed 'p' could be
 null (see line 1454)
Thread-Index: AQHZCT1KiCtoCX0MEkygIlSGZqMc8a5g9lkA
Date: Tue, 6 Dec 2022 15:07:10 +0000
Message-ID: <F6956FA9-4F2F-4716-8C2D-EBD81136443A@oracle.com>
References: <202212060740.k4dCGCg8-lkp@intel.com>
In-Reply-To: <202212060740.k4dCGCg8-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|PH0PR10MB4616:EE_
x-ms-office365-filtering-correlation-id: 696e74db-e35c-4399-d5e3-08dad79b8cd0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 NIOcgBwkQXlBK7akSwkAupQrGgUcmBQf7sKmqfGW6P5P30Q1XQ8PHYgL/GxYDMGx9WmAinkTt+LM7c1meU6eocIJZ2QYLb3pnTe3t5SmLB6gkq8lnAeSZGE01kISJabXIF8PbSv101DIBXKVrFJvNOM06siW3adjlakbDJ9qBNf969YUhDMY8M5o/ne8i1GZG77FkK5oZCSxIBvWR1L8EAfuze4mWDAtm5yOkVm8fifWkzEl5yWB+QNLiqfIS9bvCLDvmW/qdMf7qI51TRT8q23hCrYYNmkyS3GAHrNYD4tji4Ffvvtcr8juSZxeWr12p0cu0AERF4R5ZTfjO5x3Zu14eWu/Qppad1RQJDjIQAOrmlhaPQGQ8XGDO+nR3eTPOxWP5AACWUM3E1VoGsw0dms/Qj45CZp0/adT9hrvqw/SculvZA1WhVaauhO73o0S4Gx9gf6JfU/CD4z4h3xwySwpPxBX5DBbYaMABaam+xRg0BScuwDE561c08swykWz9SUEbemcSC50GaUokzTuABCYIKO7YjfOFnkXHaVn+puX57jmFrIBOiQPqIpII7PeSCfcV5xM+AwdLJu8oh6TYjMrK4OmMmRN9yWq2hNEZHf9SaF++ZSALvbqLEOrrjB3kSIYXVz0XSeByiVI5Fs/lDlyigwkwlneAxZjzGyJXmwntKMoGGRAVyLcu5ry9YYx/+xkearhR/kLBqK8NiushJHEv1wciOo2en/Phb7haivKhV7wTdSXRxSEMmZ8BygD
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(346002)(136003)(39860400002)(376002)(451199015)(36756003)(86362001)(38070700005)(91956017)(64756008)(8676002)(76116006)(4001150100001)(66476007)(2906002)(66556008)(66946007)(66446008)(8936002)(41300700001)(83380400001)(122000001)(38100700002)(33656002)(54906003)(6916009)(478600001)(71200400001)(2616005)(4326008)(6486002)(966005)(5660300002)(186003)(26005)(6506007)(6512007)(53546011)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?PWXv3zUIsYAnZRmmEtEof9Ru5gKVMrbGvLc7MyACQntrGj+Ekcm/EuXab05s?=
 =?us-ascii?Q?TSMMjTYDMSKT+6h4kpjOhXq1/L6A2EHMR13RPtqoruGtenLll7BUp+jxDG7W?=
 =?us-ascii?Q?CHxk0NNYt3B3xZeKwkE1GrCHBYnt50DDbRw+hGvphUNLSLOhZn8kMvVX1SmY?=
 =?us-ascii?Q?YZT6Wci/WBPi9K4D3dz6hkDsqa2ICY686/PBTyOROtdmg3KuXV3qtcIEdBqa?=
 =?us-ascii?Q?vV1NHIwwFR2jQlCoQSjYwnQCoOWY04czDS8yv3grEoJCu7WbLbRQoVYuNC5V?=
 =?us-ascii?Q?yD9OI4lDz1bMUWchpGnXuTH7BGFNNOg7esSiCF1GhYMlXQoA+4WDpQnQlHDr?=
 =?us-ascii?Q?sDttaLv3p4ff2YkL+yO1XBYEwQBT9vS0/JfMUVUB4V+R9+bC5LER7vj2IPI0?=
 =?us-ascii?Q?sbzNMIL6F6mnPYcn4MGisFYoxBHkPaQXM5anZ5tyCav+KYjqpkC6QpLqWXN+?=
 =?us-ascii?Q?ECkYpD/U6xRK8laDOGppjWOhlcZ7Sb//XcP/O5ClRzmEyvBru4Iwpa7vA9SF?=
 =?us-ascii?Q?4ZUyjMxlJ/5kUOJaQh4Cag3O+xbdo3ItMnfRzxEUpgsBivd200V7FaKdneKR?=
 =?us-ascii?Q?NAiHRxP1R4jEKXK6fLQ0ZF5jNUw9S1ySEUrtFa3P1CLVVTlk/vBSRX6xKDk7?=
 =?us-ascii?Q?Ft0ULqV8eHQuQlzSqHPI31iLCgOlq8ewSYa4e5DEsyiBQpA0JKJ2GUMrQab3?=
 =?us-ascii?Q?o5Eurlhr0XoBAYooMEZlk3cJKuA4SFGaEr5Ckf4svz3DTgTVPu6DOq4LAR1U?=
 =?us-ascii?Q?qhVvNFrz8xbmr3A9E8vMIdDVai11yj8PYv30vceUyPYqMJR8lqu5mhw4DGhF?=
 =?us-ascii?Q?SsxnnxzI+3v9YVBZwxpFxMeySBtblRDcN2ega5b267r3VhQKgap/lic54UZy?=
 =?us-ascii?Q?CgzfVKRdGM/WUlzuUvapfue86RkHWkWYQjl9JqxbbsQ0u9RL/FXQzNw1Sy6r?=
 =?us-ascii?Q?PNq6Bhd2EqcUbYj5ORXHHuaGlIbYJBa+Gfr8xKZlUUNZoVIldCOx+yD7g8Bc?=
 =?us-ascii?Q?mwrmLWPWhwIC0itOK1+aKvbJ+sbZPWhb77EJt93Ck9OXUFFsj7W5aHaTFaeb?=
 =?us-ascii?Q?nQuFUjB+WNDdimjl016Et9Ul/YWCa4QESo3IAc/MRU+rk1zUd5ltskTsgRfS?=
 =?us-ascii?Q?FdS1i6hAKnJIhFfeap8llXzTblHEvY3/brHmdD5eg10PQPduoaIfgoxk+9Q4?=
 =?us-ascii?Q?7wF/sVoqh5GRelQfa8iy3/VqUibRdv227DZcL9J9BsNz9xv2COOsBDt/Yiak?=
 =?us-ascii?Q?IhzAidx/+TdMMwoWVkXEbeAlbP8/T0uSDjzADeOYKS6bNiBxSC3jDU+TWvwQ?=
 =?us-ascii?Q?dcWIlzNiqnT83Rupf8w2fWrWeco3YVpHNxdMwbWtsJt00MIAR1yyu51F5lXs?=
 =?us-ascii?Q?fZwmuAXvy3yctqZzPA/lPtYVDiiFczBWovZb4lHrQsAz/Z/x0Yq38jJ26HIH?=
 =?us-ascii?Q?X73y4+Cu8tRsCtBe0FBAUr0ch5RK1A+DyJYys2eYbvK16C4fpvCJm7exTQtC?=
 =?us-ascii?Q?uyxCX9Kbrg8Pmr66VYL8kNoN6Ptxl3I0Vhh1ikOwR7QkiB9sIxRg4QbOkK4W?=
 =?us-ascii?Q?kWcSdkSCUEwFhZ9pluD1E8V/265rCccXAnONpgg8jfHVeeSkDmcfoynWKYtz?=
 =?us-ascii?Q?dA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <15CA0DF0EAEF494F8D08299179C6B7A4@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	IofcalGt2D4ofnpMxgWZTuG+JO6QfNj3gneU1s1X39m1J6LeTZO4MQpWpJkQSSp1XyHeTJr9NTIrfasofpA9zeVprcMoy3O4k8xwWG3aH3I5hNUsAfSP/UPQ7AfhpqRiY9ryWE1Z/RcgCURokZg3eChNxsti7lFBDp/KAvfhbCi/4OlbrAgdYtal99L92W0iBiAuYe1PKtMUR+OBhZicSnweoO7SNPYBvuG2zoKi5d7iauf6c8WlhYFZUzQL/0FcwnRQUbu5Hab59W5QaqHHkWVaGgA8fyX5knpZVnzmpudUs2XwlFjFcAyp4MPwi1bXNMOjhSxqReI03aSZ5EwNcWazS7/IsoPgyew4h8b0T1DxUriMVFcCbp/t+tuRLBY+ysXxJmQz3cvAgGV/OWpwPmenP69aT8ijJa8C5ToK2PbPIfja8+PClxcMy00MHS5Vz2vZzTHEopzEwauKjV4GgeR3v36QAQqCBZjRlh1eGcdSOKpuMEIzijQspK9QJlFFZJTui2yDf/oPsZBaAfY2pWlJit9zkVIaODRFCvUvxBAE2WbpO+5BQoc2ajfGFVowHNCQgshBH/d6wnTehWZZv/vXUkXOR5dFyfgVW0lTGfAgVVDj2aTMlLvpDWratzveX/rXI5SZEsmBrrsp1ePzmx/6s7cn/qaUwgF3kN2vBN6xboJGvAbfSEKYfQaayDU6z7MVwHW/Lj3UOJeSwpdj3B6JpMevIsef0d/8aXk6ZrSuUqx8CdiNELyPon8PsA7sueZLhSZf7bT6orm18Eoex1Y7cDCirxszPGCFluttIp6KpiQE7K2d3/pMmGBuJyDK2GVYCR/9LQQyb+/ogNnbsOgf329+5OeMuAfnBoxbxak=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 696e74db-e35c-4399-d5e3-08dad79b8cd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2022 15:07:10.8589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AKTxaoydIonU0Q2N5BcuhnQuQ/ZDZP6piX9EQZJ1ljZnlvC1tE/+aMe2OoF7eXOVPK2e71wP5RiYxTnA1+xOgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4616
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_10,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212060124
X-Proofpoint-ORIG-GUID: dokgrh0me6RfuNS7RjyS_iUBjKVKz6Lk
X-Proofpoint-GUID: dokgrh0me6RfuNS7RjyS_iUBjKVKz6Lk



> On Dec 6, 2022, at 1:37 AM, Dan Carpenter <error27@gmail.com> wrote:
>=20
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-the=
-not-so-distant-future
> head:   f8e9d79160e851ed451ae369605a41aa7e8eb41d
> commit: 3dde04ad0247bb28b707b6f2cfeec67ed229da03 [55/82] SUNRPC: Hoist sv=
cxdr_init_decode() into svc_process()
> config: i386-randconfig-m021-20221205
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
>=20
> smatch warnings:
> net/sunrpc/svc.c:1466 svc_process() error: we previously assumed 'p' coul=
d be null (see line 1454)

Agreed, that's a bug. Fix squashed into this commit.


> vim +/p +1466 net/sunrpc/svc.c
>=20
> 1cad7ea6fe98dc Ricardo Labiaga 2009-04-01  1448  	rqstp->rq_res.buflen =
=3D PAGE_SIZE;
> 1cad7ea6fe98dc Ricardo Labiaga 2009-04-01  1449  	rqstp->rq_res.tail[0].i=
ov_base =3D NULL;
> 1cad7ea6fe98dc Ricardo Labiaga 2009-04-01  1450  	rqstp->rq_res.tail[0].i=
ov_len =3D 0;
> 1cad7ea6fe98dc Ricardo Labiaga 2009-04-01  1451 =20
> 3dde04ad0247bb Chuck Lever     2022-11-06  1452  	svcxdr_init_decode(rqst=
p);
> 3dde04ad0247bb Chuck Lever     2022-11-06  1453  	p =3D xdr_inline_decode=
(&rqstp->rq_arg_stream, XDR_UNIT * 2);
> 3dde04ad0247bb Chuck Lever     2022-11-06 @1454  	if (unlikely(!p))
> 81593c4dff3226 Chuck Lever     2022-09-12  1455  		goto out_baddir;
>                                                                ^^^^^^^^^^=
^^^^^^
> p is NULL
>=20
>=20
> 3dde04ad0247bb Chuck Lever     2022-11-06  1456  	rqstp->rq_xid =3D *p++;
> 3dde04ad0247bb Chuck Lever     2022-11-06  1457  	if (unlikely(*p !=3D rp=
c_call))
> 3dde04ad0247bb Chuck Lever     2022-11-06  1458  		goto out_baddir;
> 3dde04ad0247bb Chuck Lever     2022-11-06  1459 =20
> d9ca78fb91eb62 Chuck Lever     2022-11-06  1460  	if (!svc_process_common=
(rqstp, resv))
> 860a0d9e511f27 Jeff Layton     2014-10-28  1461  		goto out_drop;
> 0b9547bf6b9431 Chuck Lever     2018-03-27  1462  	return svc_send(rqstp);
> 860a0d9e511f27 Jeff Layton     2014-10-28  1463 =20
> 81593c4dff3226 Chuck Lever     2022-09-12  1464  out_baddir:
> 81593c4dff3226 Chuck Lever     2022-09-12  1465  	svc_printk(rqstp, "bad =
direction 0x%08x, dropping request\n",
> 3dde04ad0247bb Chuck Lever     2022-11-06 @1466  		   be32_to_cpu(*p));
>                                                                          =
     ^^
> Dereferenced
>=20
> 81593c4dff3226 Chuck Lever     2022-09-12  1467  	rqstp->rq_server->sv_st=
ats->rpcbadfmt++;
> 860a0d9e511f27 Jeff Layton     2014-10-28  1468  out_drop:
> 4b5b3ba16be1b1 Andy Adamson    2011-01-06  1469  	svc_drop(rqstp);
> 4b5b3ba16be1b1 Andy Adamson    2011-01-06  1470  	return 0;
> 4b5b3ba16be1b1 Andy Adamson    2011-01-06  1471  }
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
>=20

--
Chuck Lever



