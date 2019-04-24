import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MoreMeComponent } from './more-me.component';

describe('MoreMeComponent', () => {
  let component: MoreMeComponent;
  let fixture: ComponentFixture<MoreMeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MoreMeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MoreMeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
