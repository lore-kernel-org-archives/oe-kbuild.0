Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E533826FDA9
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Nov 2025 13:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764079090; cv=none; b=a0eghadIBSW11kXoXwifLlqXR1pqCGkiuO/eFXUuVWm3m544pTiRVmh0HiSO9L2u0VwgWo3nMBHtZf8m12HKyf8Li+U6K0nHL5RUUQhb2PMKi9pAiVaj3wV9MllpqYCRGBMh+RxiSQB7jnOq/69htgczSk24nrMmHhdy5SlpRrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764079090; c=relaxed/simple;
	bh=WYjGwL3I730SSt7dYHK/8zPpUf14fEJ+zheIGXyFMjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EVbqV/7EvUdZeqd9eSx0CJyWYy1qazyni3cXGJt1cnbFJH9kbR2m6yOnZtAP8bEK9snacNgRZTGJh8bd7p+a1ftjZXIbNKdHGz4+RVijR8p6uM3mTaF8j2mv2LomZ5uDpI2l/a9cKFQYXjE/FdRvJMAJT3EGu2axqY7VsmIjHjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jy7RI69M; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jy7RI69M"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b387483bbso4198500f8f.1
        for <oe-kbuild@lists.linux.dev>; Tue, 25 Nov 2025 05:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764079085; x=1764683885; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RM5k3vhkLTVaroSOpEJzNbtDYtsl+y2VQs+4xDyHazU=;
        b=Jy7RI69MirGlefE9V1/0VAFTbR3m4/ntidY0B5TQucGAIwLZPbOGYLh+NTXTH/cC48
         lUoZ4IoFkuQmzY5VEWkdszL/EctJpIwoALZKWmqEQ0k3tI48Bqp8SFJgm1EbrBJYxXig
         ghfgGyqBjNIWu7UCTvAZW8vTVPsoKvizfiTiH5IqJrxrcjlvKkTTt0NEWkwOtO6074rn
         an6etxbSAQpe0VVw5Q9lhqcYKKgKl73ISRyCZfswIDrCEtyG6OsREwbuywf3Mqk8FGoc
         wtAVSf7Ad53ki6mjyp48vNvN+FIuV4h147blA7f/FAKyG1abfEVYgmfdgSpjSSiXFo/k
         k9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764079085; x=1764683885;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RM5k3vhkLTVaroSOpEJzNbtDYtsl+y2VQs+4xDyHazU=;
        b=U2hGqMs+PiNLNWEmPJaAn08hpltgUSxQMvHIBejrmXxZhqXfO7vHudqhhz/A/ihjbN
         YgB3Q2bWRBlpp5b/ZY4IviZ4xlQ85CgO++1PwMJfDlGDfhesdk2XChfbBn596nDkaDDm
         pn2eTsuJ6a5lvK81lYug0DlvhOL2WzIHN+4tXHuqLgf6AI0eWFvg9Rf2tzWgHYemZxz6
         S2rxL9JLhRt4q6DzVi5ZpN29Y2LSdh/GCZ9lIzcUExqTxKQgyprYdsk/3RZqwFp5XmR2
         /ZxtZ3jUA/8YsP/7/iawK6JxyZtcAUPtvwJOyG9nowQ2yTUGJl4KmOW7j57ueT1H60uc
         FlGw==
X-Gm-Message-State: AOJu0YxlPs1EyPNOKPXTeoFhtOI5PnrwwHNsos1Pz6NTzDtqPZdG0YBm
	q33R0e8UmHSSUWUABGBo2bEL68XKZKPydoCi5Jdfe6XCKqSE7UH7c19b0UF9Sr/GQ8Uhbj6M5oA
	Yejkt
