Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51BC1AC89B
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 13:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727269778; cv=none; b=fiUOQ/viWjdsa+hh5lVmdGfWkAf6NJayiKKz8+dajFeSe3T5nXWnldy3BpWv4di5bcGc/SAxxSnsXSbIBnPYDS8p0YAyStSjqHBK7qiaIGsVnhxLIG9vColUaXz45f6e/9Rt+2trfAuxiMIE6THUKignnn5dDcp3/pJVtJkoBbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727269778; c=relaxed/simple;
	bh=T3JNfUWgBdH+hKUK/5fnXfZX4/ZTF7Vbo+o9GxvIhNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p8o8uDGCKXcyJAOm/ZHe8jRBsBnFhMUjO0piQwEcy45sABbL0kv2SGTsxrUaj1rujqEysKc/Vv60zHpn04PQdtTAohvX5HQsdNCprZcvsvBTe3pKKlolpydiIPNYcwgX9LXVKJAfOqDLc/MedessO13izH/1BQsG1absAKw6+Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=miJ50q5R; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="miJ50q5R"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42cd46f3a26so58938495e9.2
        for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 06:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727269775; x=1727874575; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rVqWuWEERgwZ9pyHgMy9d7XK7XWIP6rNolKEYZdSUTA=;
        b=miJ50q5Rx+7gyb3+kZgR6AW7X4Yt9a01R+e9oYogUuy5vUfqLNnhKxDckmzlLfSfIc
         58J7UfDFAwviuEhbKaagcuHbkyZf0Grg7MJ1epwfpDFJgbWhRzdyqqGnuIasZcLVTM+a
         Mo3qV9NSGqd8NsOW3eVEHqdVEXLdU4EDnHy0pnM7kIc+yn9xLj3pZhp+zQ/VqHCcXKjO
         AWFE2ZHm3OkGvtOgNZuKecKhsdNxVo2nU3Xmvg1xBe4W4XELiItKIaoJPpOquwamKMki
         LfIr+Fu85OFq+LQHA39rSRtf+ITq3UtdsmTxedHlOA4R6lhvd4Y7SmOHW2ZvWjXNdIU/
         ADLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727269775; x=1727874575;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rVqWuWEERgwZ9pyHgMy9d7XK7XWIP6rNolKEYZdSUTA=;
        b=oyr6xy2/IScZU99o4LAnOFHVbq5RnHwyFKDdyTqZfSXr0WWKVy7jeGSvQeO/g5Jtpa
         EasZUIDni5ePyCuRQh6ajdt1gjkErf4pE/UGXi/VKCIPiuR8D+HsNROF0Moch9pC27RV
         Chm90oJoSuY1n4j3SPtStwDlul7tlvlKkY9FGlXeBmBUk/MUVbuytg+hayEHG2fCTOP1
         Quh3y4RH39OrwUWuKWojMXdk1fOTg4v9v/gHtUmftseEjI3bjN+khjQa7VjTzL/kuFHa
         G7jTHALLZqlgIxBN3NbVgIpTgYXCvN08fVgEAoHGD9pAHwoUWhbljwdfJ6dJ9UbBYU1q
         OFYg==
X-Gm-Message-State: AOJu0Yw0o0ODqBxwUjEk08hD5HPU4XD9n1Gn++tqRMZWnhJjb0KAvwxC
	fbBx5giu6zasONYqwTk6Mtc7mYVfxGkeWX7K6WG2fU5QPvw6fMDHhORu9yPyCYThb22iKhCEEKi
	6
X-Google-Smtp-Source: AGHT+IF06Zc2qPgVL0O5UKYNo3HFsDJlGL3fZ3pagCdKs5ykn7TTIfh2g6GWn2uBcUtM5Zrm7EcdsA==
X-Received: by 2002:a05:600c:4f55:b0:42c:bd5b:cb53 with SMTP id 5b1f17b1804b1-42e96146bfemr18099425e9.23.1727269774800;
        Wed, 25 Sep 2024 06:09:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969e1967sm18368295e9.6.2024.09.25.06.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 06:09:34 -0700 (PDT)
