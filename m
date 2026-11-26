Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672873;
	b=hYXiSlEg2zQiRdzjwQ1HeV21aPPPZFXQW5Swuko1ydSGOn3tRXbwVstKJt5mxS0dcMlm
	 2AoicvDUbZyhSU4+nb22/IHSbnuMG0UfdH6Iz32CfZIjRiLc67GOT3b/PBnLt7Q1ZXrOo
	 hGsgaNDUkbyARWMInJOPu19rZlGzfx7g+LlJvHN1xTYGPhRMtzsrwXaxo6vq7yJg/bhxD
	 4RBj9f9MltH70AQTwsN/JbDO1RMPzPrUKUWG9W9kV++u4A8N6SieVWeciWYjFt24h9+cR
	 l/A1dRitAoBs0b4+ZZkB3w2qu4ElAOZMM3s+xhrFMW3MyjkPW8Lkgse+MeVwTzC97OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=kDxGg7QUI2SeoicQQtdwgwJtguc6iCG2f3OmUmwXw+U=;
	b=Dfgh1R+DN1Pt+FdE+HG7fudbeDUH/dsyEjt8Jlgt407Fdr1+j3UgPzwB5uWtOBQ9WgQN
	 fm0Ob8ofNWMfr6Rz1xlUlzV4lGQJBNkfnz/YSK2QX76iqg7IE4F9vD2Woa3cri8aUhHsf
	 C5o2/Mjjvl9Zw8kw/k1sLDfLdipbarZAFFPY3gHCS7w96qJjjhSALfnMFBOXZ2aoUEenf
	 PzqItInB7zOKHOHsaDzvqJLAbAnxtM2AWq7P8C74JS4bcNB2OUoWfsKv20hW6jiXJPQgn
	 gwSmUECvD/qqcl4LHz1Ho8ecrivxC6p8oH3kk1WZLdgUggPk7g16Oxl7zr+zB4FUCAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tR7gOVn4;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02281606A326
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 06:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02281606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tR7gOVn4
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so45041655e9.0
        for <oe-kbuild@lists.linux.dev>; Wed, 25 Nov 2026 22:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795672871; x=1796277671; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kDxGg7QUI2SeoicQQtdwgwJtguc6iCG2f3OmUmwXw+U=;
        b=tR7gOVn4eK9Swi5iizzt3vVF2qtKaadV2Ed6sSBtuZepxHbD64OqwgjdwXeC8Jxqlk
         SbcCYF9CMEKNlztbH/vu/dWwuBe7isJVkCM32oVeqs/YXLBydMzMYarFhj4ULFQA1rhB
         H/UI0g0xK/jMKm3dsSnDCyOQ+aMyw05MPx1IibtMVKR2K4sM8Z68KVFlZS8YyrtFZqtQ
         GOk5wEiXmebVa8rKfoUyudWb4+lbS/oso4plR3qapZThVf9I5kNPSX79j7VizHJ9798p
         lxMTSMmKAla4/yQgsxM8DpDBBG/4kQ/z2WLXKmSg/vVezSe+zx/iNDiEVF6QiGXjNS/q
         A0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672871; x=1796277671;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kDxGg7QUI2SeoicQQtdwgwJtguc6iCG2f3OmUmwXw+U=;
        b=w+b64QvC4sJ56rWysM5KuxkseajwVc9OehmnzKTpcFEpaP/MMAM8RwPR67PWQNXoOl
         bvmggEPMF+EmObZsA6rs7lFST+7uJYsHfXoKISMfghneczgfAWj2fDz9SAoyM1MGlikt
         m+D8h5XfdiZIvYaOyqsK+1+TxwAapZMN2U+7pZ9liHIJ+jDQWr6zGI+aL3nxkBv11/2e
         J4yZH7nQ2Gl34U/ckjClKV3deNXpzVZrRLNygfpX93TE0gW2Kw15+j30ux1/p03Hx9OJ
         aIQaLDL52LS/Nz6+MzxNHoRG8kQNPYAus8Q54Ujm7Oln7YuzU1QJ0ktN9MXJK3P1w9wV
         GnYA==
X-Gm-Message-State: APuU4Z8wwj9RvlZiQtdnbk3AL3S/x3DUk/jJ98oxuhB6KjDXbo8F5ALs
	lYDvZ9jm5xoavmp9/qnrgyIMLcHXPVQ7ZH1rGDrrNpRBlau0TpR+bf6VJYQPJvI1eOgnUQ==