X-Gm-Gg: ASbGncuigfX9CQ+fLyTpV3iPZUQ4aB74m10Cnn84M6nrZlICh94VMR4FdkyYS4n69qa
	q4SNLk5KHC68b1tYpkLo3qFM+M9p1Ha6MOMEeO4Aa2HUylOcLmAMGRm20vvIxMy4Gm6Lp/vCyWL
	VcfvJREOo/kvXFFrv6eyz+wwPD1jqOrKztJhpJGfab8Gdf2RGSy/11g+5s+3Km/a4KyGaww0/fc
	NnU6r/+JVkUKwaV4vQD1awU1mXzOW5YVJiA/R4pSAqapaKJf3kP8OB3bR9vLccyEsKdtYksg5+Q
	2xDt8rHKct6K/njY7t1cwt1PXTNaNDwSObtUd8j/ayLiEYtg7J1LCVB2i0V//RztSBKNzuVOOMS
	lFO+yQ5Xoy/7Blyfar/0IUljtKD8x1Qx4cdWYWZmUHt9G96I5XyQh3zupVoYEBrE6EFwkl7LunW
	nb+8MfuaSw0uZeMnFA
X-Google-Smtp-Source: AGHT+IGuTRdHTVon0Z3FbuwAPkFKcHr0nkK6MDcNLipfXtQpK3NwZedVBwC3XhjY79gTGUkgUZa5Fw==
X-Received: by 2002:a05:6000:40cc:b0:42b:2a09:2e55 with SMTP id ffacd0b85a97d-42cc19fc746mr17925292f8f.0.1764079084436;
        Tue, 25 Nov 2025 05:58:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7fa3a76sm34535111f8f.24.2025.11.25.05.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 05:58:03 -0800 (PST)
Date: Tue, 25 Nov 2025 16:58:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Kent Overstreet <kent.overstreet@linux.dev>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 986/990] fs/bcachefs/data/read.c:1327
 __bch2_read_extent() error: we previously assumed 'ca' could be null (see
 line 1307)
Message-ID: <202511252118.PY7eERkg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251125135800.QLQKw-LdPHdeGsL1M7WtSsMNV4y-nCbz8vRDfudvolc@z>

