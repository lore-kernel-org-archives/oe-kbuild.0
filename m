Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794806784;
	b=kqn3t6RAPSiSVYC6UAf0ytkTw9GawKZzHmp0subDoOGNcAADZFpa4DnEkENX+47WJjRb
	 xdxZuS5oxhMQn4Pjbv3DXKqU2FF1OE64kYXIfv3ACmBYPsw+X3N3iB44VcMzdQzfzLvFW
	 gcNihIWRlXroKm12kq4kkdh86umj4/AUiPZ2W/1KeMVSGUzth0pTRCjBdlujndJu2KSY+
	 ssRxuuYeRDitaJIRaZsZ0CCjWjRIvpU3k9F8VCpb/bnJf1+2V9qkFnIe1w9Jpd8wXkdAY
	 gFkMFgp9y96vsezantEYTZNBCpYLgRNURcwMMywwCNh4/bLQNrCvB0P3i8hfm78/i3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794806784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=hz56qYSOSs9DQhsj5maa5eeVQHnnDEv1CGruA/BwN70=;
	b=5l2XoF6oIZycmG22Me3m5u6cJ0nXcTfkkgx/Mtb98lZUXq3+eL4ab9o7wZPiJUUkuHHH
	 1JTvWVoI5PSAAEI5Xpi6BNKkHLBo6gdMi0mSUeYKoTJUT8St7NIJcI+Tmjp8MfPxeoRnh
	 162oyBC8F3KcX/zPyqVA5QiTVld7NAgbk5FudHkVkuZ8u2++j2cMZwdoOWXQLztwVdzMS
	 3qkvMsiGD3Q5nxeFowT1e1XBwP0TA+ek2pE4zBDwMNCI4wqaQHAy8mXRug24pOE9s+Rka
	 KAUAIzymah2F0C82DGzNTgB48uWQGN7gFU0dcpIfLCJraaIM8LiJ0xmJ5zi675/yoJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cLzISRzO;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D4A606A323
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Nov 2026 05:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60D4A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cLzISRzO
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-497614c95f0so1317241f8f.1
        for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 21:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794806783; x=1795411583; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz56qYSOSs9DQhsj5maa5eeVQHnnDEv1CGruA/BwN70=;
        b=cLzISRzOWMMi/GURKCeRJOLZeFc7WooTXLRZSYDclZ+TW5IoewfL9iOZ2FP6ubOz41
         PCGJxE7YRW4B/D33dJmy4nNkuWITyQFHBHl7fNeMh8B9DLos1FUNC8bHRK9B72D3y+Ce
         HTK0emXXR8bcVTxatjZFPH+xr1sAEXEME5m18Jq53VBku+dCU+Keoxzkmf5kemdg/ghf
         fPCxfJX0yY1/28FdPS23V/h2VpPVfsN1e4CcSVLBv2anrzJhol/wGKiuM7vyAlQ1Z81V
         nDy+sbCPz/y6+eDKRRghSA+3cPKRMWiVNAPvQpjk9aEFkbImt9sl3L+Ip3p2yV2lJGri
         SrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794806783; x=1795411583;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hz56qYSOSs9DQhsj5maa5eeVQHnnDEv1CGruA/BwN70=;
        b=PZjMM6RgjT5aQ9p2B4HzAmXG3kmQ14nUqj08Up7QefrLF71AnVxHBoxoIWvBs+/R98
         5YW+7TU+RsWujkzsJi4sOJTjrYltgXDqqhHB/HkLdHkIepsf81u0xBG2YTpckOhSJG+L
         icpcynIrGybF2J7esMpJ7L296U2M7tlz3gfs22VzWaN6PmzAmkfTgeMlLybtMHo4rQKT
         D0GwHcBv4ASfohTHhkdtjv+WtXbRvSX2Xi6fKkvzl0uccOLuJ0a2/WVtQ5c8glPEsBh+
         +UA55zCyt8NEnXvKgL+JLlHHd94S5Ej8nPEbkkSjZwkp0ZtTq8fcgoqUKMItN4+8Zo1Z
         rB0A==