X-Gm-Gg: AZFdTZcwX9Xs+DNUtgClk2yyt4cwr2SMox+2/Vd58T6F9VH/DuhleuC3c0TYGDI54GH
	ev89R7508K+fkKR+4jRSTJ5bvfMXoS1q79sEwtS7meO0tzvx7O6dImg4ayAiAJDK7U3rXuoujw9
	tSj5+6t4bjVi0kTo/gfctgXlcKp6pvBsyiPJOB3vXrqyYu+WUHIkoiR7lDsLswc+zufGVs+pmoU
	+zqcifOC+IdMPz9+uLFc4yJe6NNTDfAxnOXfknlwZGFk0iKJ3miP1o3M6hh73G3/ORWwGfrclG9
	pSMMpP1v4yUBm1zK/rk18YABbfFnliSfqhuP1m1nQTpuyGf/KP01bzn8bLYP8ilsVX+6ewWqYgd
	xMog81ti3dhGOoI+avacHwPutCPtJ9FJGg3v1fN7RIvtlwKsp0ANQuR0jE7gjjC1cu3kciZd9Sy
	BZEzkbzKhM14qnGM2rtNt+NDEsWFbKhAglxrNqPPJ6fG58g7ahE6QATR+7SactCwq8TiqWhY54d
	tQBcz1xG/aMS6qhJkOtp7fsxz2wstXgP6VFRV9GATIqlzfJgzSh02VNnJYIfiJE443KImBpDnso
	/G/sJGkzOlMnQLr/7/n/Qa0Bv9wEItiEA0/1Ck93BfYJX/OOFGoMtDNAN5WZBioBBaHgd1Ltu/h
	xIpzAxwa/h0ZhMCrg6P3tf58UEj32tvOVF+K3TD5Kb9RGCpj/FmvkCzWyjjFc7HwjeJqWXI8Yl/
	MeNVYYNIzwlX7R
X-Received: by 2002:a05:600c:638f:b0:4bb:7581:2bb9 with SMTP id 5b1f17b1804b1-4bb8892692dmr357274335e9.22.1795672871136;
        Wed, 25 Nov 2026 22:01:11 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm44045084f8f.55.2026.11.25.22.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:01:10 -0800 (PST)
Date: Thu, 26 Nov 2026 09:01:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Ian Bridges <icb@fastmail.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [linkinjeon-smb:ksmbd-for-next 48/48] fs/smb/server/smbacl.c:793
 parse_sec_desc() warn: missing error code? 'rc'
Message-ID: <20261126042013.QSoDDLPw-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20261126060107.yGnad0_uaB86n5q-4VDmTT5im1MZGxSD0W0AKGW2ZwQ@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/smb.git ksmbd-for-next
head:   f9208b7a49196e36c0434637ab83e001f5800a1d
commit: f9208b7a49196e36c0434637ab83e001f5800a1d [48/48] ksmbd: use the security descriptor codec in callers
config: sparc-randconfig-2200-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126042013.QSoDDLPw-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261126042013.QSoDDLPw-lkp@intel.com/

smatch warnings:
fs/smb/server/smbacl.c:793 parse_sec_desc() warn: missing error code? 'rc'

vim +/rc +793 fs/smb/server/smbacl.c

1923c1065fe94c fs/smb/server/smbacl.c Christian Brauner         2026-09-01  768  int parse_sec_desc(const struct mnt_idmap *idmap, struct smb_ntsd *pntsd,
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  769  		   int acl_len, struct smb_fattr *fattr, struct ksmbd_sd **psd)
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  770  {
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  771  	int rc = 0;
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  772  	const struct smb_sid *owner_sid_ptr = NULL, *group_sid_ptr = NULL;
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  773  	struct ksmbd_sd *sd __free(kvfree) = NULL;
548e9ad317393b fs/cifsd/smbacl.c      Namjae Jeon               2021-03-21  774  	int pntsd_type;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  775  
64b39f4a2fd293 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-30  776  	if (!pntsd)
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  777  		return -EIO;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  778  
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  779  	if (acl_len < (int)sizeof(struct smb_ntsd))
8f77150c15f877 fs/ksmbd/smbacl.c      Hyunchul Lee              2021-09-24  780  		return -EINVAL;
8f77150c15f877 fs/ksmbd/smbacl.c      Hyunchul Lee              2021-09-24  781  
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  782  	/* Refuse an SD from a client if the decoder left a part out */
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  783  	rc = ksmbd_sd_decode((u8 *)pntsd, acl_len, &sd);
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  784  	if (rc == -EBADMSG || (!rc && sd->part_dropped))
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  785  		rc = -EINVAL;
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  786  	if (rc)
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  787  		return rc;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  788  
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  789  	pntsd_type = sd->control;
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  790  	if (sd->dacl == KSMBD_ACL_ABSENT) {
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  791  		ksmbd_debug(SMB, "DACL_PRESENT in DACL type is not set\n");
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  792  		*psd = no_free_ptr(sd);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16 @793  		return rc;

This works but "return 0;" would be more readable.

e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  794  	}
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  795  
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  796  	/* The stored SD keeps only the Control bits set below and no SACL */
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  797  	sd->control = 0;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

