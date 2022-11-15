Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1431FC1;
	Tue, 15 Nov 2022 03:15:14 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AF0qbxh011984;
	Tue, 15 Nov 2022 03:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=cBb8UI7pQQU4pCj0vTpeJK1rJI5Q+ehsP6lE5nIU4K4=;
 b=ZtC/1CVag8ZjBzKNraVG4qZHvAR0wEpch5na6/9u8/vRox2hJFr+G2CKwgnexzowc+/3
 p6TsvU92wKnYmE+6gylNCr6zo72X6mzOpGlMI607rXM0bdBBtXFk1eJ3/ey8pL5rrJfJ
 yEmrBAOy/qtlC+XJse9D07nd8v1emuTZlOFM+Qj626QrjZIXdSMvplinNnTxH5g3Z0we
 SlaCbMr4xqTFwsuEHBNSUNHx0xWWfEhmY5RO8dy9ORnkiKzFqYQ2+dsrQz0k37V/CEYC
 LMQh/oBfhq9D6n7CgLnluUsJ5N0ntLy+OB+WUcwu7ZdiALPQP2cPX7fXpcO3jFsjXlg8 /Q== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kut2dhc3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Nov 2022 03:15:05 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 2AF0j1R0031937;
	Tue, 15 Nov 2022 03:15:05 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3kt1xb46y3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Nov 2022 03:15:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGKLhNs8t88E3QcStGAjoxzF9L5zMSJn7CCCDWpWpDyUpPRi3hbEc0jk+pIR6KhnqxJQdGVpx+6wZK2IkPd99pirPIFywKy70QgJ6XUbsHRzEkk1p4+FcqP+7l+RbllSVlEC4tvfsSwM4it/vAtwgBYSb03BMfmaYI6/YNbl87TK69JuczmubfY6G+IPCWvt269vpSegjvBHsHiHqZn8QGrqiSEVhrSRJhfK+kQy4E+XUbbMUcgvRafmUr3ahEq+9qQU5gxSEo94JzBccSSatq406DR06fTEZzI047zM96dNQNokxZlbQVuTOrJ9U1CISdR0VhHqYiApjpwxmELF5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBb8UI7pQQU4pCj0vTpeJK1rJI5Q+ehsP6lE5nIU4K4=;
 b=QlJLZfG8TiN8QDnKlWy5K2thLzvQ8wFrHHTQgL0jdFIhOF1XJ9sFG6kjQcs3KxVpbIoaKpEOEYbuK2MyUVPLZRpUC7/ScJ1CvCQRirHklTmBEkOY/tyXqRnMxeV19A4GIbw2AbwwlPl77YOFsiUu7m9394wNBbwePA2nvDk9J1RGd78wAV+bzYlFcFRa7fUboKakIKcT/HcAWl2g8SsAXYM1jxiejKmxEYrGeNeNc4ZeUrrjEwwZYgALj1kMW3XIu8a28rOC7Anhw5f9MLAfKf10v3WugGkxyH1jL3ZyBblvFikQH+w09xq9kuovkoAWWbA1mFqZKpk5i1442c9rYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBb8UI7pQQU4pCj0vTpeJK1rJI5Q+ehsP6lE5nIU4K4=;
 b=SQBwbzh6JF/o9dXE8E+/dk6EP3h1rGmenCCSndl8qafHqKR7IjfbZcWtNH/tx0mfhOnYuhOrYcCbBzd8u9UU2zMgq0K4+5PlEqrMiiCiEWLlF3svY9BESUqS35ICOauEVcSKDMGiidBD17p5b7/RWPANXd1pFvqCsBHkuK1JR7w=