X-Gm-Message-State: APuU4Z+TQVz+kFubF4zoRrNn/KC3yM2hmJUIXk0uksvPVMjfVjc5+2ml
	p9dDyJno5/OeacDLb34DAvC/OfK+rup+02xzPLykK90lgDYLaV0C5C4hQeu+pRfrAfDzfRYS
X-Gm-Gg: AYBFou1RHkZLfWuNCM7tQ5f36lfsPswYOmFG2miK6+LSp+Nwcth2pj3MhSD37lwI8gp
	8Q+v8IA6N55L6Y1Pqt2Gkuox5haAVmGpdFXg7ZK7/5AMm3Ddr8vQ+8QfqibHTlVIIBqS4mX8Px6
	B3xtYhy6X9zKr7Vf8MNZnYEteZH506sATPY0sc2O+OpdtGRngYy1siBXK6677CR4wnO0T4U/gCK
	JsP9e75xrXoUd04m8Fhp8jHmAmSlt4iBdk5xx/ty0JUF4H65Tvj+/lRfIkz1k3Wkra9oKj7bSh3
	4VOSWdxXMkuMS6EqxGYIcJdSNDshfG1TUDN3FAtuXT9HXjeJSSiv0gAeWBobiXedgi/Hm3h9kDI
	2LDpYB8sM3UemN2LxvVCwsJ4OxTznognfDVRDQE2mMVtNu7f3YlLG78643ATmuy6BADF3T3WOQy
	I0wFO2fvvi64puzlSnTjbrIPrS61LKt0XtP4Ry7QNBKKBm8fXdGdx7A9G3FArj5ZGi5qbaCUcAM
	8jmCpYCt1mf8oSadYDHOmu+ork/WqXQmu1GZN7Q2y78Yky9zw4PZtmMoGKf8zMKhyvUm7O5rsqX
	IMZmwkyvhBWwi78mUy0MgkUoKeW0M6SoBOpORLzRJcgf6veaRTtjwJdlaqDC6l/hjBESLWxmhfF
	KUVaOnGl0lTIMk9lsffyISFbNN+MgSds3RK0nXiruG95ErXPrfl7968bjG5j/d4Ts2og=
X-Received: by 2002:a05:6000:26c8:b0:491:8462:20cc with SMTP id ffacd0b85a97d-49c73ce5e65mr21515228f8f.37.1794806782617;
        Sun, 15 Nov 2026 21:26:22 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60da0a03sm16137617f8f.53.2026.11.15.21.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:26:22 -0800 (PST)
Date: Mon, 16 Nov 2026 08:26:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Phillip Lougher <phillip@squashfs.org.uk>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	mm-commits@vger.kernel.org
Subject: [akpm-mm:mm-nonmm-unstable 139/151] fs/squashfs/namei.c:283
 squashfs_lookup() warn: passing zero to 'ERR_PTR'