tree:   https://github.com/koverstreet/bcachefs master
head:   09be9a5a514734ebdd6fd840964815b2b0823c66
commit: 312c51e00acfd6ab012061bbb080ff0b524d7b29 [986/990] bcachefs: read_extent_rbio_alloc()
config: riscv-randconfig-r072-20251125 (https://download.01.org/0day-ci/archive/20251125/202511252118.PY7eERkg-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511252118.PY7eERkg-lkp@intel.com/

smatch warnings:
fs/bcachefs/data/read.c:1327 __bch2_read_extent() error: we previously assumed 'ca' could be null (see line 1307)

vim +/ca +1327 fs/bcachefs/data/read.c

312c51e00acfd6 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1166  int __bch2_read_extent(struct btree_trans *trans,
312c51e00acfd6 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1167  		       struct bch_read_bio *orig,
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1168  		       struct bvec_iter iter, struct bpos read_pos,
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1169  		       enum btree_id data_btree, struct bkey_s_c k,
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1170  		       unsigned offset_into_extent,
ca24130ee412d9 fs/bcachefs/io_read.c   Kent Overstreet 2024-12-28  1171  		       struct bch_io_failures *failed, unsigned flags, int dev)
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1172  {
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1173  	struct bch_fs *c = trans->c;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1174  	struct extent_ptr_decoded pick;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1175  	struct bch_read_bio *rbio = NULL;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1176  	bool bounce = false, read_full = false, narrow_crcs = false;
3fb8bacb14b6fb fs/bcachefs/io_read.c   Kent Overstreet 2025-03-12  1177  	struct data_update *u = rbio_data_update(orig);
943f0cfb1559ac fs/bcachefs/io_read.c   Kent Overstreet 2025-03-07  1178  	int ret = 0;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1179  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1180  	if (bkey_extent_is_inline_data(k.k)) {
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1181  		unsigned bytes = min_t(unsigned, iter.bi_size,
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1182  				       bkey_inline_data_bytes(k.k));
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1183  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1184  		swap(iter.bi_size, bytes);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1185  		memcpy_to_bio(&orig->bio, iter, bkey_inline_data_p(k));
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1186  		swap(iter.bi_size, bytes);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1187  		bio_advance_iter(&orig->bio, &iter, bytes);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1188  		zero_fill_bio_iter(&orig->bio, iter);
1949a429883eb0 fs/bcachefs/data/read.c Kent Overstreet 2025-11-22  1189  		this_cpu_add(c->counters.now[BCH_COUNTER_io_read_inline],
157ea5834133c0 fs/bcachefs/io_read.c   Kent Overstreet 2025-02-03  1190  			     bvec_iter_sectors(iter));
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1191  		goto out_read_done;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1192  	}
cb8336ca42e493 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1193  
cb8336ca42e493 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1194  	if ((bch2_bkey_extent_flags(k) & BIT_ULL(BCH_EXTENT_FLAG_poisoned)) &&
7e1ba7e98886e3 fs/bcachefs/io_read.c   Kent Overstreet 2025-09-02  1195  	    !orig->data_update) {
7e1ba7e98886e3 fs/bcachefs/io_read.c   Kent Overstreet 2025-09-02  1196  		ret = bch_err_throw(c, extent_poisoned);
7e1ba7e98886e3 fs/bcachefs/io_read.c   Kent Overstreet 2025-09-02  1197  		goto err;
7e1ba7e98886e3 fs/bcachefs/io_read.c   Kent Overstreet 2025-09-02  1198  	}
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1199  retry_pick:
943f0cfb1559ac fs/bcachefs/io_read.c   Kent Overstreet 2025-03-07  1200  	ret = bch2_bkey_pick_read_device(c, k, failed, &pick, dev);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1201  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1202  	/* hole or reservation - just zero fill: */
943f0cfb1559ac fs/bcachefs/io_read.c   Kent Overstreet 2025-03-07  1203  	if (!ret)
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1204  		goto hole;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1205  
943f0cfb1559ac fs/bcachefs/io_read.c   Kent Overstreet 2025-03-07  1206  	if (unlikely(ret < 0)) {
760be1ad5e71b3 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1207  		if (ret == -BCH_ERR_data_read_csum_err) {
760be1ad5e71b3 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1208  			int ret2 = maybe_poison_extent(trans, orig, data_btree, k);
760be1ad5e71b3 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1209  			if (ret2) {
760be1ad5e71b3 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1210  				ret = ret2;
760be1ad5e71b3 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1211  				goto err;
760be1ad5e71b3 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1212  			}
760be1ad5e71b3 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1213  
760be1ad5e71b3 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1214  			trace_and_count(c, io_read_fail_and_poison, &orig->bio);
760be1ad5e71b3 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1215  		}
760be1ad5e71b3 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1216  
54f229a0df604d fs/bcachefs/data/read.c Kent Overstreet 2025-10-16  1217  		if (!(flags & BCH_READ_in_retry)) {
ec1f2d2073b058 fs/bcachefs/io_read.c   Kent Overstreet 2025-07-14  1218  			CLASS(printbuf, buf)();
f7727a6767277a fs/bcachefs/io_read.c   Kent Overstreet 2024-09-28  1219  			bch2_read_err_msg_trans(trans, &buf, orig, read_pos);
943f0cfb1559ac fs/bcachefs/io_read.c   Kent Overstreet 2025-03-07  1220  			prt_printf(&buf, "%s\n  ", bch2_err_str(ret));
bf611567b791f3 fs/bcachefs/io_read.c   Kent Overstreet 2024-09-06  1221  			bch2_bkey_val_to_text(&buf, c, k);
f7727a6767277a fs/bcachefs/io_read.c   Kent Overstreet 2024-09-28  1222  			bch_err_ratelimited(c, "%s", buf.buf);
54f229a0df604d fs/bcachefs/data/read.c Kent Overstreet 2025-10-16  1223  		}
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1224  		goto err;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1225  	}
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1226  
312c51e00acfd6 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1227  	if (bch2_csum_type_is_encryption(pick.crc.csum_type) &&
312c51e00acfd6 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1228  	    unlikely(!c->chacha20_key_set)) {
54f229a0df604d fs/bcachefs/data/read.c Kent Overstreet 2025-10-16  1229  		if (!(flags & BCH_READ_in_retry)) {
ec1f2d2073b058 fs/bcachefs/io_read.c   Kent Overstreet 2025-07-14  1230  			CLASS(printbuf, buf)();
f7727a6767277a fs/bcachefs/io_read.c   Kent Overstreet 2024-09-28  1231  			bch2_read_err_msg_trans(trans, &buf, orig, read_pos);
f7727a6767277a fs/bcachefs/io_read.c   Kent Overstreet 2024-09-28  1232  			prt_printf(&buf, "attempting to read encrypted data without encryption key\n  ");
dba8243f3b466d fs/bcachefs/io_read.c   Kent Overstreet 2024-11-25  1233  			bch2_bkey_val_to_text(&buf, c, k);
dba8243f3b466d fs/bcachefs/io_read.c   Kent Overstreet 2024-11-25  1234  
f7727a6767277a fs/bcachefs/io_read.c   Kent Overstreet 2024-09-28  1235  			bch_err_ratelimited(c, "%s", buf.buf);
54f229a0df604d fs/bcachefs/data/read.c Kent Overstreet 2025-10-16  1236  		}
09b9c72bd4b77a fs/bcachefs/io_read.c   Kent Overstreet 2025-05-28  1237  		ret = bch_err_throw(c, data_read_no_encryption_key);
dba8243f3b466d fs/bcachefs/io_read.c   Kent Overstreet 2024-11-25  1238  		goto err;
dba8243f3b466d fs/bcachefs/io_read.c   Kent Overstreet 2024-11-25  1239  	}
dba8243f3b466d fs/bcachefs/io_read.c   Kent Overstreet 2024-11-25  1240  
cca2c0d224c17c fs/bcachefs/io_read.c   Kent Overstreet 2025-04-18  1241  	struct bch_dev *ca = bch2_dev_get_ioref(c, pick.ptr.dev, READ,
cca2c0d224c17c fs/bcachefs/io_read.c   Kent Overstreet 2025-04-18  1242  					BCH_DEV_READ_REF_io_read);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1243  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1244  	/*
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1245  	 * Stale dirty pointers are treated as IO errors, but @failed isn't
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1246  	 * allocated unless we're in the retry path - so if we're not in the
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1247  	 * retry path, don't check here, it'll be caught in bch2_read_endio()
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1248  	 * and we'll end up in the retry path:
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1249  	 */
312c51e00acfd6 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1250  	if (unlikely(flags & BCH_READ_in_retry) &&
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1251  	    !pick.ptr.cached &&
465bf6f42aac14 fs/bcachefs/io_read.c   Kent Overstreet 2024-05-03  1252  	    ca &&
3858aa4268b2f7 fs/bcachefs/io_read.c   Kent Overstreet 2024-04-30  1253  	    unlikely(dev_ptr_stale(ca, &pick.ptr))) {
db39a35dde9dcf fs/bcachefs/io_read.c   Kent Overstreet 2024-05-01  1254  		read_from_stale_dirty_pointer(trans, ca, k, pick.ptr);
2a82b05ef052c3 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1255  		bch2_mark_io_failure(failed, &pick, bch_err_throw(c, data_read_ptr_stale_dirty));
44c1946444a82a fs/bcachefs/data/read.c Kent Overstreet 2025-11-05  1256  		propagate_io_error_to_data_update(c, rbio, &pick);
cca2c0d224c17c fs/bcachefs/io_read.c   Kent Overstreet 2025-04-18  1257  		enumerated_ref_put(&ca->io_ref[READ], BCH_DEV_READ_REF_io_read);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1258  		goto retry_pick;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1259  	}
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1260  
3fb8bacb14b6fb fs/bcachefs/io_read.c   Kent Overstreet 2025-03-12  1261  	if (likely(!u)) {
9157b3ddfb151d fs/bcachefs/io_read.c   Kent Overstreet 2025-01-17  1262  		if (!(flags & BCH_READ_last_fragment) ||
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1263  		    bio_flagged(&orig->bio, BIO_CHAIN))
9157b3ddfb151d fs/bcachefs/io_read.c   Kent Overstreet 2025-01-17  1264  			flags |= BCH_READ_must_clone;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1265  
1e9af0dcebc6b2 fs/bcachefs/data/read.c Kent Overstreet 2025-10-30  1266  		narrow_crcs = !(flags & BCH_READ_in_retry) && can_narrow_crc(pick.crc);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1267  
9157b3ddfb151d fs/bcachefs/io_read.c   Kent Overstreet 2025-01-17  1268  		if (narrow_crcs && (flags & BCH_READ_user_mapped))
9157b3ddfb151d fs/bcachefs/io_read.c   Kent Overstreet 2025-01-17  1269  			flags |= BCH_READ_must_bounce;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1270  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1271  		EBUG_ON(offset_into_extent + bvec_iter_sectors(iter) > k.k->size);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1272  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1273  		if (crc_is_compressed(pick.crc) ||
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1274  		    (pick.crc.csum_type != BCH_CSUM_none &&
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1275  		     (bvec_iter_sectors(iter) != pick.crc.uncompressed_size ||
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1276  		      (bch2_csum_type_is_encryption(pick.crc.csum_type) &&
9157b3ddfb151d fs/bcachefs/io_read.c   Kent Overstreet 2025-01-17  1277  		       (flags & BCH_READ_user_mapped)) ||
9157b3ddfb151d fs/bcachefs/io_read.c   Kent Overstreet 2025-01-17  1278  		      (flags & BCH_READ_must_bounce)))) {
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1279  			read_full = true;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1280  			bounce = true;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1281  		}
dff6de9518848b fs/bcachefs/io_read.c   Kent Overstreet 2024-12-30  1282  	} else {
dff6de9518848b fs/bcachefs/io_read.c   Kent Overstreet 2024-12-30  1283  		/*
dff6de9518848b fs/bcachefs/io_read.c   Kent Overstreet 2024-12-30  1284  		 * can happen if we retry, and the extent we were going to read
dff6de9518848b fs/bcachefs/io_read.c   Kent Overstreet 2024-12-30  1285  		 * has been merged in the meantime:
dff6de9518848b fs/bcachefs/io_read.c   Kent Overstreet 2024-12-30  1286  		 */
dff6de9518848b fs/bcachefs/io_read.c   Kent Overstreet 2024-12-30  1287  		if (pick.crc.compressed_size > u->op.wbio.bio.bi_iter.bi_size) {
dff6de9518848b fs/bcachefs/io_read.c   Kent Overstreet 2024-12-30  1288  			if (ca)
cca2c0d224c17c fs/bcachefs/io_read.c   Kent Overstreet 2025-04-18  1289  				enumerated_ref_put(&ca->io_ref[READ],
cca2c0d224c17c fs/bcachefs/io_read.c   Kent Overstreet 2025-04-18  1290  					BCH_DEV_READ_REF_io_read);
09b9c72bd4b77a fs/bcachefs/io_read.c   Kent Overstreet 2025-05-28  1291  			rbio->ret = bch_err_throw(c, data_read_buffer_too_small);
881b598ef144a1 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-08  1292  			goto out_read_done;
dff6de9518848b fs/bcachefs/io_read.c   Kent Overstreet 2024-12-30  1293  		}
dff6de9518848b fs/bcachefs/io_read.c   Kent Overstreet 2024-12-30  1294  
dff6de9518848b fs/bcachefs/io_read.c   Kent Overstreet 2024-12-30  1295  		iter.bi_size	= pick.crc.compressed_size << 9;
3fb8bacb14b6fb fs/bcachefs/io_read.c   Kent Overstreet 2025-03-12  1296  		read_full = true;
dff6de9518848b fs/bcachefs/io_read.c   Kent Overstreet 2024-12-30  1297  	}
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1298  
312c51e00acfd6 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1299  	rbio = read_extent_rbio_alloc(trans, orig, iter, read_pos, data_btree, k,
312c51e00acfd6 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1300  				      pick, ca, offset_into_extent, failed, flags,
312c51e00acfd6 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1301  				      bounce, read_full, narrow_crcs);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1302  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1303  	/*
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1304  	 * If it's being moved internally, we don't want to flag it as a cache
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1305  	 * hit:
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1306  	 */
3fb8bacb14b6fb fs/bcachefs/io_read.c   Kent Overstreet 2025-03-12 @1307  	if (ca && pick.ptr.cached && !u)
                                                                                    ^^
There are a number of places which assume "ca" can be NULL

1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1308  		bch2_bucket_io_time_reset(trans, pick.ptr.dev,
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1309  			PTR_BUCKET_NR(ca, &pick.ptr), READ);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1310  
dbac8feb23382a fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1311  	/*
dbac8feb23382a fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1312  	 * Unlock the iterator while the btree node's lock is still in
dbac8feb23382a fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1313  	 * cache, before doing the IO:
dbac8feb23382a fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1314  	 */
9157b3ddfb151d fs/bcachefs/io_read.c   Kent Overstreet 2025-01-17  1315  	if (!(flags & BCH_READ_in_retry))
dbac8feb23382a fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1316  		bch2_trans_unlock(trans);
dbac8feb23382a fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1317  	else
dbac8feb23382a fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1318  		bch2_trans_unlock_long(trans);
dbac8feb23382a fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1319  
be31e412ac01f4 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-08  1320  	if (likely(!rbio->pick.do_ec_reconstruct)) {
f7727a6767277a fs/bcachefs/io_read.c   Kent Overstreet 2024-09-28  1321  		if (unlikely(!rbio->have_ioref)) {
3d8e248b2e15f0 fs/bcachefs/data/read.c Kent Overstreet 2025-10-06  1322  			ret = bch_err_throw(c, data_read_retry_device_offline);
a87e7d26cb7538 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1323  			bch2_rbio_error(rbio, ret);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1324  			goto out;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1325  		}
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1326  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10 @1327  		this_cpu_add(ca->io_done->sectors[READ][BCH_DATA_user],
                                                                                                     ^^^^

1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1328  			     bio_sectors(&rbio->bio));
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1329  		bio_set_dev(&rbio->bio, ca->disk_sb.bdev);
                                                                                                                ^^^^^^^^^^^
Unchecked dereferences.

1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1330  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1331  		if (unlikely(c->opts.no_data_io)) {
9157b3ddfb151d fs/bcachefs/io_read.c   Kent Overstreet 2025-01-17  1332  			if (likely(!(flags & BCH_READ_in_retry)))
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1333  				bio_endio(&rbio->bio);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1334  		} else {
9157b3ddfb151d fs/bcachefs/io_read.c   Kent Overstreet 2025-01-17  1335  			if (likely(!(flags & BCH_READ_in_retry)))
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1336  				submit_bio(&rbio->bio);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1337  			else
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1338  				submit_bio_wait(&rbio->bio);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1339  		}
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1340  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1341  		/*
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1342  		 * We just submitted IO which may block, we expect relock fail
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1343  		 * events and shouldn't count them:
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1344  		 */
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1345  		trans->notrace_relock_fail = true;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1346  	} else {
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1347  		/* Attempting reconstruct read: */
2aee59eb212266 fs/bcachefs/io_read.c   Kent Overstreet 2024-09-07  1348  		if (bch2_ec_read_extent(trans, rbio, k)) {
3d8e248b2e15f0 fs/bcachefs/data/read.c Kent Overstreet 2025-10-06  1349  			ret = bch_err_throw(c, data_read_retry_ec_reconstruct_err);
a87e7d26cb7538 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1350  			bch2_rbio_error(rbio, ret);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1351  			goto out;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1352  		}
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1353  
9157b3ddfb151d fs/bcachefs/io_read.c   Kent Overstreet 2025-01-17  1354  		if (likely(!(flags & BCH_READ_in_retry)))
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1355  			bio_endio(&rbio->bio);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1356  	}
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1357  out:
9157b3ddfb151d fs/bcachefs/io_read.c   Kent Overstreet 2025-01-17  1358  	if (likely(!(flags & BCH_READ_in_retry))) {
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1359  		return 0;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1360  	} else {
dbac8feb23382a fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1361  		bch2_trans_unlock(trans);
dbac8feb23382a fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1362  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1363  		int ret;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1364  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1365  		rbio->context = RBIO_CONTEXT_UNBOUND;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1366  		bch2_read_endio(&rbio->bio);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1367  
943f0cfb1559ac fs/bcachefs/io_read.c   Kent Overstreet 2025-03-07  1368  		ret = rbio->ret;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1369  		rbio = bch2_rbio_free(rbio);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1370  
0806a669f58030 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1371  		if (bch2_err_matches(ret, BCH_ERR_data_read_retry_avoid) ||
0806a669f58030 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1372  		    bch2_err_matches(ret, BCH_ERR_blockdev_io_error)) {
2a82b05ef052c3 fs/bcachefs/data/read.c Kent Overstreet 2025-11-24  1373  			bch2_mark_io_failure(failed, &pick, ret);
44c1946444a82a fs/bcachefs/data/read.c Kent Overstreet 2025-11-05  1374  			propagate_io_error_to_data_update(c, rbio, &pick);
0bf6463036f1c7 fs/bcachefs/data/read.c Kent Overstreet 2025-10-16  1375  		}
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1376  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1377  		return ret;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1378  	}
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1379  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1380  err:
9157b3ddfb151d fs/bcachefs/io_read.c   Kent Overstreet 2025-01-17  1381  	if (flags & BCH_READ_in_retry)
943f0cfb1559ac fs/bcachefs/io_read.c   Kent Overstreet 2025-03-07  1382  		return ret;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1383  
943f0cfb1559ac fs/bcachefs/io_read.c   Kent Overstreet 2025-03-07  1384  	orig->ret = ret;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1385  	goto out_read_done;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1386  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1387  hole:
1949a429883eb0 fs/bcachefs/data/read.c Kent Overstreet 2025-11-22  1388  	this_cpu_add(c->counters.now[BCH_COUNTER_io_read_hole],
157ea5834133c0 fs/bcachefs/io_read.c   Kent Overstreet 2025-02-03  1389  		     bvec_iter_sectors(iter));
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1390  	/*
3fb8bacb14b6fb fs/bcachefs/io_read.c   Kent Overstreet 2025-03-12  1391  	 * won't normally happen in the data update (bch2_move_extent()) path,
3fb8bacb14b6fb fs/bcachefs/io_read.c   Kent Overstreet 2025-03-12  1392  	 * but if we retry and the extent we wanted to read no longer exists we
3fb8bacb14b6fb fs/bcachefs/io_read.c   Kent Overstreet 2025-03-12  1393  	 * have to signal that:
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1394  	 */
3fb8bacb14b6fb fs/bcachefs/io_read.c   Kent Overstreet 2025-03-12  1395  	if (u)
09b9c72bd4b77a fs/bcachefs/io_read.c   Kent Overstreet 2025-05-28  1396  		orig->ret = bch_err_throw(c, data_read_key_overwritten);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1397  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1398  	zero_fill_bio_iter(&orig->bio, iter);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1399  out_read_done:
de73677ff8e677 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-08  1400  	if ((flags & BCH_READ_last_fragment) &&
de73677ff8e677 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-08  1401  	    !(flags & BCH_READ_in_retry))
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1402  		bch2_rbio_done(orig);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1403  	return 0;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1404  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

