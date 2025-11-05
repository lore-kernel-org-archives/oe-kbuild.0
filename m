Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FD1333452
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Nov 2025 20:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762375060; cv=none; b=NVOR08qoBHElqeukZmoAS1PFHfUlIue5N+rKcPnWcwcATaoPiZuqq5/G6jfdyqFesNB04BPoHmgEZWlOTKQkO4SnHqaYVc16uUXsgDKlXD/y3KaHsre+fYeVVNgn8aiOl0GpHpfseO6oHzq7vcxDnbaQsBMAEdn9S09J/tce5s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762375060; c=relaxed/simple;
	bh=ExXlSlFznARu5X2fbablrgQn7X+UWQDKcmncyHJ6Wow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HHfx7R4fYVTLllCcDWU+C4il5YiXD16ZVWGAS08m/4Bn9FdAsiq/sursnM2NF+HB+Sez+IRvym0Zi5Q4t/XvyAjOWzXBXuww7gBFTE/ml1Z9s0DbUWXA0uHbYuwzsjEie7mh8slceR7dBGEyJbKJ7mXAMhmmIzwX4CNgvfGuwbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=V4A1dI9t; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="V4A1dI9t"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b7200568b13so43659366b.1
        for <oe-kbuild@lists.linux.dev>; Wed, 05 Nov 2025 12:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762375055; x=1762979855; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fZBgD4ZZSu93myN+BjJl3OLl+uAoi6JuCLuDCbBPyoM=;
        b=V4A1dI9ty1f46HxCAA4kvSz+qO5V+MXnSWyTQ4I99NmnsYXPV6dp/tu75aLETX16pg
         WWDay8EuW1WezpECru/JbNJgW94HVX1QTrj3FAakcb9JRP3G8ApkUf13Mc5EARuL3Ljp
         GZyixaMIPo0IMwKN6+bBBGDKLT1iSseKsIaIIM8u9EMSb7wPJUTeXPso1OD8Gb09DJLN
         8ICqHl3uWDNr4z6chIi8wwinz+WqeUJFhKnP3Vc04nSN/qHISIwjHb0DxZ/vcqjhhhfH
         ORR9cMU3Hij3iq3t4XT9XnU18UixFWbr+Rq5coihXX6ZXDaka9+vT8xLGlqNvtC/RT6A
         MODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762375055; x=1762979855;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZBgD4ZZSu93myN+BjJl3OLl+uAoi6JuCLuDCbBPyoM=;
        b=N1Lijk514Zly0zubqfSl+TCwNJFYnvCL9a4bRvzoiKqHv1k5azziEg8RR2NC5c9q6v
         vBWdOgJzjyHe4IsL2nY2IniGOEcrLWkDFGVMf3k7OMLHQFGAHEdLj8Fhnzx+yFNs216N
         BbfYfFud0gGp+XoxguzSuCcvpV+8ubgiZqKXMh9LZMaIw0FawJqCES9HkbWuxQ70axFM
         nFSL31lh6AAEvEQt+NgEL3BTT/EyDlcPqZrdGpL5h0ZnLTe/l+lS66LYY5mlVp2/DbHY
         shU4nhv2IYz0DOg4tIaC1LXEN2Jzeq2NkJMED2gq23JCY9nhATykPdFPCuy0klDJIY/i
         edSA==
X-Forwarded-Encrypted: i=1; AJvYcCU6uEj71Vuuw7/JZSbTHlhG0b/ipDv89C6To8q9jaaezy17a6loGVaYZaqj31ZtspxDXfXAQV46lAM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwH130hSChGBPTUfvzlkYBIOaaMNR1wvGW89ySUTdUmycIwndE1
	X31xOqFWHMJIgDVtVTkQXinOEppZp7Qsb3oJsVj51e8WNm1WfMCqStGJE7BsQ8TGSWs=
