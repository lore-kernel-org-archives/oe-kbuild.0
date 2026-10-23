Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792739015;
	b=me9BkzH8AeAT9QqfbgDmhh/nNVXBLpJHBGOyTchz0KbMIu209k0TBi5o8Zbn40jCJXBw
	 hEt3LV3ILEdUWYLhdMr4NDF8Ejrz19YMU1AS+3AhgRKvzzCKRsEDm2iO4NTmYIPMu8BvH
	 tFJMjV2KO5bLtPuaUtSTjunEA9E8LPGEamI4jBN+Y8hr53bt4fhb2tnqkF8lcAMGq5HxX
	 qIndPmuP4HGPCj1+IIfugzpePk40tZ+vqOI37Aqb5+UadVej0Nsn4HeFffTmkuKKB6Rq3
	 U29m63EFWRp+LXLOAb+zFWQpPjd+iGwsJ67qthSZMp86z6axMzWu9W+XDC/GkiOEREA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792739015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=JS9yRa3gsYqtIw0fjP85MFyLdkCaMUM9T+pQZ7zRxjI=;
	b=fc74R+QD9Tjs4Z+wMTzkx88naF1d+RzYI6VGpYg1kBdojZLvW7denOrw2Jobp7gFvIFw
	 8ImrDBQ/ZDtXaiF0kfFpxbnWlREA2nb0FkXh/Yf0GS+L/phtd8RRdnTHo4uAQoe7eY3/6
	 SJV6lNyvCvH5wIlEZN9L9emD7rYzxa5M3IQ77RgAlamUUjHp4Ajbg6646yIYAz4erFtm5
	 fx3xHO06eowkcfsp4akTsmLPXHIqMYijhtbsKcwvagN+4QmcspxrttTH9YUOYojfb0paC
	 z7uBw7NkB4+zwSmwm5fNw9IjcRBr6YxthTLw/dEyE6zCB9Qc7hsXFrHQ8AQb/jsJLuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PzNA9ozi;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EC760A263D
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Oct 2026 07:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34EC760A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PzNA9ozi
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso4759685e9.1
        for <oe-kbuild@lists.linux.dev>; Fri, 23 Oct 2026 00:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792739013; x=1793343813; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JS9yRa3gsYqtIw0fjP85MFyLdkCaMUM9T+pQZ7zRxjI=;
        b=PzNA9oziT+z5Up+WJACIphspl2lRzvN9sCEDQiqKcx0bAmxtCXWPflltFiyhGvNn3j
         72Dq/TM2E7re6hCca1aHJvWGwzy35c1C+fv0sdfKghA+dkZRAMAAnUawBc0VTVGfFuvs
         GQ/eCWEaM/GD/DWhm15ckko+KrvJCSdEHS87IgfQJAVmQs9M4PZJLY6YnkiQTbYTWDMC
         /r6dVe28rG1S9j+P8aaYPVQOvEA6md1P8dk16MFFkmXo/gPCVpZetLHtZDThU03EwSNV
         0hGZx3cj35/rlbOZYolDvXcdmI2hWlqzW6hZ17C1W2JMbZCJrBANqGPjQRXahB3pL1yY
         irmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792739013; x=1793343813;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JS9yRa3gsYqtIw0fjP85MFyLdkCaMUM9T+pQZ7zRxjI=;
        b=W2QuiFUJ4EaajI1EYTx3VwE2IT5wCtOFxtBNq3WpZlSpzxiK9Te/cJG5WyzPRwchCd
         YiW9fqBSeid4bGrRtqAGP2bxL9SJLDSasLXb4M1/aJPdgMFaiM1LRX0elx+x9xCFTUBR
         w0VemKcMYFsYuyDxVjn1Siy271iNLSRuL7avhawVlB7w1oY2/JN1F6dCxxeHKNbaVxP3
         NVuZCouS3+8xTXjdTWXNCQSQi4Ta0kKmmeHNrm/WAAnsZdU1cReOkMbZUCy8AQEEihik
         GdtnlaVG/1+0SMe6LVJwZuWLILrc0zXsCenRYARrDRKojvImZoHCpB0SXSeOvgvGlfOC
         MQug==
X-Gm-Message-State: AFq9FYKlFD0L2K+C9rHntjvBGdY+ZwKh23eQgRHpyB8Hb9ydFSBopikL
	ydpeL1sTCuNt+AxHbxATa9LwuqbrgDx3wGQFL5yiKlevoUzgntLf/St7InVh2Lof4xt3yXja
X-Gm-Gg: AYBFou3kRBt3h2gN05wZzaVPNv4cSZ1MF4AusgrsXhy9v45xyniZgAKuJvsoqzJclrW
	9YeBO+WYqTpQSr5T1IuBHI4BlBjG9HxENGGbDdyeAvHDeKdUodmGStQX2zWi451jI/X8xO0GmsW
	0OEao+RSw/htuEV8Sn2yaHwm1LMHtTe2cFQrh7jYyoBjjavexoSCX06tY2Niz2g+CViBfIYT2Ze
	tEQpJToYuDO5hdgmycFEsyHObiJpaEw1Y8KT0xn8l/0VkY44PStXtocm16YXTHJCIhoUi8lhB2E
	2GU8dqtot4CXD6OZUk1zCxxQSBnE3X6gi3yBigBvxQGa3CYDSMYj9OJr16Vry/7Agsv8oDiFwGA
	A72fZpJi9S4NrBPjr18Rg+B5cpmfYuy3/lE0fp4l5iywltXuwsJAVRA96VL7u/fUWS5TYxQGqoj
	iBJgQQ8I/hesMC9CmknbakRd9Wo5LIpDpHzmsmdgwrroLf+gtS646ulKo3E92TfwSAa9LW5Oogg
	BstRP1Nvih5RgXjxTo6wSQgpMpR0FSo1+8IhH4GidvB+g+OTzn1KYwNOZ72hGVM9kQlQPhNSw==