Date: Wed, 25 Sep 2024 16:09:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_s 9912/30000] fs/incfs/vfs.c:1222
 ioctl_create_file() warn: 'named_file_dentry' is an error pointer or valid
Message-ID: <c017d49b-4895-4a73-90b9-95f3f2fefa70@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   84d5fc421289417e51781e27e64fbb0fc44216ae
commit: 040942fc50b20325bb56737c32b303268bb6f35c [9912/30000] ANDROID: Initial commit of Incremental FS
config: x86_64-randconfig-161-20240914 (https://download.01.org/0day-ci/archive/20240922/202409221052.YsEbHigM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409221052.YsEbHigM-lkp@intel.com/

smatch warnings:
fs/incfs/vfs.c:1222 ioctl_create_file() warn: 'named_file_dentry' is an error pointer or valid
fs/incfs/vfs.c:2153 incfs_mount_fs() warn: passing zero to 'ERR_PTR'

vim +/named_file_dentry +1222 fs/incfs/vfs.c

040942fc50b203 Eugene Zemtsov 2019-11-18  1213  	if (parent_dir_path.dentry == mi->mi_index_dir) {
040942fc50b203 Eugene Zemtsov 2019-11-18  1214  		/* Can't create a file directly inside .index */
040942fc50b203 Eugene Zemtsov 2019-11-18  1215  		error = -EBUSY;
040942fc50b203 Eugene Zemtsov 2019-11-18  1216  		goto out;
040942fc50b203 Eugene Zemtsov 2019-11-18  1217  	}
040942fc50b203 Eugene Zemtsov 2019-11-18  1218  
040942fc50b203 Eugene Zemtsov 2019-11-18  1219  	/* Look up a dentry in the parent dir. It should be negative. */
040942fc50b203 Eugene Zemtsov 2019-11-18  1220  	named_file_dentry = incfs_lookup_dentry(parent_dir_path.dentry,
040942fc50b203 Eugene Zemtsov 2019-11-18  1221  					file_name);
040942fc50b203 Eugene Zemtsov 2019-11-18 @1222  	if (!named_file_dentry) {

incfs_lookup_dentry() never returns NULL, only error pointers.  There are some
VFS functions which return NULL for File NOT Found and error pointer for other
types of errors.  Explained in my blog:
https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

But this isn't one of those.

This file has other similar issues, which the zero day bot does not find.

040942fc50b203 Eugene Zemtsov 2019-11-18  1223  		error = -EFAULT;
040942fc50b203 Eugene Zemtsov 2019-11-18  1224  		goto out;
040942fc50b203 Eugene Zemtsov 2019-11-18  1225  	}
040942fc50b203 Eugene Zemtsov 2019-11-18  1226  	if (IS_ERR(named_file_dentry)) {
040942fc50b203 Eugene Zemtsov 2019-11-18  1227  		error = PTR_ERR(named_file_dentry);
040942fc50b203 Eugene Zemtsov 2019-11-18  1228  		named_file_dentry = NULL;
040942fc50b203 Eugene Zemtsov 2019-11-18  1229  		goto out;
040942fc50b203 Eugene Zemtsov 2019-11-18  1230  	}
040942fc50b203 Eugene Zemtsov 2019-11-18  1231  	if (d_really_is_positive(named_file_dentry)) {
040942fc50b203 Eugene Zemtsov 2019-11-18  1232  		/* File with this path already exists. */
040942fc50b203 Eugene Zemtsov 2019-11-18  1233  		error = -EEXIST;
040942fc50b203 Eugene Zemtsov 2019-11-18  1234  		goto out;
040942fc50b203 Eugene Zemtsov 2019-11-18  1235  	}
040942fc50b203 Eugene Zemtsov 2019-11-18  1236  	/* Look up a dentry in the .index dir. It should be negative. */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