X-Gm-Gg: ASbGncvWUHRqaTTch9Rv/1hixkMXKtoxFnhxY7qrcV4uqbc/ozFU0BMq3M0BwVw/Y2b
	y07v1kcvohAoI23U6s6Pq8lgSKl/3c70uHQqQfWTzLaelsPPYmyS1YLOJsy1Mfn6GrQUmr1jGVH
	pprOpF8m/oSH69belpYTzvtoRl8WN/eXB7qupZLtlkBUSL1qlEJqxDtnb/Ui3wjczIN39eO1YQJ
	ulo130XL0ESPHEAgtjntG1fuJ8y7fIHZfXLQbg0aHL1ovGPN0TrXzGNK+pDtJVctD9VqT4l/LtN
	oMWC1TYWY8nLISY/GSyw9L9HzFrRHAnRaySdgycoCo8KRw3d+etMuhOZnKB/tk8W+UpFICqG7/m
	+GDNLZQXfprEzZNIBk8rds95g8sM9k6LX+1Rnv72OreEBR3AD7nE9Pz2ufXqWg2ZUBZ6DmOCT05
	h4KaZHXfl+x7JIlv+yXUqcRXsPa+ed
X-Google-Smtp-Source: AGHT+IFfdmWSnz5BkQbh1GAHKyAOhd0B6BV6Ki9184eLMI1VAk0j/xIAzIkMv7uX0J8j+BaIkSdhrw==
X-Received: by 2002:a17:906:4783:b0:b6d:7f24:8428 with SMTP id a640c23a62f3a-b726567f639mr541521766b.54.1762375054742;
        Wed, 05 Nov 2025 12:37:34 -0800 (PST)