X-Received: by 2002:a05:600c:5251:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4a216558881mr8928145e9.0.1792739013137;
        Fri, 23 Oct 2026 00:03:33 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2119c5885sm41514625e9.0.2026.10.23.00.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:03:31 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:03:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 12/12] fs/smb/client/cifsacl.c:1601
 id_mode_to_cifs_acl() warn: variable dereferenced before IS_ERR check
 'tlink' (see line 1598)
Message-ID: <202610230008.zv5aQbKX-lkp@intel.com>
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
Message-ID: <20261023070328.cphKB5JqHyM_5KBqV2vlKo6mCyt7gXLJyxPqzLwibTo@z>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   25ff308d0682f31e095c4a1d5fa5f2cfb081a7d3
commit: 5f36890d650ca9fb02072ea42f7699b8ffdff75e [12/12] fs/smb/client: implement chmod() for SMB3 POSIX Extensions
config: i386-randconfig-2200-20261022 (https://download.01.org/0day-ci/archive/20261023/202610230008.zv5aQbKX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610230008.zv5aQbKX-lkp@intel.com/

smatch warnings:
fs/smb/client/cifsacl.c:1601 id_mode_to_cifs_acl() warn: variable dereferenced before IS_ERR check 'tlink' (see line 1598)

vim +/tlink +1601 fs/smb/client/cifsacl.c

a5ff376966c079 fs/cifs/cifsacl.c       Shirish Pargaonkar              2011-10-13  1582  int
0f22053e811ca5 fs/cifs/cifsacl.c       Shyam Prasad N                  2020-08-17  1583  id_mode_to_cifs_acl(struct inode *inode, const char *path, __u64 *pnmode,
8abf2775dd425e fs/cifs/cifsacl.c       Eric W. Biederman               2013-02-06  1584  			kuid_t uid, kgid_t gid)
953f868138dbf4 fs/cifs/cifsacl.c       Steve French                    2007-10-31  1585  {
953f868138dbf4 fs/cifs/cifsacl.c       Steve French                    2007-10-31  1586  	int rc = 0;
a5ff376966c079 fs/cifs/cifsacl.c       Shirish Pargaonkar              2011-10-13  1587  	int aclflag = CIFS_ACL_DACL; /* default flag to set */
cce246ee5f3c7f fs/cifs/cifsacl.c       Steve French                    2008-04-09  1588  	__u32 secdesclen = 0;
f5065508897a92 fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-12  1589  	__u32 nsecdesclen = 0;
f5065508897a92 fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-12  1590  	__u32 dacloffset = 0;
298e73ac323a2b fs/smb/client/cifsacl.c ChenXiaoSong                    2024-08-22  1591  	struct smb_acl *dacl_ptr = NULL;
386660bd303ec1 fs/smb/client/cifsacl.c ChenXiaoSong                    2024-08-22  1592  	struct smb_ntsd *pntsd = NULL; /* acl obtained from server */
386660bd303ec1 fs/smb/client/cifsacl.c ChenXiaoSong                    2024-08-22  1593  	struct smb_ntsd *pnntsd = NULL; /* modified acl to be sent to server */
83e3bc23ef9ce7 fs/cifs/cifsacl.c       Steve French                    2014-02-02  1594  	struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
83e3bc23ef9ce7 fs/cifs/cifsacl.c       Steve French                    2014-02-02  1595  	struct tcon_link *tlink = cifs_sb_tlink(cifs_sb);
ecdcf622eb74b5 fs/cifs/cifsacl.c       Joe Perches via samba-technical 2017-05-07  1596  	struct smb_version_operations *ops;
a6603398278480 fs/cifs/cifsacl.c       Steve French                    2020-06-12  1597  	bool mode_from_sid, id_from_sid;
5f36890d650ca9 fs/smb/client/cifsacl.c Ralph Boehme                    2024-11-14 @1598  	bool posix = tlink_tcon(tlink)->posix_extensions;
                                                                                                                        ^^^^^
Dereference

3970acf7ddb9aa fs/cifs/cifsacl.c       Boris Protopopov                2020-12-18  1599  	const u32 info = 0;
83e3bc23ef9ce7 fs/cifs/cifsacl.c       Steve French                    2014-02-02  1600  
83e3bc23ef9ce7 fs/cifs/cifsacl.c       Steve French                    2014-02-02 @1601  	if (IS_ERR(tlink))
                                                                                                           ^^^^^
Checked too late.

83e3bc23ef9ce7 fs/cifs/cifsacl.c       Steve French                    2014-02-02  1602  		return PTR_ERR(tlink);
ecdcf622eb74b5 fs/cifs/cifsacl.c       Joe Perches via samba-technical 2017-05-07  1603  
ecdcf622eb74b5 fs/cifs/cifsacl.c       Joe Perches via samba-technical 2017-05-07  1604  	ops = tlink_tcon(tlink)->ses->server->ops;
953f868138dbf4 fs/cifs/cifsacl.c       Steve French                    2007-10-31  1605  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