Received: from CO1PR10MB4499.namprd10.prod.outlook.com (2603:10b6:303:6d::12)
 by DS7PR10MB4990.namprd10.prod.outlook.com (2603:10b6:5:3a5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 03:14:57 +0000
Received: from CO1PR10MB4499.namprd10.prod.outlook.com
 ([fe80::cf19:c99b:d8bd:29]) by CO1PR10MB4499.namprd10.prod.outlook.com
 ([fe80::cf19:c99b:d8bd:29%9]) with mapi id 15.20.5813.017; Tue, 15 Nov 2022
 03:14:57 +0000
From: Darrick Wong <darrick.wong@oracle.com>
To: Dan Carpenter <error27@gmail.com>,
        "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
CC: "lkp@intel.com" <lkp@intel.com>,
        "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [djwong-xfs:vectorized-scrub 461/498]
 fs/xfs/libxfs/xfs_refcount.c:2007 xfs_refcount_recover_group_cow_leftovers()
 error: we previously assumed 'pag' could be null (see line 1944)
Thread-Topic: [djwong-xfs:vectorized-scrub 461/498]
 fs/xfs/libxfs/xfs_refcount.c:2007 xfs_refcount_recover_group_cow_leftovers()
 error: we previously assumed 'pag' could be null (see line 1944)
Thread-Index: AQHY+ALResxEEDH7CEaQJtalI/8GU64/UHf8
Date: Tue, 15 Nov 2022 03:14:57 +0000
Message-ID: 
 <CO1PR10MB449922014E457D117AE24923F8049@CO1PR10MB4499.namprd10.prod.outlook.com>
References: <202211131931.iBIVNoRG-lkp@intel.com>
In-Reply-To: <202211131931.iBIVNoRG-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR10MB4499:EE_|DS7PR10MB4990:EE_
x-ms-office365-filtering-correlation-id: 59f01fe7-21f1-4a5a-f582-08dac6b7933f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Siczcnheo4hihV4ll5a8NFDBFujNZw1ZA78QQt0qjRZcQodH7GwxO+wJGTHLcgkXxnIkmXuI0nbz9MldAgKNRJLAcbrk5/+62phGr0/mwwAhA29WcxkSpAq8lb0wPOc9CiA2Z7vgL8SLGCGVMExjqfI8fhrSoC13HBscf6Kqt+Gi2kudEPSvgpDMaUDp5fRSPu/G50oo5FAlcfbOnjr+pnudrONAeN+xapyC1E8NWNSIDcahZCBaxenqZfcDPQxBzpYt3QIxygADS8BBR6Ad4TwIjNHBzjx7imkmXhALAZgQGpdWKxoqWyXSTifMKWUTWz2+5QMTPEWEueXXpAlwL3zUnTzp3xI7qI1qUTkVsAv3UpS7nspN10Rrviu3gfYNlSe+R6ipcGeLJzkeJhjzVdt/pNQr1TBr5OhklAkf1IPtVEhveGEFzTPLUviqO7iiyX/XNVoYZTI3K0vpeHIeL/NLP+FLVPsAVK6f445zcJGIXRJOaWMcHDLwLU4v36g6uV0f2sDx4th4wwvKN6W21RHSWBTOs8fdmdN1yysWrSYY7q3Vo/rkCTUDe9ZTk7VN73fXJ+G2/gVXfeUlwDhXyMcQHl+MRO7xiOS6/SHSyCs3LS8pomyMAUDKH3GgpIjKGisTKIVtP58Pi4q7tv7N7cX5D+IvcviVscB2xwfEy83m65Q3s9F06XZR0i0Yqr0ocWJaRWbDcLhz0mBoXUSLZ/ahngflCUj8+xo0XyiRaIfOrFeVpw50YYosS9g+U3NQWM7vwqmKJMoUfEIwF5DegZfK07YdWWQTZ3jGwSHGiELKbLXsUHyGfc2U2qwrBiaGX0dx8OEroib9wMWGq/S7GQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4499.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(136003)(396003)(376002)(346002)(451199015)(966005)(55016003)(4326008)(478600001)(71200400001)(38100700002)(64756008)(8936002)(5660300002)(52536014)(44832011)(54906003)(316002)(33656002)(110136005)(66446008)(66946007)(91956017)(86362001)(76116006)(38070700005)(83380400001)(122000001)(66556008)(66476007)(186003)(7696005)(53546011)(41300700001)(26005)(6506007)(9686003)(8676002)(2906002)(4001150100001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?AqvVKZSNGOpm3h9yZepC6jpvP7FSpvk5Pd/zKKbLGEij/ahFCpAtXv1Hqx?=
 =?iso-8859-1?Q?vQFj7bYsp5zGVk0js3zdb3IPzG1CtaKYmhQjBepF6jgcyDcfX3zk2f8GKU?=
 =?iso-8859-1?Q?12tznlyseM4RoUuJMTPqsMmFfpmkOeUzJR9ynhQX0vpH/Z3RFVyWsNNwWk?=
 =?iso-8859-1?Q?3KvwxGrq82XziaYKsv3sQzbMt4u1YH7U9wmFXgONN9TmqylbPCtwCUnsJZ?=
 =?iso-8859-1?Q?yo93nlcJoYrsIrdE87L5LAK07roHBBzUyLcRSX7J2ULnSNKMlN7vJcpA2V?=
 =?iso-8859-1?Q?oPaTIN0Bv0r8H3nxqf7kQqNarBBNcVwMAo+VRjfNbWy7A3lzva3KaMTxqx?=
 =?iso-8859-1?Q?9QWoN9YM+oVjw2rRE3CQHZgNud8I4DrGUzb3AXiJvZSxRoIEslPgS826sS?=
 =?iso-8859-1?Q?h05abwECD5Q8bnO+1XsQv6GNAyuGG9EP00glVZ1VThIRK1o/VJELae6Hgv?=
 =?iso-8859-1?Q?E/92b/tUYeGSqRIhNczhjAjBU5j6KgorNLZ8OtS2bgfBb1B33cJPd+Nvqn?=
 =?iso-8859-1?Q?JkFGgjHx4c1i4prH55ENBfgHwBVdRKWXYdIumxPXi3ETrB/idxfEiy+bes?=
 =?iso-8859-1?Q?SE4tef16xkUc0mTVkaImpIlkp3B4jXtOC6Rr3yobPKv2VZ4qSSPFvQPX3C?=
 =?iso-8859-1?Q?DqQlFAWwYj76xCcdZLIzKy5n9acnFWxpReDUFeIM3y8K6diMIm4z3+wzCw?=
 =?iso-8859-1?Q?YT+JVnpAlCy3pMHSClTGzNBik1iQA6MhPGK7kuzOKrlJjj5V1BaJ41BpmU?=
 =?iso-8859-1?Q?onUVvi8Fe8Rz3mRG7lkeUmWDhutpLaO8wZKJ3LqaJF20pyLA+PhUlvQWkN?=
 =?iso-8859-1?Q?CIVVUl5a+BnoB67iC2s21EP481lKAMvO1iJrPLWltAmL2nRvfvUw5jbp29?=
 =?iso-8859-1?Q?WsHk3chRRpuzBCCbuufloTYxrz37tQ2g6aUyynQ2z3w9MkzDBblRmTLbJt?=
 =?iso-8859-1?Q?PD+uEOspQetb2YFzdPEeYAEbMD6KO9Ua7iqdRdbJlw8ZiYP/nbjRDSd3tU?=
 =?iso-8859-1?Q?c26ei5jnoJ2+9TXB/ETZPL4x1Vg8AS+sMTsNKwptF5SFjsvFz052CqpNtk?=
 =?iso-8859-1?Q?m9EZwXlGEvTciPZ8hHdGKQiU0cPV9vklAgUb85KquHHkDGPeXRkwNTqV1M?=
 =?iso-8859-1?Q?foeMd1CPwVakjnr9WWQYvGoa998qOyVuQM3OSSfkxoUYAYmmNBvuETmp0E?=
 =?iso-8859-1?Q?/LcuqufsYup0sMqqHmTSqo8TBLVsmHrrn692/2F9K+V2c5FsDFlWvLX8Te?=
 =?iso-8859-1?Q?QKfnu8XXn1CWuVj57H2cSHesklHAbeC78PhpEQHVUgAYufZKMqzcHUvx4m?=
 =?iso-8859-1?Q?yOMd1hoU2mm/7ML4AzBTqFYRSWD2l5L7MTLwCxYgJ3JDjY6aSDT6wVBrOp?=
 =?iso-8859-1?Q?9DRodOmoyfO6ZwBi6vABVavA1dvmh33vPyAwLEa7J2Gj7947m1Wey7Etxm?=
 =?iso-8859-1?Q?Uxx+ZmFtvWi3FS+C2NutfaTJgOsCqa8hYptr17+eYv+yDBsblw0MDS5/K2?=
 =?iso-8859-1?Q?MoDfhAhY30Zol/U73jIj3805h142pGTATwXnlaXK+kZ4MuJQWDzCWcy1mL?=
 =?iso-8859-1?Q?HappSol+bgxFl/tP/1ogXgsa/2ENp0mDBFa9KhboLr5zrl/cBHYaecb1QB?=
 =?iso-8859-1?Q?fIfkgBPry29DvvXZ51+CxdBoIto37Lq8a2?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	lnGrvpzCMnatA64A7Ey7h+jtKayusfktwC+8d0mHVOya68KW4l3WbPTC3ORDrsT0OrbjUz+UcENdgKxvHOvbjHob2odt37xwoGX15NoNCDDv+Lnm+B534zsaqj4bv6HgIxrDXpzab3qltCG4NMqG12cnB4TelqqBja8+UQUkK4B3zyC/tY/thzR+wcPUsO/iYeVJTny3HKl5FTNmxi43Z1F/pWcFe8+xNqFgw3HywWtZ/4rWiL7vSesPPekW2zuOHv8cC9nBdltt7NKPmsxvIGkYsAxC7JSMQ5BCqKWnBHs4//SGy+g1M39cwMPVKG2X9PQQHkLGKdgeFZ8KkOEeQj9Qn5PRS//zJbw6qV+q7Jb6BoQ1GI7R7iJq0Su0EGlZIDfL9+qCXSKdXNV/3QeF72bShN8BTBo6gnBuVyBgt2QPg+LuNc8MdT8mupAlL99Acdo6WpikkHcDiXAVH95XHQUKfIOJrjV5/pZqY+ya5NmTZ+wKH6h9qS0PS3kLGEIrm+G0wTaPEVL+5c9wSdl2yCi+XwmS0utx9czplf389BkfWq03WTn6GdX6t7V+K5F9IMGJjDzZpCxmlCwAlbtu1IC7GI0pvnQGtXbIbTL0ZhJoL4Qypi6tSNu32ei/bb4LsIM40dOB3MbTN35IZjdRrf1nztSheS8Q8rTe2vweRAdeAZK5Dn7JVim3X5hEWxf7Gm3FEPWQRxLuZvbE709aOfPKxkuAYrcsMnCnPKjuLjIpiuyUbHfl8eqUgKFy+CSNKUduHgfMxIP9pV8KBvfK/Dd+g9OYvXcDuQ7CjIU71l+s6Wu7RjnIOyposJC+MrH0r2bapVP3zGgTwaHlXbVD0Tr7s5JdFsJB0h5uDITf4RI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4499.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f01fe7-21f1-4a5a-f582-08dac6b7933f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2022 03:14:57.7478
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YPU/h9qUGhieW0boXZO37x/Jw2FIjmSITTym7LBCxEypWY/DHsMkH9ctdwAvUw3270Gd336dhGFuNgVVmF7QGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4990
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-14_15,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211150023
X-Proofpoint-GUID: QA2DNA-Y75SWuWFt36LvCY05Ama-eJGN
X-Proofpoint-ORIG-GUID: QA2DNA-Y75SWuWFt36LvCY05Ama-eJGN

@pag can only be null if @rtg is non-NULL.  See the two non-static callers =
of that function.=0A=
=0A=
--D=0A=
=0A=
________________________________________=0A=
From: Dan Carpenter <error27@gmail.com>=0A=
Sent: Monday, November 14, 2022 00:26=0A=
To: oe-kbuild@lists.linux.dev; Darrick Wong=0A=
Cc: lkp@intel.com; oe-kbuild-all@lists.linux.dev=0A=
Subject: [djwong-xfs:vectorized-scrub 461/498] fs/xfs/libxfs/xfs_refcount.c=
:2007 xfs_refcount_recover_group_cow_leftovers() error: we previously assum=
ed 'pag' could be null (see line 1944)=0A=
=0A=
tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t vectorized-scrub=0A=
head:   37fb90fd6eb0a30eb7133a2ca9ead780b574ed69=0A=
commit: aa00406b3a9251a3a0f7f622ad54d9c34255cd33 [461/498] xfs: refcover Co=
W leftovers in the realtime volume=0A=
config: m68k-randconfig-m041-20221110=0A=
compiler: m68k-linux-gcc (GCC) 12.1.0=0A=
=0A=
If you fix the issue, kindly add following tag where applicable=0A=
| Reported-by: kernel test robot <lkp@intel.com>=0A=
| Reported-by: Dan Carpenter <error27@gmail.com>=0A=
=0A=
smatch warnings:=0A=
fs/xfs/libxfs/xfs_refcount.c:2007 xfs_refcount_recover_group_cow_leftovers(=
) error: we previously assumed 'pag' could be null (see line 1944)=0A=
=0A=
vim +/pag +2007 fs/xfs/libxfs/xfs_refcount.c=0A=
=0A=
aa00406b3a9251 Darrick J. Wong 2022-07-14  1926  static int=0A=
aa00406b3a9251 Darrick J. Wong 2022-07-14  1927  xfs_refcount_recover_group=
_cow_leftovers(=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  1928         struct xfs_mount   =
             *mp,=0A=
aa00406b3a9251 Darrick J. Wong 2022-07-14  1929         struct xfs_perag   =
             *pag,=0A=
aa00406b3a9251 Darrick J. Wong 2022-07-14  1930         struct xfs_rtgroup =
             *rtg)=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  1931  {=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  1932         struct xfs_trans   =
             *tp;=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  1933         struct xfs_btree_cu=
r            *cur;=0A=
aa00406b3a9251 Darrick J. Wong 2022-07-14  1934         struct xfs_buf     =
             *agbp =3D NULL;=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  1935         struct xfs_refcount=
_recovery    *rr, *n;=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  1936         struct list_head   =
             debris;=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  1937         union xfs_btree_ire=
c            low;=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  1938         union xfs_btree_ire=
c            high;=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  1939         xfs_fsblock_t      =
             fsb;=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  1940         int                =
             error;=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  1941=0A=
f1fdc820784067 Darrick J. Wong 2022-10-27  1942         /* reflink filesyst=
ems mustn't have AGs larger than 2^31-1 blocks */=0A=
8b972158afcaa6 Darrick J. Wong 2022-10-10  1943         BUILD_BUG_ON(XFS_MA=
X_CRC_AG_BLOCKS >=3D XFS_REFC_COWFLAG);=0A=
aa00406b3a9251 Darrick J. Wong 2022-07-14 @1944         if (pag && mp->m_sb=
.sb_agblocks > XFS_MAX_CRC_AG_BLOCKS)=0A=
                                                            ^^^=0A=
Can "pag" be NULL?=0A=
=0A=
aa00406b3a9251 Darrick J. Wong 2022-07-14  1945                 return -EOP=
NOTSUPP;=0A=
aa00406b3a9251 Darrick J. Wong 2022-07-14  1946=0A=
aa00406b3a9251 Darrick J. Wong 2022-07-14  1947         /* rtreflink filesy=
stems can't have rtgroups larger than 2^31-1 blocks */=0A=
aa00406b3a9251 Darrick J. Wong 2022-07-14  1948         BUILD_BUG_ON(XFS_MA=
X_RGBLOCKS >=3D XFS_REFC_COWFLAG);=0A=
aa00406b3a9251 Darrick J. Wong 2022-07-14  1949         if (rtg && mp->m_sb=
.sb_rgblocks >=3D XFS_MAX_RGBLOCKS)=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  1950                 return -EOP=
NOTSUPP;=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  1951=0A=
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1952         INIT_LIST_HEAD(&deb=
ris);=0A=
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1953=0A=
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1954         /*=0A=
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1955          * In this first pa=
rt, we use an empty transaction to gather up=0A=
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1956          * all the leftover=
 CoW extents so that we can subsequently=0A=
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1957          * delete them.  Th=
e empty transaction is used to avoid=0A=
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1958          * a buffer lock de=
adlock if there happens to be a loop in the=0A=
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1959          * refcountbt becau=
se we're allowed to re-grab a buffer that is=0A=
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1960          * already attached=
 to our transaction.  When we're done=0A=
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1961          * recording the Co=
W debris we cancel the (empty) transaction=0A=
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1962          * and everything g=
oes away cleanly.=0A=
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1963          */=0A=
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1964         error =3D xfs_trans=
_alloc_empty(mp, &tp);=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  1965         if (error)=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  1966                 return erro=
r;=0A=
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1967=0A=
aa00406b3a9251 Darrick J. Wong 2022-07-14  1968         if (rtg) {=0A=
aa00406b3a9251 Darrick J. Wong 2022-07-14  1969                 xfs_rtgroup=
_lock(NULL, rtg, XFS_RTGLOCK_REFCOUNT);=0A=
aa00406b3a9251 Darrick J. Wong 2022-07-14  1970                 cur =3D xfs=
_rtrefcountbt_init_cursor(mp, tp, rtg,=0A=
aa00406b3a9251 Darrick J. Wong 2022-07-14  1971                            =
     rtg->rtg_refcountip);=0A=
aa00406b3a9251 Darrick J. Wong 2022-07-14  1972         } else {=0A=
08d3e84feeb8cb Dave Chinner    2022-07-07  1973                 error =3D x=
fs_alloc_read_agf(pag, tp, 0, &agbp);=0A=
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1974                 if (error)=
=0A=
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1975                         got=
o out_trans;=0A=
a81a06211fb43d Dave Chinner    2021-06-02  1976                 cur =3D xfs=
_refcountbt_init_cursor(mp, tp, agbp, pag);=0A=
aa00406b3a9251 Darrick J. Wong 2022-07-14  1977         }=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  1978=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  1979         /* Find all the lef=
tover CoW staging extents. */=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  1980         memset(&low, 0, siz=
eof(low));=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  1981         memset(&high, 0, si=
zeof(high));=0A=
9a50ee4f8db6e4 Darrick J. Wong 2022-10-10  1982         low.rc.rc_domain =
=3D high.rc.rc_domain =3D XFS_REFC_DOMAIN_COW;=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  1983         high.rc.rc_startblo=
ck =3D -1U;=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  1984         error =3D xfs_btree=
_query_range(cur, &low, &high,=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  1985                         xfs=
_refcount_recover_extent, &debris);=0A=
ef97ef26d263fb Darrick J. Wong 2018-07-19  1986         xfs_btree_del_curso=
r(cur, error);=0A=
aa00406b3a9251 Darrick J. Wong 2022-07-14  1987         if (agbp)=0A=
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1988                 xfs_trans_b=
relse(tp, agbp);=0A=
aa00406b3a9251 Darrick J. Wong 2022-07-14  1989         else=0A=
aa00406b3a9251 Darrick J. Wong 2022-07-14  1990                 xfs_rtgroup=
_unlock(rtg, XFS_RTGLOCK_REFCOUNT);=0A=
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1991         xfs_trans_cancel(tp=
);=0A=
ef97ef26d263fb Darrick J. Wong 2018-07-19  1992         if (error)=0A=
ef97ef26d263fb Darrick J. Wong 2018-07-19  1993                 goto out_fr=
ee;=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  1994=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  1995         /* Now iterate the =
list to free the leftovers */=0A=
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1996         list_for_each_entry=
_safe(rr, n, &debris, rr_list) {=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  1997                 /* Set up t=
ransaction. */=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  1998                 error =3D x=
fs_trans_alloc(mp, &M_RES(mp)->tr_write, 0, 0, 0, &tp);=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  1999                 if (error)=
=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  2000                         got=
o out_free;=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  2001=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  2002                 /* Free the=
 orphan record */=0A=
aa00406b3a9251 Darrick J. Wong 2022-07-14  2003                 if (rtg)=0A=
aa00406b3a9251 Darrick J. Wong 2022-07-14  2004                         fsb=
 =3D xfs_rgbno_to_rtb(mp, rtg->rtg_rgno,=0A=
aa00406b3a9251 Darrick J. Wong 2022-07-14  2005                            =
             rr->rr_rrec.rc_startblock);=0A=
aa00406b3a9251 Darrick J. Wong 2022-07-14  2006                 else=0A=
9a50ee4f8db6e4 Darrick J. Wong 2022-10-10 @2007                         fsb=
 =3D XFS_AGB_TO_FSB(mp, pag->pag_agno,=0A=
                                                                           =
                      ^^^^^^^^^^^^^=0A=
Unchecked dereference.=0A=
=0A=
9a50ee4f8db6e4 Darrick J. Wong 2022-10-10  2008                            =
             rr->rr_rrec.rc_startblock);=0A=
aa00406b3a9251 Darrick J. Wong 2022-07-14  2009                 xfs_refcoun=
t_free_cow_extent(tp, rtg !=3D NULL, fsb,=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  2010                            =
     rr->rr_rrec.rc_blockcount);=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  2011=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  2012                 /* Free the=
 block. */=0A=
4ae7e45a0598e5 Darrick J. Wong 2022-07-14  2013                 xfs_free_ex=
tent_later(tp, fsb, rr->rr_rrec.rc_blockcount, NULL,=0A=
aa00406b3a9251 Darrick J. Wong 2022-07-14  2014                            =
     rtg !=3D NULL ? XFS_FREE_EXTENT_REALTIME : 0);=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  2015=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  2016                 error =3D x=
fs_trans_commit(tp);=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  2017                 if (error)=
=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  2018                         got=
o out_free;=0A=
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2019=0A=
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2020                 list_del(&r=
r->rr_list);=0A=
c1ccf967bf962b Darrick J. Wong 2022-10-26  2021                 kfree(rr);=
=0A=
6f97077ff6ef28 Darrick J. Wong 2016-10-10  2022         }=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  2023=0A=
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2024         return error;=0A=
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2025  out_trans:=0A=
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2026         xfs_trans_cancel(tp=
);=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  2027  out_free:=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  2028         /* Free the leftove=
r list */=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  2029         list_for_each_entry=
_safe(rr, n, &debris, rr_list) {=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  2030                 list_del(&r=
r->rr_list);=0A=
c1ccf967bf962b Darrick J. Wong 2022-10-26  2031                 kfree(rr);=
=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  2032         }=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  2033         return error;=0A=
174edb0e46e520 Darrick J. Wong 2016-10-03  2034  }=0A=
=0A=
--=0A=
0-DAY CI Kernel Test Service=0A=
https://01.org/lkp=0A=
=0A=
