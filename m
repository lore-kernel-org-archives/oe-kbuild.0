Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84034320E;
	Mon,  6 Mar 2023 15:11:35 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 326CxDI7017773;
	Mon, 6 Mar 2023 15:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=otl6abXN6g67bHOGG1VKe/qQ2rknvg7Nv3f7vrBalVg=;
 b=Y/Th8PUeBe4YnOUf36Jt6sXYlfNN/pLcOnFbJG9y+vXX3FvEyYI06Ymvf8artje3RECo
 nXrSX71Ac5U2RV7UbKitlW6k045oaTR2mVplzAmp4yuFZ6E45d1iz2N/A0F3rNdNqx0p
 K/Bt7kSC4SNvuSZa45bADQd27u8ebtINvwdL4QRBh4p/SVuB9jcArWt1WxrE5fbujpKH
 eQUvJn/RDbuUa72HctlucvwVCJm9SzR7vHYcOP4+pIeqlxABGPjJDwp7xMiflwjkTRA9
 2UY7+JAAXS5tcQaheHupJxK/gGTlB+h44QXsBJ/YD1lUHY9z/keCQ7l2E9dYZ7wl3jPX Lg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p415633hh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 06 Mar 2023 15:11:27 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 326EL6sw024990;
	Mon, 6 Mar 2023 15:11:26 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3p4tthkugg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 06 Mar 2023 15:11:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DhY1Rtr/gSwQ+5l7XYCpO6H41UgqEPqUtbb/EAD4TeBviaPIwKGsipDLbq/+6cqC6IaWIlK6z7nuVEdmxy7HzUJcKoXl+wRzIFckDBHogatH1K8wY09UqqpgWovip1lAUmFwIkwUtkCKhrfnO240CQhlC0kGLR0NFQ8i9JZhEN6xvoEkclT29uRtA9t3iGriJwFCe4VT7T3gSG0+muKcJ7L/F0MFRQX59xK1OlTs+1733prhrvSQwRREPvUxCGpQqBeiPjJzlwV9JCSGFompldnK7JcIE2BEkWwx8oL5xOdiLkmJG2x9o1tpRQBcWviJ3SMQFFVP83mzVVe6BWcAtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=otl6abXN6g67bHOGG1VKe/qQ2rknvg7Nv3f7vrBalVg=;
 b=Yj3AoFL1BsxmR9m/rJtos5tcWccqFsmvd/ghr0PyLTka1mvJjI+jGcW8lPWORnamt55Gqk6lLleuGONITDh80No6ZBYSDv/P3NpFUB78cW6gOESEG5Rx2bY0dsPlL87MLEe0B0GCXRYrSIfSLI8goziGRgMGdX7EzZx2P8MLPAM2O0vOi9HOIkOgGTlYE77mKDNk09FfX4r5Lu9w/uId/Ot08UjVb1IWr50ODUfCpDQZ0ARdwIcUHpDCPvOArPG5OSxavCg5GjEY4rD4Ice+YsE7isihQsf429/6gzTE30WwpBy1N3QpglNvPzBbtaqi42117tYT1C0ZXOWOC7WlAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otl6abXN6g67bHOGG1VKe/qQ2rknvg7Nv3f7vrBalVg=;
 b=x3A2EWMPhw9M9LjKa+oBZRXBVHDF41oNhRRYmZyz3vEBsb4NKD5JE2bAfuNiQZVe5lyt0qew4hcjgH+75HyolfTkwxZAw8VY7i7z15VZJUlSqrZ805ciR0O3bxldnJcy6FO7XIcT/OP8V9o/DfAY3UJvsB5C9gyhQRNJ3ClcGn4=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by MW6PR10MB7615.namprd10.prod.outlook.com (2603:10b6:303:23f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 15:11:23 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::5c2f:5e81:b6c4:a127%6]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 15:11:23 +0000
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
Thread-Index: AQHZUBKxSY4sGmmn+06S4rsHLuiew67t266A
Date: Mon, 6 Mar 2023 15:11:23 +0000
Message-ID: <55614170-7D09-4865-9EA8-E9532D3E3F73@oracle.com>
References: <85ee6966-32b0-4ff2-8af0-2678ecf77609@kili.mountain>
In-Reply-To: <85ee6966-32b0-4ff2-8af0-2678ecf77609@kili.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.2)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|MW6PR10MB7615:EE_
x-ms-office365-filtering-correlation-id: 13bfef4d-2bb9-48f6-825c-08db1e550cc2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 g43XSeQ+0XnnZYuRmhyYKVPwDG5AI9299KJbJlxcxyyoZf+diCf3bNKl9tyD7d866+K6h+7mXhv63ufzMjeNQ8YM4cvERCskBZujw+A+J+ZXcmdVzx9CKg5E8cWhz08COM5AAfO8L15t1woh+zx2FR8+UkNwpN/1tMUinp/JhBASyKq47C4I9TnNUd4xORNT8l/tNmjIBVCniRU95lmAT1qFJgjyOnCXSu71zvbAzZF64fmCPAoE+sccr++SbQ9QbuhOaSUg99Zp0ROYpuA8L+uOjR2VqgXYo03qihIp4mfoRgdg53Aznd/T2i+P42j7sccDu0l46glM+9QE5bpZpSdHpgDmV6ArqluG1DGEQBEmZJ0sm94TY2u4N9/qrTkn4GLM8N0VH8RGn7yXuEWXtendRPA9hkLFsBIqJOeNJFMv5mI2Dr3feJX9UKNzlaORG+DvD3kce2U9Q4CoiQehIxICp/UUoalz3odwgnBqPQX90cnnEzsctc8oIr2JWkVCwdFmC8EdDnhvFgPZdDtGB6sQtIfydLjhlOV7lcMvQC2JP23NCI0H7cQwXuuZvWZ/KgE6+QzusNcyKG3K1IOZgPTECCkGmi1d0EKremQCSTkbgCJSTDk7ldd9Cilur/ocRWfpvvy27pITlqpzFoclISBqIjCEidbgENR3nt3XCgKjX0QsR72VKlGgHHVm6RV0i9Nuk2UbbhiKW7rcr83AUEMX53+H1ciTB4m6CvxqQNNYpyXHMw804JZNh1ikTGaXcObQidlLc1qhkfZ0dSgD5w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(346002)(136003)(376002)(396003)(451199018)(54906003)(966005)(316002)(36756003)(83380400001)(33656002)(86362001)(6486002)(186003)(2906002)(5660300002)(66476007)(76116006)(66446008)(66556008)(8936002)(6916009)(66946007)(41300700001)(4326008)(8676002)(478600001)(53546011)(6512007)(6506007)(26005)(64756008)(2616005)(71200400001)(122000001)(91956017)(38100700002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?d8bf6au7Tq1UWlsuPcLUKuGtEeJQ1MJObpS7znX9uhOI9apa+ljR9H+Pso6d?=
 =?us-ascii?Q?AEr97q6wqW+IKF/olCMIr6ngXys1rH+zc8fuj8Ii8L+qy+LIEIdrzfKzEtUp?=
 =?us-ascii?Q?h9nrR8ww3u4iJkjevREALlytilbEEhmw9Gst4cQAEQ7iGjKVHlNCGEtwajbb?=
 =?us-ascii?Q?J3NSqu/jCmHouRLPApd91DiXYAdpg7Rp1sJWdcAKgN3oRG/h6tGKibsDSgxU?=
 =?us-ascii?Q?dZUmv81gmQklFoBuVHwYoy8foMrgBsXbSGMT/C2bbWUJS3Ihy+U8DJ2cDKVA?=
 =?us-ascii?Q?W3MShi5SpL6uC00v84uFRjrR+76/+1c65lq5w3iGS30eF37TXdPneKFuZtwr?=
 =?us-ascii?Q?pV4hw7BDZgFBn2wPDiJ/GXRlZ/2GPM9e0DACFmPN4yzz6HPoXYohA64M1Hdk?=
 =?us-ascii?Q?pk8vu57VMLq8ydOyfkCyEnTp/8GB8RZNKKzFU3AatcvL+QD5zzqGciyDLUT/?=
 =?us-ascii?Q?3lhSq0X1JF0sySIyaoWPFlFIGpRHWBVIujtEgAXlzS+FAgA70fIcOUCXXi2W?=
 =?us-ascii?Q?XQZ/Pc/K+hL90C/P84PYykLa9uj+RdDrure/6HA/vWXw3OPPGW8sFONvZK7a?=
 =?us-ascii?Q?Dn3DVafGvfJr4JXb9Y8A+ARfc0NKVgC3K1OtdM7gag1HiP9EeBtksciGLn4/?=
 =?us-ascii?Q?O65PFeT8e/W1GhAOML52pmGtO0banLjANc+rqB/Tysudkn6ZDGnGvFNvHHeT?=
 =?us-ascii?Q?zRnjwAGbWdpDCER7avzIK+F4h6gFkHWBfcyFd9/4Zyypf+VgKiG5PH2tmvBo?=
 =?us-ascii?Q?B83fFIKb7POcECG6bMRkVqRUi9PTtYJq2t1/pKGvQwAG3iQIb+RKAK/jFLd1?=
 =?us-ascii?Q?8lv8YXu1nOYehCSasGPkzzkQQC8hXwH7PpKEKazWX7ejOVd7RqtEldd8gtSy?=
 =?us-ascii?Q?tLP6bJakDSRM3S+xFkacKivHrbtVY6/NQZytjWoBZjRBAdpa5zEZ3QPpnhsI?=
 =?us-ascii?Q?V7C1OXCOQW3yrt6ytnzkcknjAee1ur6lXd/wWn7RgtW4UcX+trpg/+haAp1c?=
 =?us-ascii?Q?ONVSdY8HXx7lj2JRWLx++ClH7gY+NWBINzOKT4zaEOIvc1t0NlO1n5jCz8OV?=
 =?us-ascii?Q?eqEv/3AxiV6zOQ8SEroG0ZdMoexudJJr4NFPWeFHAfCW7eHrUM39inAgo7wK?=
 =?us-ascii?Q?IdOf36G6ik4MCCS7WzSvGpYtknlO995yGwR5Tcwb5WKjxbj/cbza+kaLG5N7?=
 =?us-ascii?Q?/ZYVVtXvaa/3TXPwv1M59pMaAbK8npqRMSq84+DO8VirJGYFTE5QRLdfSc+u?=
 =?us-ascii?Q?rV3ZP3sDx2Dm8cI3f+nkH2fQjbADZBlMbwzcyT1btOegrYQuDo02q5yUAZGX?=
 =?us-ascii?Q?i5jYg5GmOvUiPWzMKi5kh+VFJBiDaalEFzehxBNIJLcD43b1oBhBwGL09+hf?=
 =?us-ascii?Q?+kRlq5SxyISbXMDbuv7uWIRLvwlSXbnQbvdN1+tlVQ9x+I1MBfyJ5GlBTbCl?=
 =?us-ascii?Q?EuZQ4t8hqWTGJKj1PuCW9TLfsIz/FvtczkPKqSPKAAl1rDjGzPv5X+2wviiu?=
 =?us-ascii?Q?48S+Nzpku/uvOeVDvLYWyC20rE7tlVfrrgu8cKFelqFTUSPL2tt00K3A/Bzt?=
 =?us-ascii?Q?MKUMDC4RusnLFsvZuXoxtk5erkVTHub1Zjzy50kbG9nNbPCgWg0f7DYvqQRa?=
 =?us-ascii?Q?IQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F6324230654CB74FB222F0189F901C4B@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	T7GMlxHHrhMnimnOKOxJK+zLQ3FyBQQCIsrHbYdcsPRSdFOCYLPSigNDeVbJCD6HrH+U/4d/tkg3PhUF4yqKznWAZ0XDpBQIp4tycXtw+Y9bMSqRdEtKG91Sfti6evLNrkYXQYXXgldSrmqfmUSB0OojXsxh/1glEoIIETSwah1AWNFqnWQN7ozLlo/DlpakNIc3c6HDZyvvVaKZPF6rD+9YDex2ROOXJcWmpnYwQ128BfQ7zpScxoIWHT0+6QnIvvB794wTI2kiWO9H3URzFexsRbCdt2LAKtRDs194mDmRvmWH0q3czrLgbV66gBGdiFHtyiQd1TYdVHOrwMkJBYVtpjkOUlacLbFyEnv/sAsfuvYtyyUcX6nUEz5EDLQrersb/eXBv8mQQJp2i2VvQTmeVoSaw8eReUd8PJzPFXs0tBWOxpwngsYMG2/zyFJSsggfbGUyKh/gj5hTgi+sEo5ur3C+eWmb/yxbCZmoFB4tnGN9TvMvcC3F1D/JCMoH1AAWgHg3rbHQ2mieaupEuweSh4LTeDe7Ala1uXtfnBi/sl3bC6Lu5BHOvcXj4B2kNlXFf6ITWHGNBvc2WNE6ZqxDqA2DN3jj9s8pAp8LztLWwkiZix6D41njzGO8zF/ZzeGm1e538SupjQQwBVg7fH45Znk4WnxIAMup6BDukib214vlKSOKsStyIcwuTjhwZy8+xpjRdrRLo41dUvXF+WwqQfPC5owcE1yKNMmQX7jUxKaf6dYsKKvip4qhPtP8Ec7kkuJNcTUbjh8x8hLHOwLE9qB4vH+BXH3TU2vtYcQ8oslAR0jrf2iHydg3Nlq5
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13bfef4d-2bb9-48f6-825c-08db1e550cc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2023 15:11:23.8028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sXyOd9+Qlr1ZM96bhDvdB1I0GVYfb/RLN6NJX7EHxeuYSILmuib0cRJhu4U0y8bpUvXMS98BgbF5+28KUdKfyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7615
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_08,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303060134
X-Proofpoint-GUID: 16EQ8xDYi5iW7wEObJWJ-vGMvz5omaSq
X-Proofpoint-ORIG-GUID: 16EQ8xDYi5iW7wEObJWJ-vGMvz5omaSq



> On Mar 6, 2023, at 5:01 AM, Dan Carpenter <error27@gmail.com> wrote:
>=20
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-rpc=
-with-tls-upcall
> head:   88897fb973ffb2448e3452ca4e9283908bd257f6
> commit: d166e9ec5e3800de085444eca5883ce1738f6cb3 [1/18] net/handshake: Cr=
eate a NETLINK service for handling handshake requests
> config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/202=
30306/202303061707.ICwrtQsr-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Link: https://lore.kernel.org/r/202303061707.ICwrtQsr-lkp@intel.com/
>=20
> smatch warnings:
> net/handshake/netlink.c:187 handshake_nl_accept_doit() error: uninitializ=
ed symbol 'req'.
> net/handshake/netlink.c:240 handshake_nl_done_doit() error: uninitialized=
 symbol 'req'.
> net/handshake/request.c:193 handshake_complete() warn: test_and_set_bit()=
 takes a bit number
> net/handshake/request.c:236 handshake_req_cancel() warn: test_and_set_bit=
() takes a bit number
>=20
> vim +/req +187 net/handshake/netlink.c
>=20
> d166e9ec5e3800 Chuck Lever 2023-02-19  142  static int handshake_nl_accep=
t_doit(struct sk_buff *skb, struct genl_info *gi)
> d166e9ec5e3800 Chuck Lever 2023-02-19  143  {
> d166e9ec5e3800 Chuck Lever 2023-02-19  144  	struct nlattr *tb[HANDSHAKE_=
A_ACCEPT_MAX + 1];
> d166e9ec5e3800 Chuck Lever 2023-02-19  145  	struct net *net =3D sock_net=
(skb->sk);
> d166e9ec5e3800 Chuck Lever 2023-02-19  146  	struct handshake_req *pos, *=
req;
> d166e9ec5e3800 Chuck Lever 2023-02-19  147  	int fd, err;
> d166e9ec5e3800 Chuck Lever 2023-02-19  148 =20
> d166e9ec5e3800 Chuck Lever 2023-02-19  149  	err =3D -EINVAL;
> d166e9ec5e3800 Chuck Lever 2023-02-19  150  	if (genlmsg_parse(nlmsg_hdr(=
skb), &handshake_genl_family, tb,
> d166e9ec5e3800 Chuck Lever 2023-02-19  151  			  HANDSHAKE_A_ACCEPT_HANDL=
ER_CLASS,
> d166e9ec5e3800 Chuck Lever 2023-02-19  152  			  handshake_accept_nl_poli=
cy, NULL))
> d166e9ec5e3800 Chuck Lever 2023-02-19  153  		goto out_status;
> d166e9ec5e3800 Chuck Lever 2023-02-19  154  	if (!tb[HANDSHAKE_A_ACCEPT_H=
ANDLER_CLASS])
> d166e9ec5e3800 Chuck Lever 2023-02-19  155  		goto out_status;
>                                                        ^^^^^^^^^^^^^^^
>=20
> d166e9ec5e3800 Chuck Lever 2023-02-19  156 =20
> d166e9ec5e3800 Chuck Lever 2023-02-19  157  	req =3D NULL;

Moving this line earlier in the function should address this
warning.

Note that the tracepoint does not dereference @req, so there
shouldn't be a crash.

Thanks, Dan.


> d166e9ec5e3800 Chuck Lever 2023-02-19  158  	spin_lock(&net->hs_lock);
> d166e9ec5e3800 Chuck Lever 2023-02-19  159  	list_for_each_entry(pos, &ne=
t->hs_requests, hr_list) {
> d166e9ec5e3800 Chuck Lever 2023-02-19  160  		if (pos->hr_proto->hp_handl=
er_class !=3D
> d166e9ec5e3800 Chuck Lever 2023-02-19  161  		    nla_get_u32(tb[HANDSHAK=
E_A_ACCEPT_HANDLER_CLASS]))
> d166e9ec5e3800 Chuck Lever 2023-02-19  162  			continue;
> d166e9ec5e3800 Chuck Lever 2023-02-19  163  		__remove_pending_locked(net=
, pos);
> d166e9ec5e3800 Chuck Lever 2023-02-19  164  		req =3D pos;
> d166e9ec5e3800 Chuck Lever 2023-02-19  165  		break;
> d166e9ec5e3800 Chuck Lever 2023-02-19  166  	}
> d166e9ec5e3800 Chuck Lever 2023-02-19  167  	spin_unlock(&net->hs_lock);
> d166e9ec5e3800 Chuck Lever 2023-02-19  168  	if (!req)
> d166e9ec5e3800 Chuck Lever 2023-02-19  169  		goto out_status;
> d166e9ec5e3800 Chuck Lever 2023-02-19  170 =20
> d166e9ec5e3800 Chuck Lever 2023-02-19  171  	fd =3D handshake_dup(req->hr=
_sock);
> d166e9ec5e3800 Chuck Lever 2023-02-19  172  	if (fd < 0) {
> d166e9ec5e3800 Chuck Lever 2023-02-19  173  		err =3D fd;
> d166e9ec5e3800 Chuck Lever 2023-02-19  174  		goto out_complete;
> d166e9ec5e3800 Chuck Lever 2023-02-19  175  	}
> d166e9ec5e3800 Chuck Lever 2023-02-19  176  	err =3D req->hr_proto->hp_ac=
cept(req, gi, fd);
> d166e9ec5e3800 Chuck Lever 2023-02-19  177  	if (err)
> d166e9ec5e3800 Chuck Lever 2023-02-19  178  		goto out_complete;
> d166e9ec5e3800 Chuck Lever 2023-02-19  179 =20
> d166e9ec5e3800 Chuck Lever 2023-02-19  180  	trace_handshake_cmd_accept(n=
et, req, req->hr_sock, fd);
> d166e9ec5e3800 Chuck Lever 2023-02-19  181  	return 0;
> d166e9ec5e3800 Chuck Lever 2023-02-19  182 =20
> d166e9ec5e3800 Chuck Lever 2023-02-19  183  out_complete:
> d166e9ec5e3800 Chuck Lever 2023-02-19  184  	handshake_complete(req, -EIO=
, NULL);
> d166e9ec5e3800 Chuck Lever 2023-02-19  185  	fput(req->hr_sock->file);
> d166e9ec5e3800 Chuck Lever 2023-02-19  186  out_status:
> d166e9ec5e3800 Chuck Lever 2023-02-19 @187  	trace_handshake_cmd_accept_e=
rr(net, req, NULL, err);
> d166e9ec5e3800 Chuck Lever 2023-02-19  188  	return handshake_status_repl=
y(skb, gi, err);
> d166e9ec5e3800 Chuck Lever 2023-02-19  189  }
> d166e9ec5e3800 Chuck Lever 2023-02-19  190 =20
> d166e9ec5e3800 Chuck Lever 2023-02-19  191  static const struct nla_polic=
y
> d166e9ec5e3800 Chuck Lever 2023-02-19  192  handshake_done_nl_policy[HAND=
SHAKE_A_DONE_MAX + 1] =3D {
> d166e9ec5e3800 Chuck Lever 2023-02-19  193  	[HANDSHAKE_A_DONE_SOCKFD] =
=3D { .type =3D NLA_U32, },
> d166e9ec5e3800 Chuck Lever 2023-02-19  194  	[HANDSHAKE_A_DONE_STATUS] =
=3D { .type =3D NLA_U32, },
> d166e9ec5e3800 Chuck Lever 2023-02-19  195  	[HANDSHAKE_A_DONE_REMOTE_AUT=
H] =3D { .type =3D NLA_U32, },
> d166e9ec5e3800 Chuck Lever 2023-02-19  196  };
> d166e9ec5e3800 Chuck Lever 2023-02-19  197 =20
> d166e9ec5e3800 Chuck Lever 2023-02-19  198  static int handshake_nl_done_=
doit(struct sk_buff *skb, struct genl_info *gi)
> d166e9ec5e3800 Chuck Lever 2023-02-19  199  {
> d166e9ec5e3800 Chuck Lever 2023-02-19  200  	struct nlattr *tb[HANDSHAKE_=
A_DONE_MAX + 1];
> d166e9ec5e3800 Chuck Lever 2023-02-19  201  	struct net *net =3D sock_net=
(skb->sk);
> d166e9ec5e3800 Chuck Lever 2023-02-19  202  	struct socket *sock =3D NULL=
;
> d166e9ec5e3800 Chuck Lever 2023-02-19  203  	struct handshake_req *req;
> d166e9ec5e3800 Chuck Lever 2023-02-19  204  	int fd, status, err;
> d166e9ec5e3800 Chuck Lever 2023-02-19  205 =20
> d166e9ec5e3800 Chuck Lever 2023-02-19  206  	err =3D genlmsg_parse(nlmsg_=
hdr(skb), &handshake_genl_family, tb,
> d166e9ec5e3800 Chuck Lever 2023-02-19  207  			    HANDSHAKE_A_DONE_MAX, =
handshake_done_nl_policy,
> d166e9ec5e3800 Chuck Lever 2023-02-19  208  			    NULL);
> d166e9ec5e3800 Chuck Lever 2023-02-19  209  	if (err || !tb[HANDSHAKE_A_D=
ONE_SOCKFD]) {
> d166e9ec5e3800 Chuck Lever 2023-02-19  210  		err =3D -EINVAL;
> d166e9ec5e3800 Chuck Lever 2023-02-19  211  		goto out_status;
> d166e9ec5e3800 Chuck Lever 2023-02-19  212  	}
> d166e9ec5e3800 Chuck Lever 2023-02-19  213 =20
> d166e9ec5e3800 Chuck Lever 2023-02-19  214  	fd =3D nla_get_u32(tb[HANDSH=
AKE_A_DONE_SOCKFD]);
> d166e9ec5e3800 Chuck Lever 2023-02-19  215 =20
> d166e9ec5e3800 Chuck Lever 2023-02-19  216  	err =3D 0;
> d166e9ec5e3800 Chuck Lever 2023-02-19  217  	sock =3D sockfd_lookup(fd, &=
err);
> d166e9ec5e3800 Chuck Lever 2023-02-19  218  	if (err) {
> d166e9ec5e3800 Chuck Lever 2023-02-19  219  		err =3D -EBADF;
> d166e9ec5e3800 Chuck Lever 2023-02-19  220  		goto out_status;
> d166e9ec5e3800 Chuck Lever 2023-02-19  221  	}
> d166e9ec5e3800 Chuck Lever 2023-02-19  222 =20
> d166e9ec5e3800 Chuck Lever 2023-02-19  223  	req =3D sock->sk->sk_handsha=
ke_req;
> d166e9ec5e3800 Chuck Lever 2023-02-19  224  	if (!req) {
> d166e9ec5e3800 Chuck Lever 2023-02-19  225  		err =3D -EBUSY;
> d166e9ec5e3800 Chuck Lever 2023-02-19  226  		goto out_status;
> d166e9ec5e3800 Chuck Lever 2023-02-19  227  	}
> d166e9ec5e3800 Chuck Lever 2023-02-19  228 =20
> d166e9ec5e3800 Chuck Lever 2023-02-19  229  	trace_handshake_cmd_done(net=
, req, sock, fd);
> d166e9ec5e3800 Chuck Lever 2023-02-19  230 =20
> d166e9ec5e3800 Chuck Lever 2023-02-19  231  	status =3D -EIO;
> d166e9ec5e3800 Chuck Lever 2023-02-19  232  	if (tb[HANDSHAKE_A_DONE_STAT=
US])
> d166e9ec5e3800 Chuck Lever 2023-02-19  233  		status =3D nla_get_u32(tb[H=
ANDSHAKE_A_DONE_STATUS]);
> d166e9ec5e3800 Chuck Lever 2023-02-19  234 =20
> d166e9ec5e3800 Chuck Lever 2023-02-19  235  	handshake_complete(req, stat=
us, tb);
> d166e9ec5e3800 Chuck Lever 2023-02-19  236  	fput(sock->file);
> d166e9ec5e3800 Chuck Lever 2023-02-19  237  	return 0;
> d166e9ec5e3800 Chuck Lever 2023-02-19  238 =20
> d166e9ec5e3800 Chuck Lever 2023-02-19  239  out_status:
> d166e9ec5e3800 Chuck Lever 2023-02-19 @240  	trace_handshake_cmd_done_err=
(net, req, sock, err);
>                                                                          =
        ^^^
> Uninitialized.
>=20
> d166e9ec5e3800 Chuck Lever 2023-02-19  241  	return 0;
> d166e9ec5e3800 Chuck Lever 2023-02-19  242  }
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
>=20

--
Chuck Lever