Received: from ?IPV6:2403:580d:fda1::e9d? (2403-580d-fda1--e9d.ip6.aussiebb.net. [2403:580d:fda1::e9d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-296509683easm4325085ad.15.2025.11.05.12.37.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 12:37:34 -0800 (PST)
Message-ID: <c4b56f0b-a535-4ed8-917a-b3d8b6cfd4ab@suse.com>
Date: Thu, 6 Nov 2025 07:07:29 +1030
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 5952/6507] fs/btrfs/bio.c:740
 btrfs_submit_chunk() warn: variable dereferenced before check 'inode' (see
 line 665)
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 David Sterba <dsterba@suse.com>
References: <f75f6edb-d9dc-49f2-a626-af74ef39ded5@suswa.mountain>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXVgBQkQ/lqxAAoJEMI9kfOh
 Jf6o+jIH/2KhFmyOw4XWAYbnnijuYqb/obGae8HhcJO2KIGcxbsinK+KQFTSZnkFxnbsQ+VY
 fvtWBHGt8WfHcNmfjdejmy9si2jyy8smQV2jiB60a8iqQXGmsrkuR+AM2V360oEbMF3gVvim
 2VSX2IiW9KERuhifjseNV1HLk0SHw5NnXiWh1THTqtvFFY+CwnLN2GqiMaSLF6gATW05/sEd
 V17MdI1z4+WSk7D57FlLjp50F3ow2WJtXwG8yG8d6S40dytZpH9iFuk12Sbg7lrtQxPPOIEU
 rpmZLfCNJJoZj603613w/M8EiZw6MohzikTWcFc55RLYJPBWQ+9puZtx1DopW2jOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXWBBQkQ/lrSAAoJEMI9kfOhJf6o
 cakH+QHwDszsoYvmrNq36MFGgvAHRjdlrHRBa4A1V1kzd4kOUokongcrOOgHY9yfglcvZqlJ
 qfa4l+1oxs1BvCi29psteQTtw+memmcGruKi+YHD7793zNCMtAtYidDmQ2pWaLfqSaryjlzR
 /3tBWMyvIeWZKURnZbBzWRREB7iWxEbZ014B3gICqZPDRwwitHpH8Om3eZr7ygZck6bBa4MU
 o1XgbZcspyCGqu1xF/bMAY2iCDcq6ULKQceuKkbeQ8qxvt9hVxJC2W3lHq8dlK1pkHPDg9wO
 JoAXek8MF37R8gpLoGWl41FIUb3hFiu3zhDDvslYM4BmzI18QgQTQnotJH8=
In-Reply-To: <f75f6edb-d9dc-49f2-a626-af74ef39ded5@suswa.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2025/11/6 03:10, Dan Carpenter 写道:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   84d39fb9d529f27d2f3d295430d1be0abdae7a6d
> commit: b61fb56b832da658b61f93b6fe0daa5663baef81 [5952/6507] btrfs: remove btrfs_bio::fs_info by extracting it from btrfs_bio::inode
> config: um-randconfig-r073-20251105 (https://download.01.org/0day-ci/archive/20251105/202511052053.zZZ5GjNx-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202511052053.zZZ5GjNx-lkp@intel.com/
> 
> smatch warnings:
> fs/btrfs/bio.c:740 btrfs_submit_chunk() warn: variable dereferenced before check 'inode' (see line 665)

Thanks for the report.
Although this one is a false alert, I'll update the patches to remove 
this alert.

> 
> vim +/inode +740 fs/btrfs/bio.c
> 
> ae42a154ca8972 Christoph Hellwig  2023-03-07  662  static bool btrfs_submit_chunk(struct btrfs_bio *bbio, int mirror_num)
> 103c19723c80bf Christoph Hellwig  2022-11-15  663  {
> d5e4377d505189 Christoph Hellwig  2023-01-21  664  	struct btrfs_inode *inode = bbio->inode;
> b61fb56b832da6 Qu Wenruo          2025-10-29 @665  	struct btrfs_fs_info *fs_info = inode->root->fs_info;
> ae42a154ca8972 Christoph Hellwig  2023-03-07  666  	struct bio *bio = &bbio->bio;
> adbe7e388e4239 Anand Jain         2023-04-15  667  	u64 logical = bio->bi_iter.bi_sector << SECTOR_SHIFT;
> 103c19723c80bf Christoph Hellwig  2022-11-15  668  	u64 length = bio->bi_iter.bi_size;
> 103c19723c80bf Christoph Hellwig  2022-11-15  669  	u64 map_length = length;
> 921603c76246a7 Christoph Hellwig  2022-12-12  670  	bool use_append = btrfs_use_zone_append(bbio);
> 103c19723c80bf Christoph Hellwig  2022-11-15  671  	struct btrfs_io_context *bioc = NULL;
> 103c19723c80bf Christoph Hellwig  2022-11-15  672  	struct btrfs_io_stripe smap;
> beaa7cdb6a1fef David Sterba       2025-04-23  673  	blk_status_t status;
> 9c0b0807ece11e David Sterba       2025-04-23  674  	int ret;
> 103c19723c80bf Christoph Hellwig  2022-11-15  675
> b61fb56b832da6 Qu Wenruo          2025-10-29  676  	if (bbio->is_scrub || btrfs_is_data_reloc_root(inode->root))
> 
> Unchecked dereference
> 
> f4d39cf1cebfb8 Johannes Thumshirn 2024-07-31  677  		smap.rst_search_commit_root = true;
> f4d39cf1cebfb8 Johannes Thumshirn 2024-07-31  678  	else
> f4d39cf1cebfb8 Johannes Thumshirn 2024-07-31  679  		smap.rst_search_commit_root = false;
> 9acaa64187f9b4 Johannes Thumshirn 2023-09-14  680
> 103c19723c80bf Christoph Hellwig  2022-11-15  681  	btrfs_bio_counter_inc_blocked(fs_info);
> 9c0b0807ece11e David Sterba       2025-04-23  682  	ret = btrfs_map_block(fs_info, btrfs_op(bio), logical, &map_length,
> 9fb2acc2fe07f1 Qu Wenruo          2023-09-17  683  			      &bioc, &smap, &mirror_num);
> 9c0b0807ece11e David Sterba       2025-04-23  684  	if (ret) {
> 9c0b0807ece11e David Sterba       2025-04-23  685  		status = errno_to_blk_status(ret);
> c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  686  		btrfs_bio_counter_dec(fs_info);
> c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  687  		goto end_bbio;
> 103c19723c80bf Christoph Hellwig  2022-11-15  688  	}
> 103c19723c80bf Christoph Hellwig  2022-11-15  689
> 852eee62d31abd Christoph Hellwig  2023-01-21  690  	map_length = min(map_length, length);
> d5e4377d505189 Christoph Hellwig  2023-01-21  691  	if (use_append)
> b35243a447b9fe Christoph Hellwig  2024-08-26  692  		map_length = btrfs_append_map_length(bbio, map_length);
> d5e4377d505189 Christoph Hellwig  2023-01-21  693
> 103c19723c80bf Christoph Hellwig  2022-11-15  694  	if (map_length < length) {
> c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  695  		struct btrfs_bio *split;
> c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  696
> c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  697  		split = btrfs_split_bio(fs_info, bbio, map_length);
> c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  698  		if (IS_ERR(split)) {
> beaa7cdb6a1fef David Sterba       2025-04-23  699  			status = errno_to_blk_status(PTR_ERR(split));
> c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  700  			btrfs_bio_counter_dec(fs_info);
> c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  701  			goto end_bbio;
> c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  702  		}
> c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  703  		bbio = split;
> 2cef0c79bb81d8 Christoph Hellwig  2023-03-07  704  		bio = &bbio->bio;
> 103c19723c80bf Christoph Hellwig  2022-11-15  705  	}
> 103c19723c80bf Christoph Hellwig  2022-11-15  706
> 1c2b3ee3b0ec4b Christoph Hellwig  2023-01-21  707  	/*
> 1c2b3ee3b0ec4b Christoph Hellwig  2023-01-21  708  	 * Save the iter for the end_io handler and preload the checksums for
> 1c2b3ee3b0ec4b Christoph Hellwig  2023-01-21  709  	 * data reads.
> 1c2b3ee3b0ec4b Christoph Hellwig  2023-01-21  710  	 */
> fbe960877b6f43 Christoph Hellwig  2023-05-31  711  	if (bio_op(bio) == REQ_OP_READ && is_data_bbio(bbio)) {
> 0d3acb25e70d5f Christoph Hellwig  2023-01-21  712  		bbio->saved_iter = bio->bi_iter;
> 9c0b0807ece11e David Sterba       2025-04-23  713  		ret = btrfs_lookup_bio_sums(bbio);
> 9c0b0807ece11e David Sterba       2025-04-23  714  		status = errno_to_blk_status(ret);
> beaa7cdb6a1fef David Sterba       2025-04-23  715  		if (status)
> 10d9d8c3512f16 Qu Wenruo          2024-08-17  716  			goto fail;
> 1c2b3ee3b0ec4b Christoph Hellwig  2023-01-21  717  	}
> 7276aa7d38255b Christoph Hellwig  2023-01-21  718
> f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  719  	if (btrfs_op(bio) == BTRFS_MAP_WRITE) {
> d5e4377d505189 Christoph Hellwig  2023-01-21  720  		if (use_append) {
> d5e4377d505189 Christoph Hellwig  2023-01-21  721  			bio->bi_opf &= ~REQ_OP_WRITE;
> d5e4377d505189 Christoph Hellwig  2023-01-21  722  			bio->bi_opf |= REQ_OP_ZONE_APPEND;
> 69ccf3f4244abc Christoph Hellwig  2023-01-21  723  		}
> 69ccf3f4244abc Christoph Hellwig  2023-01-21  724
> 9c48bcec47c8dd Johannes Thumshirn 2024-12-16  725  		if (is_data_bbio(bbio) && bioc && bioc->use_rst) {
> 02c372e1f016e5 Johannes Thumshirn 2023-09-14  726  			/*
> 02c372e1f016e5 Johannes Thumshirn 2023-09-14  727  			 * No locking for the list update, as we only add to
> 02c372e1f016e5 Johannes Thumshirn 2023-09-14  728  			 * the list in the I/O submission path, and list
> 02c372e1f016e5 Johannes Thumshirn 2023-09-14  729  			 * iteration only happens in the completion path, which
> 02c372e1f016e5 Johannes Thumshirn 2023-09-14  730  			 * can't happen until after the last submission.
> 02c372e1f016e5 Johannes Thumshirn 2023-09-14  731  			 */
> 02c372e1f016e5 Johannes Thumshirn 2023-09-14  732  			btrfs_get_bioc(bioc);
> 02c372e1f016e5 Johannes Thumshirn 2023-09-14  733  			list_add_tail(&bioc->rst_ordered_entry, &bbio->ordered->bioc_list);
> 02c372e1f016e5 Johannes Thumshirn 2023-09-14  734  		}
> 02c372e1f016e5 Johannes Thumshirn 2023-09-14  735
> f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  736  		/*
> f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  737  		 * Csum items for reloc roots have already been cloned at this
> f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  738  		 * point, so they are handled as part of the no-checksum case.
> f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  739  		 */
> 4317ff0056bedf Qu Wenruo          2023-03-23 @740  		if (inode && !(inode->flags & BTRFS_INODE_NODATASUM) &&
>                                                                      ^^^^^
> Checked too late

Now @inode will always be set, thus this old check is no longer needed.

Thanks,
Qu

> 
> 169aaaf2e0be61 Qu Wenruo          2024-06-14  741  		    !test_bit(BTRFS_FS_STATE_NO_DATA_CSUMS, &fs_info->fs_state) &&
> d5e4377d505189 Christoph Hellwig  2023-01-21  742  		    !btrfs_is_data_reloc_root(inode->root)) {
> f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  743  			if (should_async_write(bbio) &&
> f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  744  			    btrfs_wq_submit_bio(bbio, bioc, &smap, mirror_num))
> 852eee62d31abd Christoph Hellwig  2023-01-21  745  				goto done;
> 103c19723c80bf Christoph Hellwig  2022-11-15  746
> 9c0b0807ece11e David Sterba       2025-04-23  747  			ret = btrfs_bio_csum(bbio);
> 9c0b0807ece11e David Sterba       2025-04-23  748  			status = errno_to_blk_status(ret);
> beaa7cdb6a1fef David Sterba       2025-04-23  749  			if (status)
> 10d9d8c3512f16 Qu Wenruo          2024-08-17  750  				goto fail;
> cebae292e0c32a Johannes Thumshirn 2024-06-07  751  		} else if (use_append ||
> cebae292e0c32a Johannes Thumshirn 2024-06-07  752  			   (btrfs_is_zoned(fs_info) && inode &&
> cebae292e0c32a Johannes Thumshirn 2024-06-07  753  			    inode->flags & BTRFS_INODE_NODATASUM)) {
> 853b5727c93dae David Sterba       2025-04-23  754  			ret = btrfs_alloc_dummy_sum(bbio);
> 853b5727c93dae David Sterba       2025-04-23  755  			status = errno_to_blk_status(ret);
> beaa7cdb6a1fef David Sterba       2025-04-23  756  			if (status)
> 10d9d8c3512f16 Qu Wenruo          2024-08-17  757  				goto fail;
> f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  758  		}
> 103c19723c80bf Christoph Hellwig  2022-11-15  759  	}
> f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  760
> 22b4ef50dc1d11 David Sterba       2024-08-27  761  	btrfs_submit_bio(bio, bioc, &smap, mirror_num);
> 852eee62d31abd Christoph Hellwig  2023-01-21  762  done:
> 852eee62d31abd Christoph Hellwig  2023-01-21  763  	return map_length == length;
> 9ba0004bd95e05 Christoph Hellwig  2023-01-21  764
> 9ba0004bd95e05 Christoph Hellwig  2023-01-21  765  fail:
> 9ba0004bd95e05 Christoph Hellwig  2023-01-21  766  	btrfs_bio_counter_dec(fs_info);
> 10d9d8c3512f16 Qu Wenruo          2024-08-17  767  	/*
> 10d9d8c3512f16 Qu Wenruo          2024-08-17  768  	 * We have split the original bbio, now we have to end both the current
> 10d9d8c3512f16 Qu Wenruo          2024-08-17  769  	 * @bbio and remaining one, as the remaining one will never be submitted.
> 10d9d8c3512f16 Qu Wenruo          2024-08-17  770  	 */
> 10d9d8c3512f16 Qu Wenruo          2024-08-17  771  	if (map_length < length) {
> 10d9d8c3512f16 Qu Wenruo          2024-08-17  772  		struct btrfs_bio *remaining = bbio->private;
> 10d9d8c3512f16 Qu Wenruo          2024-08-17  773
> 10d9d8c3512f16 Qu Wenruo          2024-08-17  774  		ASSERT(bbio->bio.bi_pool == &btrfs_clone_bioset);
> 10d9d8c3512f16 Qu Wenruo          2024-08-17  775  		ASSERT(remaining);
> 10d9d8c3512f16 Qu Wenruo          2024-08-17  776
> beaa7cdb6a1fef David Sterba       2025-04-23  777  		btrfs_bio_end_io(remaining, status);
> 10d9d8c3512f16 Qu Wenruo          2024-08-17  778  	}
> c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  779  end_bbio:
> beaa7cdb6a1fef David Sterba       2025-04-23  780  	btrfs_bio_end_io(bbio, status);
> 852eee62d31abd Christoph Hellwig  2023-01-21  781  	/* Do not submit another chunk */
> 852eee62d31abd Christoph Hellwig  2023-01-21  782  	return true;
> 852eee62d31abd Christoph Hellwig  2023-01-21  783  }
> 