Message-ID: <202611131955.0Gd7ipSP-lkp@intel.com>
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
Message-ID: <20261116052618.U16RpJ_04RiyxwJIgOtlkv8YS5gr-s-IpqUpwMDX02I@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   152f0559e66c079f717de375f133ff127afb1f58
commit: 5213b0a08263b2191b86b046c3a63f11e8abc399 [139/151] Squashfs: fix variables in directory code and add more sanity checks
config: um-randconfig-2200-20261113 (https://download.01.org/0day-ci/archive/20261113/202611131955.0Gd7ipSP-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611131955.0Gd7ipSP-lkp@intel.com/

New smatch warnings:
fs/squashfs/namei.c:283 squashfs_lookup() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +283 fs/squashfs/namei.c

c88da2c979369e6 Phillip Lougher 2009-01-05  164  static struct dentry *squashfs_lookup(struct inode *dir, struct dentry *dentry,
00cd8dd3bf95f2c Al Viro         2012-06-10  165  				 unsigned int flags)
c88da2c979369e6 Phillip Lougher 2009-01-05  166  {
c88da2c979369e6 Phillip Lougher 2009-01-05  167  	const unsigned char *name = dentry->d_name.name;
c88da2c979369e6 Phillip Lougher 2009-01-05  168  	int len = dentry->d_name.len;
c88da2c979369e6 Phillip Lougher 2009-01-05  169  	struct inode *inode = NULL;
c88da2c979369e6 Phillip Lougher 2009-01-05  170  	struct squashfs_sb_info *msblk = dir->i_sb->s_fs_info;
c88da2c979369e6 Phillip Lougher 2009-01-05  171  	struct squashfs_dir_header dirh;
4dddf794b08bef0 Phillip Lougher 2026-11-11  172  	struct squashfs_dir_entry *dire = NULL;
4dddf794b08bef0 Phillip Lougher 2026-11-11  173  	u64 block = squashfs_dir_start(squashfs_i(dir)->start, msblk);
c88da2c979369e6 Phillip Lougher 2009-01-05  174  	int offset = squashfs_i(dir)->offset;
5213b0a08263b21 Phillip Lougher 2026-11-11  175  	int err;
5213b0a08263b21 Phillip Lougher 2026-11-11  176  	loff_t length;
52e9ce1c0f20606 Phillip Lougher 2013-09-03  177  	unsigned int dir_count, size;
c88da2c979369e6 Phillip Lougher 2009-01-05  178  
4dddf794b08bef0 Phillip Lougher 2026-11-11  179  	TRACE("Entered squashfs_lookup [%llx:%x]\n", squashfs_i(dir)->start, offset);
4dddf794b08bef0 Phillip Lougher 2026-11-11  180  
4dddf794b08bef0 Phillip Lougher 2026-11-11  181  	if (block < 0)
4dddf794b08bef0 Phillip Lougher 2026-11-11  182  		goto data_error;
c88da2c979369e6 Phillip Lougher 2009-01-05  183  
c88da2c979369e6 Phillip Lougher 2009-01-05  184  	dire = kmalloc(sizeof(*dire) + SQUASHFS_NAME_LEN + 1, GFP_KERNEL);
c88da2c979369e6 Phillip Lougher 2009-01-05  185  	if (dire == NULL) {
c88da2c979369e6 Phillip Lougher 2009-01-05  186  		ERROR("Failed to allocate squashfs_dir_entry\n");
c88da2c979369e6 Phillip Lougher 2009-01-05  187  		return ERR_PTR(-ENOMEM);
c88da2c979369e6 Phillip Lougher 2009-01-05  188  	}
c88da2c979369e6 Phillip Lougher 2009-01-05  189  
c88da2c979369e6 Phillip Lougher 2009-01-05  190  	if (len > SQUASHFS_NAME_LEN) {
c88da2c979369e6 Phillip Lougher 2009-01-05  191  		err = -ENAMETOOLONG;
c88da2c979369e6 Phillip Lougher 2009-01-05  192  		goto failed;
c88da2c979369e6 Phillip Lougher 2009-01-05  193  	}
c88da2c979369e6 Phillip Lougher 2009-01-05  194  
c88da2c979369e6 Phillip Lougher 2009-01-05  195  	length = get_dir_index_using_name(dir->i_sb, &block, &offset,
c88da2c979369e6 Phillip Lougher 2009-01-05  196  				squashfs_i(dir)->dir_idx_start,
c88da2c979369e6 Phillip Lougher 2009-01-05  197  				squashfs_i(dir)->dir_idx_offset,
5213b0a08263b21 Phillip Lougher 2026-11-11  198  				squashfs_i(dir)->dir_idx_cnt,
5213b0a08263b21 Phillip Lougher 2026-11-11  199  				i_size_read(dir), name);
c88da2c979369e6 Phillip Lougher 2009-01-05  200  
c88da2c979369e6 Phillip Lougher 2009-01-05  201  	while (length < i_size_read(dir)) {
c88da2c979369e6 Phillip Lougher 2009-01-05  202  		/*
c88da2c979369e6 Phillip Lougher 2009-01-05  203  		 * Read directory header.
c88da2c979369e6 Phillip Lougher 2009-01-05  204  		 */
5213b0a08263b21 Phillip Lougher 2026-11-11  205  		if (!squashfs_dir_space(dir, length, sizeof(dirh)))
5213b0a08263b21 Phillip Lougher 2026-11-11  206  			goto read_failure;
5213b0a08263b21 Phillip Lougher 2026-11-11  207  
c88da2c979369e6 Phillip Lougher 2009-01-05  208  		err = squashfs_read_metadata(dir->i_sb, &dirh, &block,
c88da2c979369e6 Phillip Lougher 2009-01-05  209  				&offset, sizeof(dirh));
c88da2c979369e6 Phillip Lougher 2009-01-05  210  		if (err < 0)
c88da2c979369e6 Phillip Lougher 2009-01-05  211  			goto read_failure;
c88da2c979369e6 Phillip Lougher 2009-01-05  212  
c88da2c979369e6 Phillip Lougher 2009-01-05  213  		length += sizeof(dirh);
c88da2c979369e6 Phillip Lougher 2009-01-05  214  
c88da2c979369e6 Phillip Lougher 2009-01-05  215  		dir_count = le32_to_cpu(dirh.count) + 1;
44cff8a9ee8a974 Phillip Lougher 2011-03-15  216  
4826d83d9c4f6bb Ajeet Yadav     2012-02-02  217  		if (dir_count > SQUASHFS_DIR_COUNT)
44cff8a9ee8a974 Phillip Lougher 2011-03-15  218  			goto data_error;
44cff8a9ee8a974 Phillip Lougher 2011-03-15  219  
c88da2c979369e6 Phillip Lougher 2009-01-05  220  		while (dir_count--) {
c88da2c979369e6 Phillip Lougher 2009-01-05  221  			/*
c88da2c979369e6 Phillip Lougher 2009-01-05  222  			 * Read directory entry.
c88da2c979369e6 Phillip Lougher 2009-01-05  223  			 */
5213b0a08263b21 Phillip Lougher 2026-11-11  224  			if (!squashfs_dir_space(dir, length, sizeof(*dire)))
5213b0a08263b21 Phillip Lougher 2026-11-11  225  				goto read_failure;

We need an error code on this path.

5213b0a08263b21 Phillip Lougher 2026-11-11  226  
c88da2c979369e6 Phillip Lougher 2009-01-05  227  			err = squashfs_read_metadata(dir->i_sb, dire, &block,
c88da2c979369e6 Phillip Lougher 2009-01-05  228  					&offset, sizeof(*dire));
c88da2c979369e6 Phillip Lougher 2009-01-05  229  			if (err < 0)
c88da2c979369e6 Phillip Lougher 2009-01-05  230  				goto read_failure;
c88da2c979369e6 Phillip Lougher 2009-01-05  231  
5213b0a08263b21 Phillip Lougher 2026-11-11  232  			length += sizeof(*dire);
c88da2c979369e6 Phillip Lougher 2009-01-05  233  			size = le16_to_cpu(dire->size) + 1;
c88da2c979369e6 Phillip Lougher 2009-01-05  234  
44cff8a9ee8a974 Phillip Lougher 2011-03-15  235  			/* size should never be larger than SQUASHFS_NAME_LEN */
44cff8a9ee8a974 Phillip Lougher 2011-03-15  236  			if (size > SQUASHFS_NAME_LEN)
44cff8a9ee8a974 Phillip Lougher 2011-03-15  237  				goto data_error;
44cff8a9ee8a974 Phillip Lougher 2011-03-15  238  
5213b0a08263b21 Phillip Lougher 2026-11-11  239  			if (!squashfs_dir_space(dir, length, size))
5213b0a08263b21 Phillip Lougher 2026-11-11  240  				goto read_failure;

And here.

5213b0a08263b21 Phillip Lougher 2026-11-11  241  
c88da2c979369e6 Phillip Lougher 2009-01-05  242  			err = squashfs_read_metadata(dir->i_sb, dire->name,
c88da2c979369e6 Phillip Lougher 2009-01-05  243  					&block, &offset, size);
c88da2c979369e6 Phillip Lougher 2009-01-05  244  			if (err < 0)
c88da2c979369e6 Phillip Lougher 2009-01-05  245  				goto read_failure;
c88da2c979369e6 Phillip Lougher 2009-01-05  246  
5213b0a08263b21 Phillip Lougher 2026-11-11  247  			length += size;
c88da2c979369e6 Phillip Lougher 2009-01-05  248  
c88da2c979369e6 Phillip Lougher 2009-01-05  249  			if (name[0] < dire->name[0])
c88da2c979369e6 Phillip Lougher 2009-01-05  250  				goto exit_lookup;
c88da2c979369e6 Phillip Lougher 2009-01-05  251  
c88da2c979369e6 Phillip Lougher 2009-01-05  252  			if (len == size && !strncmp(name, dire->name, len)) {
c88da2c979369e6 Phillip Lougher 2009-01-05  253  				unsigned int blk, off, ino_num;
c88da2c979369e6 Phillip Lougher 2009-01-05  254  				long long ino;
c88da2c979369e6 Phillip Lougher 2009-01-05  255  				blk = le32_to_cpu(dirh.start_block);
c88da2c979369e6 Phillip Lougher 2009-01-05  256  				off = le16_to_cpu(dire->offset);
c88da2c979369e6 Phillip Lougher 2009-01-05  257  				ino_num = le32_to_cpu(dirh.inode_number) +
c88da2c979369e6 Phillip Lougher 2009-01-05  258  					(short) le16_to_cpu(dire->inode_number);
cec4a69189091ba Phillip Lougher 2026-11-11  259  				ino = squashfs_mkinode(blk, off);
c88da2c979369e6 Phillip Lougher 2009-01-05  260  
c88da2c979369e6 Phillip Lougher 2009-01-05  261  				TRACE("calling squashfs_iget for directory "
c88da2c979369e6 Phillip Lougher 2009-01-05  262  					"entry %s, inode  %x:%x, %d\n", name,
c88da2c979369e6 Phillip Lougher 2009-01-05  263  					blk, off, ino_num);
c88da2c979369e6 Phillip Lougher 2009-01-05  264  
c88da2c979369e6 Phillip Lougher 2009-01-05  265  				inode = squashfs_iget(dir->i_sb, ino, ino_num);
c88da2c979369e6 Phillip Lougher 2009-01-05  266  				goto exit_lookup;
c88da2c979369e6 Phillip Lougher 2009-01-05  267  			}
c88da2c979369e6 Phillip Lougher 2009-01-05  268  		}
c88da2c979369e6 Phillip Lougher 2009-01-05  269  	}
c88da2c979369e6 Phillip Lougher 2009-01-05  270  
c88da2c979369e6 Phillip Lougher 2009-01-05  271  exit_lookup:
c88da2c979369e6 Phillip Lougher 2009-01-05  272  	kfree(dire);
c88da2c979369e6 Phillip Lougher 2009-01-05  273  	return d_splice_alias(inode, dentry);
c88da2c979369e6 Phillip Lougher 2009-01-05  274  
44cff8a9ee8a974 Phillip Lougher 2011-03-15  275  data_error:
44cff8a9ee8a974 Phillip Lougher 2011-03-15  276  	err = -EIO;
44cff8a9ee8a974 Phillip Lougher 2011-03-15  277  
c88da2c979369e6 Phillip Lougher 2009-01-05  278  read_failure:
c88da2c979369e6 Phillip Lougher 2009-01-05  279  	ERROR("Unable to read directory block [%llx:%x]\n",
4dddf794b08bef0 Phillip Lougher 2026-11-11  280  		squashfs_i(dir)->start, squashfs_i(dir)->offset);
c88da2c979369e6 Phillip Lougher 2009-01-05  281  failed:
c88da2c979369e6 Phillip Lougher 2009-01-05  282  	kfree(dire);
c88da2c979369e6 Phillip Lougher 2009-01-05 @283  	return ERR_PTR(err);
c88da2c979369e6 Phillip Lougher 2009-01-05  284  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

