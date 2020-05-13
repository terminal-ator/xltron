package main

import "testing"

func TestSaveCsvToDB(t *testing.T) {
	type args struct {
		filename  string
		keys      map[string]string
		company   string
		saleID    int32
		companyID int64
	}
	tests := []struct {
		name    string
		args    args
		want    int
		want1   int
		wantErr bool
	}{
		// TODO: Add test cases.
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got, got1, err := SaveCsvToDB(tt.args.filename, tt.args.keys, tt.args.company, tt.args.saleID, tt.args.companyID)
			if (err != nil) != tt.wantErr {
				t.Errorf("SaveCsvToDB() error = %v, wantErr %v", err, tt.wantErr)
				return
			}
			if got != tt.want {
				t.Errorf("SaveCsvToDB() got = %v, want %v", got, tt.want)
			}
			if got1 != tt.want1 {
				t.Errorf("SaveCsvToDB() got1 = %v, want %v", got1, tt.want1)
			}
		})
	}
}

func TestSaveCsvToDB1(t *testing.T) {
	type args struct {
		filename  string
		keys      map[string]string
		company   string
		saleID    int32
		companyID int64
	}
	tests := []struct {
		name    string
		args    args
		want    int
		want1   int
		wantErr bool
	}{
		{
			name: "Test 1",
			args: args{
				filename:  "sales_april.csv2020-04-17T11:07:10+05:30.json",
				company:   "Marg",
				keys: map[string]string{
					"name":   "name",
					"date":   "date",
					"amount": "amount",
					"billno": "billno",
				},
				saleID:    8353,
				companyID: 1,
			},
			want: 201,
			want1: 0,
			wantErr: false,
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got, got1, err := SaveCsvToDB(tt.args.filename, tt.args.keys, tt.args.company, tt.args.saleID, tt.args.companyID)
			if (err != nil) != tt.wantErr {
				t.Errorf("SaveCsvToDB() error = %v, wantErr %v", err, tt.wantErr)
				return
			}
			if got != tt.want {
				t.Errorf("SaveCsvToDB() got = %v, want %v", got, tt.want)
			}
			if got1 != tt.want1 {
				t.Errorf("SaveCsvToDB() got1 = %v, want %v", got1, tt.want1)
			}
		})
	}
}