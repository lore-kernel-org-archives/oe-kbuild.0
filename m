Received: from mail-qv1-f98.google.com (mail-qv1-f98.google.com [209.85.219.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3CE31ED9D
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Jan 2026 13:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767706136; cv=none; b=KJBiFWVBBrVQsSsK7WlyF3w0/Fh6Ek3xGS7VVZ7YujC7wPbstWmvArnaxfsYaJuEyKrP2LAq/vsoxZXD1CNjC1Q21RDBNIPHnvxlTnhy7kiazrVEia2uOYlv0HLHvRyqqsQxm+JvRXg1ZLu0z2pLLI9tI6dGK58KlwSve4NiQ1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767706136; c=relaxed/simple;
	bh=JqEhtaBU6d7CFitWR5i5EBRx62SQobz9lNr755na68I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hdw2qVraAIxmbjY0Pqil0m9n2ywoniqopl9oS3fWZ9FT4rUK7dty4GXS6vjUncUt5gtqpF+qeEzZ99a1L7iXUR4jYowF9F2rkjUvwbMXXC47UTR6540j3dW6XA01sOma/wWWQqVo/ZJS6v7De6TNuxG58FpeILe4s2l739vATC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PprWlLEN; arc=none smtp.client-ip=209.85.219.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PprWlLEN"
Received: by mail-qv1-f98.google.com with SMTP id 6a1803df08f44-88a367a1dbbso12791526d6.0
        for <oe-kbuild@lists.linux.dev>; Tue, 06 Jan 2026 05:28:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767706133; x=1768310933;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncopTRQ2bfoIxISmDFxTPaoD5D25SfN9SZHfhSec0Lo=;
        b=HmTS0vo8JnfUif0Q4ALwpKCFJgkCVnbdmmfupdRanzjltlN66H2CnRH0qAGNGDS0zc
         Hms693djWQpqlUlrN9AAbv/6M0etvjaXXqJBwrKkNMYZBpZzrgYL4FWrhcfGDmg1yQpd
         tbh1GwSBGincF4oejYziAhGenn2VGyzWmHB1Di6/NUGiJEiplU2QDK6Ne76Tsoqi80qQ
         DFKkDMs3n7bSN/PxnrnSDERaGeQo3VSOLeShozd+ID0cNysK53SXvxG00xD18S9yFo4O
         I/P3oU/GBfQNjJrYSZv/m5tfE5zX4edhUwOaAcQ5A+Yf+xif1Y9dTr82THUYCrNT78rV
         PZqg==
X-Gm-Message-State: AOJu0YyXsjKMZkOnpbEwD1tGLjj6CStkM3c3mDM8bMyL79awg47wt57r
	q3jb5YLpnXo5w463y3yXIbReWuZueY8jkUY8sprh5eub2G/Ixi4Ixv8xFweKQMst40Ty9ckTkba
	it/C508IftV4+vTAAWK5Vupi0qtFp8nceOD8ZC0F+Y9hlPIpzR9S1HAoAm4mAFGOujhjTFNj2kJ
	tZcPgaOIHE73KnFdQojGnjHldnaE3kEzb/G+IfZ0K1pG38gyqbJjl0PcRF5FJwFemeSJY0Riu0n
	D/BFGX2SYFkJQ==
X-Gm-Gg: AY/fxX69jTH5aPSfSf4HSKNh+kTSpSTEU6IaWBV9egkWwJpBy52Q/lF+AdCaN/bj4pr
	XMEq+/2JL+jGdLJ8lBtIE3m5t1f5ZuEO5mOugxM32tvaNnZNZyTPuDbAFJzXrT/jigIblzojiTr
	/TlqDIMdiXKxd4ZcehexVkvwG63UZLXPJiwsGyb0/xyXpzXZM7RoUDe0lB5FV2ZnFcDpU14nyjK
	KNuTT6hkJ1x36BswPlfoNzr4AkvHcjOE6agvMPJ34SfLjpQv9oJ3By9eSDc3od79zJ/RX7mKCOt
	SXUpmk7PBqbRxynCpAOMnmeTn9EwVEbIYrLhrzM+JQTsBF+N6wCo+QC/pY7tTgLY694KJMf6KyH
	gXmpflOEyOZzMOccqwODs1eAUSJcqsWkesyoZtuRkmIgCtLXCsIMpAb+WZ7aFv63ubpKJwjQeJH
	mPhnglkhvbwiExJWuELM97iYnHdV8XBd61Swl/iqoNNVbK0g==
X-Google-Smtp-Source: AGHT+IFGyupqfF1L53093Dq81dlY5U6QCdXD7rahG9XkrW/6Np5NnlLynvfHqQL48pZ2BFntmj4TaxVP4uE0
X-Received: by 2002:a05:6214:4689:b0:888:8a72:e3c4 with SMTP id 6a1803df08f44-89075e594b8mr39429476d6.31.1767706133232;
        Tue, 06 Jan 2026 05:28:53 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-8907710ebc5sm2720996d6.20.2026.01.06.05.28.52
        for <oe-kbuild@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Jan 2026 05:28:53 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34e5a9de94bso2214297a91.0
        for <oe-kbuild@lists.linux.dev>; Tue, 06 Jan 2026 05:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1767706132; x=1768310932; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ncopTRQ2bfoIxISmDFxTPaoD5D25SfN9SZHfhSec0Lo=;
        b=PprWlLENLKharlJkZb+GO1gCkOxmaD9hz/ytabdTpv1o5XiDj1ddI06cFo7T3kP4km
         FD9Tobm7VIgLNYIVn75TA7kWlHCbFPkeTo7H6vG3RfE/E6xnERN+pibVsmL3xDvsRkAt
         82PbTJbo2+OcrI5hmzzlUTpsVhw9x5wBKGjfo=
X-Received: by 2002:a17:90b:4c44:b0:343:7714:4ca8 with SMTP id 98e67ed59e1d1-34f5f272d0emr2595264a91.15.1767706131742;
        Tue, 06 Jan 2026 05:28:51 -0800 (PST)
X-Received: by 2002:a17:90b:4c44:b0:343:7714:4ca8 with SMTP id
 98e67ed59e1d1-34f5f272d0emr2595232a91.15.1767706131260; Tue, 06 Jan 2026
 05:28:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601010413.sWadrQel-lkp@intel.com>
In-Reply-To: <202601010413.sWadrQel-lkp@intel.com>
From: Siva Reddy Kallam <siva.kallam@broadcom.com>
Date: Tue, 6 Jan 2026 18:58:36 +0530
X-Gm-Features: AQt7F2ot6gHHVSlgkbg9MdgG7rCIRAhmuhA69rIqX29dAPPfE-_kceZney4Ud44
Message-ID: <CAMet4B7juvw7PFtvQe-XEim5zX9Vr_i-MzpxE6gnLsvux8kNpA@mail.gmail.com>
Subject: Re: drivers/infiniband/hw/bng_re/bng_dev.c:113 bng_re_net_ring_free()
 warn: variable dereferenced before check 'rdev' (see line 107)
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Leon Romanovsky <leon@kernel.org>, 
	Usman Ansari <usman.ansari@broadcom.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000015a80a0647b82854"

--00000000000015a80a0647b82854
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 5:39=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   c8ebd433459bcbf068682b09544e830acd7ed222
> commit: 4f830cd8d7fe3e98fc12d25f347ed461e11fc1de RDMA/bng_re: Add infrast=
ructure for enabling Firmware channel
> config: s390-randconfig-r073-20251231 (https://download.01.org/0day-ci/ar=
chive/20260101/202601010413.sWadrQel-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8=
6b9f90b9574b3a7d15d28a91f6316459dcfa046)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202601010413.sWadrQel-lkp@intel.com/
>
> smatch warnings:
> drivers/infiniband/hw/bng_re/bng_dev.c:113 bng_re_net_ring_free() warn: v=
ariable dereferenced before check 'rdev' (see line 107)
> drivers/infiniband/hw/bng_re/bng_dev.c:270 bng_re_dev_init() warn: missin=
g unwind goto?
>
> vim +/rdev +113 drivers/infiniband/hw/bng_re/bng_dev.c
>
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  104  static int bng_re_net_r=
ing_free(struct bng_re_dev *rdev,
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  105                         =
       u16 fw_ring_id, int type)
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  106  {
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17 @107        struct bnge_auxr_=
dev *aux_dev =3D rdev->aux_dev;
>                                                                          =
               ^^^^^^^^^^^^^
> Unchecked dereference.
Thanks for reporting this. rdev is valid from the caller. so, below
NULL check for rdev is not needed.With removing if (!rdev) check,
rdev can be dereferenced here.
>
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  108        struct hwrm_ring_=
free_input req =3D {};
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  109        struct hwrm_ring_=
free_output resp;
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  110        struct bnge_fw_ms=
g fw_msg =3D {};
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  111        int rc =3D -EINVA=
L;
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  112
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17 @113        if (!rdev)
>
> Hopefully this NULL check can be deleted.
Thanks for reporting this. Yes, This NULL check is not needed. I will
be sending a separate patch soon.
>
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  114                return rc=
;
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  115
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  116        if (!aux_dev)
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  117                return rc=
;
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  118
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  119        bng_re_init_hwrm_=
hdr((void *)&req, HWRM_RING_FREE);
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  120        req.ring_type =3D=
 type;
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  121        req.ring_id =3D c=
pu_to_le16(fw_ring_id);
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  122        bng_re_fill_fw_ms=
g(&fw_msg, (void *)&req, sizeof(req), (void *)&resp,
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  123                         =
   sizeof(resp), BNGE_DFLT_HWRM_CMD_TIMEOUT);
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  124        rc =3D bnge_send_=
msg(aux_dev, &fw_msg);
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  125        if (rc)
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  126                ibdev_err=
(&rdev->ibdev, "Failed to free HW ring:%d :%#x",
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  127                         =
 req.ring_id, rc);
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  128        return rc;
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  129  }
>
> [ snip ]
>
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  217  static int bng_re_dev_i=
nit(struct bng_re_dev *rdev)
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  218  {
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  219        struct bng_re_rin=
g_attr rattr =3D {};
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  220        struct bng_re_cre=
q_ctx *creq;
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  221        u32 db_offt;
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  222        int vid;
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  223        u8 type;
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  224        int rc;
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  225
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  226        /* Registered a n=
ew RoCE device instance to netdev */
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  227        rc =3D bng_re_reg=
ister_netdev(rdev);
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  228        if (rc) {
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  229                ibdev_err=
(&rdev->ibdev,
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  230                         =
       "Failed to register with netedev: %#x\n", rc);
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  231                return -E=
INVAL;
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  232        }
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  233
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  234        set_bit(BNG_RE_FL=
AG_NETDEV_REGISTERED, &rdev->flags);
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  235
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  236        if (rdev->aux_dev=
->auxr_info->msix_requested < BNG_RE_MIN_MSIX) {
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  237                ibdev_err=
(&rdev->ibdev,
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  238                         =
 "RoCE requires minimum 2 MSI-X vectors, but only %d reserved\n",
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  239                         =
 rdev->aux_dev->auxr_info->msix_requested);
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  240                bnge_unre=
gister_dev(rdev->aux_dev);
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  241                clear_bit=
(BNG_RE_FLAG_NETDEV_REGISTERED, &rdev->flags);
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  242                return -E=
INVAL;
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  243        }
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  244        ibdev_dbg(&rdev->=
ibdev, "Got %d MSI-X vectors\n",
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  245                  rdev->a=
ux_dev->auxr_info->msix_requested);
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  246
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  247        rc =3D bng_re_set=
up_chip_ctx(rdev);
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  248        if (rc) {
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  249                bnge_unre=
gister_dev(rdev->aux_dev);
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  250                clear_bit=
(BNG_RE_FLAG_NETDEV_REGISTERED, &rdev->flags);
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  251                ibdev_err=
(&rdev->ibdev, "Failed to get chip context\n");
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  252                return -E=
INVAL;
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  253        }
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  254
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  255        bng_re_query_hwrm=
_version(rdev);
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  256
> 53310b698f3cf6 Siva Reddy Kallam 2025-11-17  257        rc =3D bng_re_all=
oc_fw_channel(&rdev->bng_res, &rdev->rcfw);
> 53310b698f3cf6 Siva Reddy Kallam 2025-11-17  258        if (rc) {
> 53310b698f3cf6 Siva Reddy Kallam 2025-11-17  259                ibdev_err=
(&rdev->ibdev,
> 53310b698f3cf6 Siva Reddy Kallam 2025-11-17  260                         =
 "Failed to allocate RCFW Channel: %#x\n", rc);
> 53310b698f3cf6 Siva Reddy Kallam 2025-11-17  261                goto fail=
;
>
> Why a goto here and not before or after?
Thanks for reporting this. I am working on fixing this. I will be
sending a patch for this.
>
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  262        }
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  263
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  264        /* Allocate nq re=
cord memory */
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  265        rdev->nqr =3D kza=
lloc(sizeof(*rdev->nqr), GFP_KERNEL);
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  266        if (!rdev->nqr) {
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  267                bng_re_de=
stroy_chip_ctx(rdev);
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  268                bnge_unre=
gister_dev(rdev->aux_dev);
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  269                clear_bit=
(BNG_RE_FLAG_NETDEV_REGISTERED, &rdev->flags);
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17 @270                return -E=
NOMEM;
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  271        }
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  272
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  273        rdev->nqr->num_ms=
ix =3D rdev->aux_dev->auxr_info->msix_requested;
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  274        memcpy(rdev->nqr-=
>msix_entries, rdev->aux_dev->msix_info,
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  275               sizeof(str=
uct bnge_msix_info) * rdev->nqr->num_msix);
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  276
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  277        type =3D RING_ALL=
OC_REQ_RING_TYPE_NQ;
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  278        creq =3D &rdev->r=
cfw.creq;
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  279        rattr.dma_arr =3D=
 creq->hwq.pbl[BNG_PBL_LVL_0].pg_map_arr;
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  280        rattr.pages =3D c=
req->hwq.pbl[creq->hwq.level].pg_count;
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  281        rattr.type =3D ty=
pe;
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  282        rattr.mode =3D RI=
NG_ALLOC_REQ_INT_MODE_MSIX;
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  283        rattr.depth =3D B=
NG_FW_CREQE_MAX_CNT - 1;
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  284        rattr.lrid =3D rd=
ev->nqr->msix_entries[BNG_RE_CREQ_NQ_IDX].ring_idx;
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  285        rc =3D bng_re_net=
_ring_alloc(rdev, &rattr, &creq->ring_id);
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  286        if (rc) {
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  287                ibdev_err=
(&rdev->ibdev, "Failed to allocate CREQ: %#x\n", rc);
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  288                goto free=
_rcfw;
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  289        }
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  290        db_offt =3D rdev-=
>nqr->msix_entries[BNG_RE_CREQ_NQ_IDX].db_offset;
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  291        vid =3D rdev->nqr=
->msix_entries[BNG_RE_CREQ_NQ_IDX].vector;
> 53310b698f3cf6 Siva Reddy Kallam 2025-11-17  292
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  293        rc =3D bng_re_ena=
ble_fw_channel(&rdev->rcfw,
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  294                         =
               vid, db_offt);
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  295        if (rc) {
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  296                ibdev_err=
(&rdev->ibdev, "Failed to enable RCFW channel: %#x\n",
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  297                         =
 rc);
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  298                goto free=
_ring;
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  299        }
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  300
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  301        return 0;
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  302  free_ring:
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  303        bng_re_net_ring_f=
ree(rdev, rdev->rcfw.creq.ring_id, type);
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  304  free_rcfw:
> 4f830cd8d7fe3e Siva Reddy Kallam 2025-11-17  305        bng_re_free_rcfw_=
channel(&rdev->rcfw);
> 53310b698f3cf6 Siva Reddy Kallam 2025-11-17  306  fail:
> 53310b698f3cf6 Siva Reddy Kallam 2025-11-17  307        bng_re_dev_uninit=
(rdev);
> 53310b698f3cf6 Siva Reddy Kallam 2025-11-17  308        return rc;
> 745065770c2dc9 Siva Reddy Kallam 2025-11-17  309  }
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

--00000000000015a80a0647b82854
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
fyIFUZVWSBcxHWtNNVK4Oi0mqSJut0p/SwfLg6IMaVBU9VdXgVmw35CgcX/9B1ITmih041Oz+Qyo
wTULsXik3lHJuyhYevN9h4259CoDPt+tpaykVaqa4luUmGv8k3F6aC4+fZl83ywHGVun9fBVk/GE
2hmynyIEon1w6Me72fdjaPht4V1tbZBu/76zGxBiBFc13nAKU0dYrvIGPgKN9j0HDuOVC7UhhdTq
Gw+wN3sPJk9D2VtNAzNGw0sa/eJF1wQiBy4RVYG9r0MCAwEAAaOCAdwwggHYMA4GA1UdDwEB/wQE
AwIFoDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDov
L3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5Bggr
BgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUG
A1UdIAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUF
BwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDag
NKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwIwYD
VR0RBBwwGoEYc2l2YS5rYWxsYW1AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBTNBMIvX7vsfxNYWor1Hxth
tmNmHzANBgkqhkiG9w0BAQsFAAOCAgEAJDoTbZO7LdV1ut7GZK90O0jIsqSEJT1CqxcFnoWsIoxV
i/YuVL61y6Pm+Twv6/qzkLprsYs7SNIf/JfosIRPSFz6S7Yuq9sGXNKpdPyCaALMbWtPQDwdNhT7
uJgZw5Rq9FQRZgAJNC9+HBtCdnzIW5GUmw040YclUNHFEKDfycJMKjSPez044QcDoN0T2mIzOM8O
Dt+sJTrC1YJ6+HI6F2H6igZUL79y9qYUz8FNshyITihg/1VBVCiMU9WRK3tNfUlLFzLBuTTr245d
xMh/e75vypL3qDSF4UG6Mpy++Plsnjfwab70KFFyCvNwB2hT1g/y8MLgslfxJl6fCyGdWqOmUB2J
QiuiqbSy8mlnucIPuGWQqqt8VBQjxKYIHdjXtkvw0uVvOHUC2QJWfGWDhMncxF5LFoaRPer4tlXJ
b5zmz9Mn+uQPQQLYUqYzs+EvX1REmGLGUuzlaNwAC20+8CVPY2EkU1mjU78+aW5Zbb2MyjQrLc6J
5IdkekEtk+xjpM992MC/aNMTpWIWhorGq8NmPXbuoUZf9MSi7WrVCaO69ro68FXPTErr/e13lJ/5
GAkwcxdTC+YVPVa/xpdHyAFW03/Oow/7fV8qjy6PAWfqEV97D2Tspc2aEFkbeuFS6UkPRy1OKjGc
/IUTSY4h9roe7Bh1ecqtofP9XL8E88sxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgxoOshI0IGR+aGCCXkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEICI5
ql7Jt0YJmwQUzVU8UrlFFkbGBSKh+9FzG18XmInlMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MDEwNjEzMjg1MlowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAANTg7ZHB/FIj2wkHqqkOuB8nTzGuGElYC3FMCfr
i+ScWwhAfURjKU533dGKklRK+RhQVJ3tbTcFzhKHwSnO8CIw8aH4JlTlSO/LuJC/R6kIHPzUJwHk
G1aD+Qj9PF7vGvfmcqkV17AMx8CGr0JPNEm/YKCCaxvhZWbp2uQglj48P6c5FAHzj9jmI8sBNnwh
82ZhE4rMmaAdjQ6I2sPRPwKfuEgjFLyqNnLG41qpNqGjeeA9RJsW9zZsgpfOXdcjpZyPkElFUnNo
cf+CkR4tkPRj4wnMS3UjSAGmeooiPH+QMbqvDVI5hy7ZKhlVnilAgvVuygj98yN3G5U/Y6z1pk4=
--00000000000015a80a0647b82854--
